---
title: 분산DB 유일 ID 생성(feat. Django)
categories:
  - 백엔드
tags:
  - django
  - sqlite
  - 분산시스템
  - mysql
date: 2024-05-23T12:40:02+09:00
draft: false
featured: false
modified: 2024-05-25T15:14:01+09:00
---
## 유일 ID 생성 방식

일반적으로 분산 시스템에서 유일 ID를 생성하는 방법은 아래와 같다.
1. **DBMS Auto Increment 옵션 조정**
2. **UUID**
3. **티켓서버**
4. **Snowflake ID**

### 1. Auto Increment 옵션 조정
Auto Increment(Sequence) 은 대부분의 DBMS에 구현된 기능으로, 1씩 증가하는 값을 내놓도록 보장한다. 단일 DB 환경에서는 유일 ID를 쉽게 생성할 수 있다.

마스터 노드가 여러개인 분산 환경이 문제인데, mysql과 같은 DBMS는 이 Auto Increment의 증가폭과 시작값 옵션을 조정하여 분산 환경 내 유일한 ID를 생성할 수 있다.

예를 들어 DB1~ DB4 네개의 DB를 사용할때, Auto Increment 증가폭을 의미하는 `auto_increment_increment` 값을 4로 두고, 각 DB에 각기 다른 시작값(`auto_increment_offset`)을 부여할 수 있다. DB1 id는 1, 5, 9..., DB2 id는 2, 6, 10... 으로 DB 간 서로 다른 id 값을 갖도록 보장하는 것이다.

```sh
# DB1
[mysqld]
auto_increment_increment = 4  
auto_increment_offset = 1

# DB2
[mysqld]
auto_increment_increment = 4  
auto_increment_offset = 2

# DB3
[mysqld]
auto_increment_increment = 4  
auto_increment_offset = 3

# DB4
[mysqld]
auto_increment_increment = 4  
auto_increment_offset = 4
```

실제 `auto_increment_increment` 는 DB 증설 가능성을 고려하여 현재 가용 DB 수 보다 높게 잡는 것이 일반적이다.

### 2. UUID
UUID 는 128 비트 공간에 임의로 생성하는 값이다. 충돌 가능성이 매우 낮아, 유일성이 보장되는 id라 간주한다.

### 3. 티켓서버
auto_increment 를 제공하는 중앙집중형 서버를 두고, 분산 서버가 티켓서버에 유일 id를 요청하는 방식이다.

### 4. Snowflake ID
참고: [Snowflake ID]({{< ref "/posts/Snowflake ID.md" >}})



## 요구사항

유저별 계좌 거래내역을 저장하고, 조회할 수 있는 API를 제공해야했다. **거래내역 데이터는 1억개 이상**으로 커질 수 있다는 점을 고려해야하는 상황.


## 설계
사용자(`User`), 계좌(`Account`), 거래내역(`Transaction`) 3개의 테이블을 사용하고, **계좌와 거래내역 테이블을 수평 파티셔닝(샤딩)** 하여 저장하기로 결정했다. 사용자 테이블은 공통DB에 저장하며, 사용자 id(`user_id`)를 계좌 DB 라우팅에 사용한다.

**계좌와 거래내역 레코드를 시스템 내에서 식별할 수 있는 유일 ID가 필요**하다. 각 DB 내에서 유일함을 보장하는 `id` 필드가 존재하지만, 해당 테이블 데이터를 통합해서 봐야하는 경우가 얼마든지 생길 수 있다. 전체 데이터를 조회해야할 수도 있고, DB 증설 등으로 인해 데이터를 다른 DB로 옮겨야할 일이 종종 발생하기 때문이다.


### 테이블 설계
1. 계좌와 거래내역은 외래키를 이용해 1:N 관계를 맺는다. 
2. 사용자와 계좌 역시 1:N 관계이나 분산 저장을 위해 외래키를 이용하지 않는다.
3. 계좌와 거래내역은 자동 생성되는 id 필드 외에, 전체 시스템 내 유일한 id 필드를 가진다. 계좌는 `account_number`, 거래내역은 `uuid` 이다.

```py
class User(models.Model):
	"""
	사용자 모델
	"""
	
	id = models.AutoField(primary_key=True) # Unique ID
	username = models.CharField(max_length=150)
	password = models.CharField(max_length=128)
```

```py
class Account(models.Model):
	"""
	계좌 모델
	"""

	account_number = models.PositiveIntegerField( # Unique ID
		primary_key=True,  
		help_text="계좌번호"
	)
	user_id = models.PositiveIntegerField(help_text="사용자 id")
	balance = models.PositiveBigIntegerField(default=0, help_text="잔액")
	created_at = models.DateTimeField(auto_now_add=True)
```

```py
class Transaction(models.Model):
	"""
	거래내역 모델
	"""
	
	uuid = models.UUIDField( # Unique ID
		primary_key=True, 
		default=uuid.uuid4, 
		editable=False
	) 
	account = models.ForeignKey(
		Account,
		to_field="account_number",
		on_delete=models.CASCADE,
		related_name="transactions",
		help_text="계좌",
	)
	amount = models.PositiveBigIntegerField(help_text="거래금액")
	balance_after = models.PositiveBigIntegerField(default=0, help_text="거래 후 잔액")
	created_at = models.DateTimeField(auto_now_add=True)
```

###  라우팅 방식

1. `user_id`를 기준으로 라우팅한다. 모듈러 연산을 통해 특정 user의 계좌와 거래내역을 저장할 DB를 결정한다.

{{< image src="/images/Screenshot 2024-05-24 at 11.13.14 PM.png" >}}



## 유일 ID 생성 방식 선택

1. **Auto Increment** 를 이용하는 방식을 가장 우선적으로 생각해보았다. DBMS가 구현한 기능을 바로 쓸 수 있어 간편했고, DB 증설이 자주 발생하는 환경이 아니라면, 안정적으로 유일 ID를 생성하는 방법이기 때문이다.
2. 다만 해당 태스크 진행시 **SQLite를 DB로 써야하는 제약**이 있었고 SQLite는 Auto Increment 옵션 조정 기능을 명시적으로 제공하지 않았다. 다른 방식을 선택해야했다.
3. **UUID** 역시 매우 간편한 방식이다. 특별히 신경쓸 구현이 없고, UUIDField로 선언하면 되는 일이었다. 확장에 매우 열려있어 서버나 DB를 증설하더라도 걱정할 필요가 없다. 
4. 거래내역(`Transaction`) 테이블은 UUID를 이용해서 유일 ID를 생성하였다.
5. 하지만 계좌(`Account`) 테이블엔 UUID를 사용하지 않았는데, 필터링를 위해 계좌의 유일id(계좌번호)를  빈번히 사용하기 때문이다. API 경로에 계좌번호를 포함해 요청하는 상황이고, 인가나 거래내역 조회에 지속적으로 계좌번호를 사용해야했다. **UUID는 길고(128비트), 문자를 포함하여 비교에 취약**하다. UUID를 기본키나 인덱스로 사용하면 큰 폭의 성능 저하가 우려되었다.
6. 결국 **Auto Increment ID를 애플리케이션에서 생성**하는 방식(`create_unique_account_number`)으로 구현했다.
	1. 계좌 생성이 필요한 `user_id`를 입력받아 해당하는 DB로 라우팅한다. 
	2. DB 내 마지막 계좌의 id(계좌번호)를 읽어온다. 
	3. 가져온 id 값에 id 증가폭(`auto_increment_increment`)을 더해서 새로운 id를 만든다. 
	4. 가져온 id가 없다면 `auto_increment_offset` 값으로 id를 시작한다.
7. 티켓서버와 유사한 방식으로, 애플리케이션이 중앙집중형으로 DB를 관리하기에 사용 가능했다.


```py
def create_unique_account_number(user_id: int, db_name: str = None) -> int:
	"""
	분산 시스템 내 유일한 account_number를 생성합니다.
	account_number는 auto_increment_offset 부터 시작하며,
	auto_increment_increment 만큼 증가합니다.
	"""
	
	auto_increment_increment = settings.MAX_ACCOUNT_DB_COUNT
	auto_increment_offset = user_id % settings.ACCOUNT_DB_COUNT + 1
	
	if not db_name:
	db_name = get_account_db_name(user_id=user_id)
	
	last_account = Account.objects.using(db_name).last()
	last_account_number = last_account.account_number if last_account else 0
	return (
		(last_account_number + auto_increment_increment)
		if last_account_number
		else auto_increment_offset
	)
```

그외에 복합키를 사용하는 방법도 생각해보았다. 계좌 레코드를 식별하기위해 (`user_id`, `id`) 조합의 복합키를 사용하는 것이다. Django 는 명시적으로 복합키를 지원하지 않기에, 기본키를 단일 필드로만 사용할 수 있다. 때문에 UniqueConstraint로 (`user_id`, `id`) 인덱스를 두어, 유일성 판단에 활용하는 식으로 우회하여 구현한다.

```py
class Account(models.Model):
	"""
	계좌 모델
	"""
	
	id = models.BigAutoField(primary_key=True)
	account_number = models.PositiveIntegerField(help_text="계좌번호")
	user_id = models.PositiveIntegerField(help_text="사용자 id")
	balance = models.PositiveBigIntegerField(default=0, help_text="잔액")

	class Meta:
		constraints = [
			models.UniqueConstraint(
				fields=["user_id", "id"], name="user_id_id_composite_key"
			),
		]
```

이 방법은 사용할 수 없었는데, 어쨌든 명시적 기본키가 `id` 필드이기에 여러 DB 테이블을 통합하는 상황에서 개체 무결성을 만족시킬 수 없기 때문이다.


## refs
- [가상 면접 사례로 배우는 대규모 시스템 설계 기초]({{< ref "/posts/가상 면접 사례로 배우는 대규모 시스템 설계 기초.md" >}})
- [분산환경에서 DB 기본키(PK)는 어떤 ID 생성 전략으로 만들어야할까? (UUID,ULID,TSID...) — 꾸준히 성장하는 개발자스토리](https://ssdragon.tistory.com/162#%F-%-F%-A%--%--ULID)
- [주문서비스 ShardingSphere-Proxy 도입기 | YOGIYO Tech Blog - 요기요 기술블로그](https://techblog.yogiyo.co.kr/%EC%A3%BC%EB%AC%B8%EC%84%9C%EB%B9%84%EC%8A%A4-shardingsphere-proxy-%EB%8F%84%EC%9E%85%EA%B8%B0-46d83084586b)
- [UUIDs are Popular, but Bad for Performance — Let’s Discuss](https://www.percona.com/blog/uuids-are-popular-but-bad-for-performance-lets-discuss/)
- [The best UUID type for a database Primary Key - Vlad Mihalcea](https://vladmihalcea.com/uuid-database-primary-key/)


## links
- [SQLite]({{< ref "/posts/SQLite.md" >}})
- [Snowflake ID]({{< ref "/posts/Snowflake ID.md" >}})
