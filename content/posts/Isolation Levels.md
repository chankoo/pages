---
title: Isolation Levels
categories:
  - DB
tags:
  - mysql
  - 동시성
date: 2022-10-09T12:37:01+09:00
draft: false
modified: 2023-12-20T17:46:11+09:00
---

## content
Transaction 간 격리 수준.
DBMS는 다양한 수준의 Isolation Level을 제공하여 ACID의 Isolation 관점에서 엄격히 제한된 Transaction의 병행성 제약을 완화한다. 이상적으로 Transaction은 엄격히 격리해야 하지만, 실무적으로 걸림돌이 되기에, 격리 수준을 단계적으로 완화하는 Isolation Levels 를 정의하여 상황에 맞게 제공한다.

- Serializable - Isolation 제약을 지키는 수준으로 트랜잭션을 serial schedule 로 수행하여 다른 트랜잭션의 수행과 겹치는 시간이 없다.
- Repetable Reads - 반복해서 읽어도 같은 결과를 보여주는 수준으로, 반복 read 도중 커밋이 발생하여 값이 변해도 커밋 전 값을 읽어간다. [Phantom Reads]({{< ref "/posts/Phantom Reads.md" >}}) 는 발생한다.
- Read Comitted - 커밋된 결과라면 다 읽어버리는 수준
- Read Uncomiteed - 죄다 읽는 수준. 더티 리드도 발생


{{< image src="/images/Pasted image 20221010172925.png" >}}


## refs
- [Isolation (database systems) - Wikipedia](https://en.wikipedia.org/wiki/Isolation_(database_systems))
- [Lock으로 이해하는 Transaction의 Isolation Level](https://suhwan.dev/2019/06/09/transaction-isolation-level-and-lock/)


## links
- [Transaction]({{< ref "/posts/Transaction.md" >}})
- [직렬성]({{< ref "/posts/직렬성.md" >}})
- [Phantom Reads]({{< ref "/posts/Phantom Reads.md" >}})
