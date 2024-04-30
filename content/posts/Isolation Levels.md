---
title: Isolation Levels
categories:
  - DB
tags:
  - mysql
  - 동시성
date: 2022-10-09T12:37:01+09:00
draft: false
modified: 2024-04-28T19:03:24+09:00
---
Transaction 간 격리 수준

DBMS는 다양한 수준의 Isolation Level을 제공하여 ACID의 Isolation 관점에서 엄격히 제한된 Transaction의 병행성 제약을 완화한다. 이상적으로 Transaction은 엄격히 격리해야 하지만, 실무적으로 걸림돌이 되기에, 격리 수준을 단계적으로 완화하는 Isolation Levels 를 정의하여 상황에 맞게 제공한다.

- Serializable - Isolation 제약을 지키는 수준으로 트랜잭션을 serial schedule 로 수행하여 다른 트랜잭션의 수행과 겹치는 시간이 없다.
- Repeatable Reads
	- 반복해서 읽어도 같은 결과를 보여주는 수준으로, 반복 read 도중 커밋이 발생하여 값이 변해도 커밋 전 값을 읽어간다. (mysql innodb 에서 default)
	- 스냅숏 격리를 통해 구현하여 과거 스냅숏을 보여줌으로써 일관된 읽기를 가능케한다. 즉, 트랜잭션의 첫 읽기 발생시에 스냅숏을 가져와 이후 연산은 그 스냅숏을 기준으로 수행한다. 
	- Phantom Reads 는 발생한다. 
- Read Committed
	- 가장 기본적인 격리(postgre에서 default)로 커밋된 결과라면 다 읽어버리는 수준이다.
	- 두가지를 보장하는데, 1) 더티 읽기와 2) 더티 쓰기가 발생하지 않는다. 즉, 커밋 안된 변경을 다른 트랜잭션이 읽어가지 않고, 커밋 안된 쓰기 연산 중에는 다른 트랜잭션이 끼어들 수 없다.
		- 1) 더티 읽기를 없애면 변경 중인 결과를 읽어가서 생기는 혼란을 줄인다. 특히 롤백이 발생하는 경우, 커밋 안된 결과를 읽어갔다면 매우 혼란스러운 결과로 이어질 것이다.
		- 2) 더티 쓰기를 없애면 특정 트랜 잭션 간 내용이 섞인 채 기록되는 문제를 막는다.
	- 대부분의 DB가 해당 격리를 구현하는 방법은, 트랜잭션에서 쓰여진 모든 객체에 쓰기 잠금을 부여하고, 다른 트랜잭션엔 과거 스냅숏을 보여주는 것이다. (읽기 잠금으로 구현하면 동시성이 매우 떨어져 사용하지 않는다.)
	- 비반복 읽기(nonrepeatable read)가 발생하는데, 커밋 여부와 무관하게 시점에 따라 일시적으로 읽기 결과가 일관되지 않는 문제이다.
- Read Uncommited - 죄다 읽는 수준. 더티 읽기도 발생


{{< image src="/images/Pasted image 20221010172925.png" >}}


## refs
- [Isolation (database systems) - Wikipedia](https://en.wikipedia.org/wiki/Isolation_(database_systems))
- [Lock으로 이해하는 Transaction의 Isolation Level](https://suhwan.dev/2019/06/09/transaction-isolation-level-and-lock/)
- [데이터 중심 애플리케이션 설계]({{< ref "/posts/데이터 중심 애플리케이션 설계.md" >}})


## links
- [Transaction]({{< ref "/posts/Transaction.md" >}})
- [직렬성]({{< ref "/posts/직렬성.md" >}})
- [Phantom Reads]({{< ref "/posts/Phantom Reads.md" >}})
