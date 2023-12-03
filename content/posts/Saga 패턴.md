---
title: Saga 패턴
categories:
  - 아키텍처
tags:
  - MSA
  - 분산시스템
date: 2022-12-06T23:22:59+09:00
draft: true
modified: 2023-12-02T12:58:14+09:00
---

## content
분산 트랜잭션 환경에서 서비스 간 비동기 메시징을 이용하여 편성한 일련의 로컬 트랜잭션. 

각 서비스가 변경분 커밋을 수행하고 완료 메시지를 발행하여 다음 서비스의 트랜잭션을 유도한다. 마찬가지로 각 서비스는 보상 트랜잭션(compensatable transaction)을 통해 문제 발생 시 변경분을 발생 역순으로 undo하도록해 롤백한다.

분상 환경에서 메시징을 이용하는 특성상, saga 그 자체로는 엄격한 Isolation을 제공할 수 없다. 메시지 읽고 처리하는 행위를 격리하기 힘들기에, 메시지 읽는 순서가 바뀐다든지 하는 이슈로 트랜잭션의 결과가 상이한 문제가 생길 수 있는 것이다. 그래서 sementic lock, commutative update, pessimistic view, reread value 등의 대안을 이용한다.

## refs
- [마이크로서비스 패턴]({{< ref "/posts/마이크로서비스 패턴.md" >}})


## links
- [분산 트랜잭션]({{< ref "/posts/분산 트랜잭션.md" >}})
- [Isolation Levels]({{< ref "/posts/Isolation Levels.md" >}})
