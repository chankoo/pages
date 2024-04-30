---
title: DB 인덱스와 정렬
categories:
  - DB
tags:
  - mysql
date: 2024-04-28T12:02:40+09:00
draft: false
featured: false
modified: 2024-04-28T12:27:00+09:00
---
B-Tree 계열 인덱스 사용시 정렬에 인덱스를 사용할 수 있으며, 그 효과가 인덱스 유지 비용보다 커야한다.

Mysql에서 쿼리에 order by가 사용되면 아래 3가지 중 하나로 처리한다. 아래로 갈수록 느리다.
- 인덱스 사용한 정렬
	- 정렬 목적 인덱스가 있어야함. (정렬 대상 컬럼이 테이블의 첫번째 컬럼이며 , 정렬 되어있어야 함)
	- B-Tree 계열 인덱스에서만 사용
- File Sort
	- SortBuffer에서 테이블을 정렬하는 방식
	- 조인이 필요한 경우, 드라이빙 테이블(정렬 필요 테이블)을 먼저 정렬하고 조인한다.
- Using temporary; File Sort
	- 임시 테이블을 만들고, 임시 테이블을 소트버퍼에서 정렬하는 방식
	- 조인 후에 정렬이 필요한 경우이다.


아래와 같은 테이블(Django 모델로 표현)에서 `name` 필드로 정렬하는 상황을 고려해보자. 쿼리시 인덱스 사용 여부는 옵티마이저가 결정하므로, `EXPLAIN` 으로 인덱스를 타는지 확인해야한다.
```python
class Contact(CoreModel):
	name = models.CharField(max_length=100, default="")
	...
	
	
	class Meta:
	indexes = [
		models.Index(fields=['name']),
	]
```

- 보통 limit이 걸린 경우 인덱스 스캔(type=index, 인덱스 풀스캔)을 이용한다.
	- {{< image src="/images/Pasted image 20240427004656.png" width="LIMIT 포함한 쿼리" >}}
- 쿼리시 인덱스가 불필요하면 옵티마이저는 인덱스를 사용하지 않는다. 인덱스를 유지하는 오버헤드만 발생한다. 
	- 정렬에 적합한 인덱스가 없거나, 인덱스 사용이 더 느리면(테이블 크기가 작거나, 인덱스의 카디널러티가 낮으면) 인덱스를 타지 않는다(type=ALL, 풀테이블 스캔).
	- 그 결과 File Sort가 발생하고, 이는 보통 성능 관점에서 부정적인 시그널이다. 
	- {{< image src="/images/Pasted image 20240427004627.png" width="LIMIT 불포함 쿼리" >}}

쿼리시 여러개의 컬럼을 조회할때는 다중 컬럼 인덱스 사용을 고려하자. 단일 컬럼 인덱스를 여러개 사용하는 상황보다 성능 측면에서 이득 보는 경우가 있다. 
- A, B 컬럼 각각에 인덱스가 걸린 경우, 옵티마이저는 어떤 인덱스를 사용할지 판단 후, 각각 인덱스를 가져와 사용한다.
- (A, B) 다중 컬럼 인덱스에서는 이미 A 컬럼에 의존해서 B 컬럼이 정렬되어있다. 따라서 (A, B) 인덱스에서 필요한 정보를 바로 가져올 수 있다.


`('user_id', 'name')`를 예로 들어 다중 컬럼 인덱스가 필요한 상황을 생각해보자.
```python
class Contact(CoreModel):
	user = models.ForeignKey(User, on_delete=models.SET_NULL, null=True)
	name = models.CharField(max_length=100, default="")
	...


	class Meta:
	indexes = [
		models.Index(fields=['user', 'name']),
	]
```

- 인덱스 내 컬럼 순서대로 정렬(`ORDER BY user_id, name`) 하거나, 첫번째 컬럼으로 필터링(`WHERE user_id=2`) 하는 경우 인덱스를 사용한다.
	- {{< image src="/images/Pasted image 20240428121723.png" width=" 인덱스 순서로 정렬" >}}
	- {{< image src="/images/Pasted image 20240428121557.png" width="첫번째 컬럼을 조건절에 사용" >}}
- 반면, 첫번째 컬럼('user_id') 과 무관한 조건으로 필터링(`WHERE name LIKE '%'`) 했을때는 인덱스를 타지 않는다.
	- {{< image src="/images/Pasted image 20240428121912.png" width="첫번째 컬럼 조건절에 불포함" >}}



## refs
- [인덱스와 ORDER BY](https://datarian.io/blog/postgresql-indexes-and-orderby)
- [SQL - Using Temporary, Using Filesort 정리 (+ 임시 테이블, 파일 정렬)](https://jaehoney.tistory.com/192)
- [[MySQL] 실행계획2 (EXPLAIN)](https://velog.io/@ddongh1122/MySQL-%EC%8B%A4%ED%96%89%EA%B3%84%ED%9A%8D2-EXPLAIN)
- [MySQL 다중 컬럼 인덱스(Multi-column Index) 사용 시 주의할 점](https://studyandwrite.tistory.com/553)


## links
- [Mysql 인덱스]({{< ref "/posts/Mysql 인덱스.md" >}})
- [Real MySQL]({{< ref "/posts/Real MySQL.md" >}})
