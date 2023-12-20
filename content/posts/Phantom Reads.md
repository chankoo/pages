---
title: Phantom Reads
categories:
  - DB
tags:
  - 동시성
date: 2022-10-10T17:37:43+09:00
draft: false
modified: 2023-12-20T17:44:36+09:00
---

## content
range select 하는 쿼리를 반복해서 실행할때, 다른 트랜잭션(phantom)의 영향으로 결과 셋이 달라지는 현상. 존재하지 않는(phantom) 새로운 행들이 나타나거나, 그렇게 나타난 행들이 사라지는 상태를 의미한다.

Serializable을 제외한 격리 수준에서 모두 발생한다. gap lock을 쓰지 않는다면, range select 쿼리의 대상인 rows set 외에는 락이 걸려있지 않으므로, 다른 트랜잭션이 새로운 row를 만들 수 있고, 그 row가 다음번 range select 에 걸릴 수 있는 것이다.



## refs
- 


## links
- [Isolation Levels]({{< ref "/posts/Isolation Levels.md" >}})
- [직렬성]({{< ref "/posts/직렬성.md" >}})
