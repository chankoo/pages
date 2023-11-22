---
title: Isolation Levels
categories: [DB]
tags: [mysql, 동시성]
date: 2022-10-09T12:37:01+09:00
draft: true
---

## content
Transaction 간 격리 수준.
DBMS는 다양한 수준의 Isolation Level을 제공하여 ACID의 Isolation 관점에서 엄격히 제한된 Transaction의 병행성 제약을 완화한다. 이상적으로 Transaction은 엄격히 격리해야 하지만, 실무적으로 걸림돌이 되기에, 격리 수준을 단계적으로 완화하는 Isolation Levels 를 정의하여 상황에 맞게 제공한다.

- Serializable - Isolation 제약을 지키는 수준으로 트랜잭션을 serial schedule 로 수행하여 다른 트랜잭션의 수행과 겹치는 시간이 없다.
- Repetable Reads - 반복해서 읽어도 같은 결과를 보여주는 수준으로, 반복 read 도중 커밋이 발생하여 값이 변해도 커밋 전 값을 읽어간다. [Phantom Reads]({{< ref "/posts/Phantom Reads.md" >}}) 는 발생한다.
- Read Comitted - 커밋된 결과라면 다 읽어버리는 수준
- Read Uncomiteed - 죄다 읽는 수준


![Pasted image 20221010172925.png]({{< ref "/posts/Pasted image 20221010172925.png.md" >}})


## refs
- https://en.wikipedia.org/wiki/Isolation_(database_systems)


## links
- [Transaction]({{< ref "/posts/Transaction.md" >}})
- [Serializability]({{< ref "/posts/Serializability.md" >}})
- [Phantom Reads]({{< ref "/posts/Phantom Reads.md" >}})
- [스레드와 잠금장치 발표자료.pdf](obsidian://open?vault=chankoo&file=Media%2F7%EA%B0%80%EC%A7%80%20%EB%8F%99%EC%8B%9C%EC%84%B1%20%EB%AA%A8%EB%8D%B8%20-%20%EC%8A%A4%EB%A0%88%EB%93%9C%EC%99%80%20%EC%9E%A0%EA%B8%88%EC%9E%A5%EC%B9%98.pdf)
