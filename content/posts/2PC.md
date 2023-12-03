---
title: 2PC
categories:
  - 아키텍처
tags:
  - MSA
  - 분산시스템
date: 2022-12-06T23:29:16+09:00
draft: true
modified: 2023-12-02T12:58:54+09:00
---

## content
2단계 커밋(Two Phase Commit) 으로 분산 트랜잭션 환경에서 트랜잭션을 구현하는 방법이다. 
트랜잭션의 커밋을 준비와 실제 동작의 2단계로 나누어, 분산 환경에서 커밋 준비가 완료되면 비로소 실제 커밋을 하는 방식이다.

트랜잭션에 관여하는 모든 서비스가 정상 동작해야하는 가용성 이슈와, 동기적으로 동작하는 성능 이슈 때문에 지고 있는 추세이다.


![Pasted image 20221206233131.png]({{< ref "/posts/Pasted image 20221206233131.png.md" >}})

## refs
- [[Architecture] MSA : SAGA 패턴이란 - Azderica](https://azderica.github.io/01-architecture-msa/)


## links
- [분산 트랜잭션]({{< ref "/posts/분산 트랜잭션.md" >}})
