---
title: Mysql 인덱스
categories:
  - DB
tags:
  - mysql
date: 2023-11-21T19:20:55+09:00
draft: false
modified: 2024-04-27T00:55:41+09:00
---
mysql의 InnoDB는 아래와 같은 구조로 인덱스를 생성한다. 해당 인덱스는 B-Tree 로 기본키를 저장하고, 기본키는 데이터에 접근한다. 이때 기본키와 데이터는 같은 공간에 저장한다. 이를 클러스터드 인덱스(테이블이 곧 기본키 인덱스)라고 부른다.

{{< image src="/images/Pasted image 20231121192152.png" >}}


### 인덱스와 정렬

쿼리에 order by가 사용되면 아래 3가지 중 하나로 처리한다. 밑으로 갈수록 느리다.
- 인덱스 사용한 정렬
	- 정렬 목적 인덱스가 있어야함. (정렬 대상 컬럼이 테이블의 첫번째 컬럼이며 , 정렬 되어있어야 함)
	- B-Tree 계열 인덱스에서만 사용
- File Sort
	- SortBuffer에서 테이블을 정렬하는 방식
	- 조인이 필요한 경우, 드라이빙 테이블(정렬 필요 테이블)을 먼저 정렬하고 조인한다.
- Using temporary; File Sort
	- 임시 테이블을 만들고, 임시 테이블을 소트버퍼에서 정렬하는 방식
	- 조인 후에 정렬이 필요한 경우이다.

인덱스 사용 정렬의 효과가 인덱스 유지 비용보다 크면 효율적이다. 
- 인덱스 사용 여부는 옵티마이저가 결정하므로, `EXPLAIN` 으로 인덱스를 타는지 확인하자
	- 보통 limit이 걸린 경우 인덱스 스캔을 이용한다
	- {{< image src="/images/Pasted image 20240427004656.png " >}}
	- 반면, 정렬에 적합한 인덱스가 없거나, 테이블 크기가 작거나, 인덱스의 카디널러티가 낮으면, 인덱스를 타지 않는다.
	- 그 결과 File Sort가 발생하고, 이는 보통 성능 관점에서 안좋은 지표이다. 
	- {{< image src="/images/Pasted image 20240427004627.png" >}}




## refs
- [[MySQL] B-Tree로 인덱스(Index)에 대해 쉽고 완벽하게 이해하기 - MangKyu's Diary](https://mangkyu.tistory.com/286) 
- [데이터 중심 애플리케이션 설계]({{< ref "/posts/데이터 중심 애플리케이션 설계.md" >}})
- [인덱스와 ORDER BY](https://datarian.io/blog/postgresql-indexes-and-orderby)
- [SQL - Using Temporary, Using Filesort 정리 (+ 임시 테이블, 파일 정렬)](https://jaehoney.tistory.com/192)


## links
- [B-Tree]({{< ref "/posts/B-Tree.md" >}})
- [Hash 인덱스]({{< ref "/posts/Hash 인덱스.md" >}})
- [전문 검색 인덱스]({{< ref "/posts/전문 검색 인덱스.md" >}})
- [Real MySQL]({{< ref "/posts/Real MySQL.md" >}})
