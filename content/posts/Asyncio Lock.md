---
title: Asyncio Lock
categories:
  - 백엔드
tags:
  - 분산시스템
  - python
  - 동시성
date: 2024-01-09T16:20:24+09:00
draft: false
featured: false
modified: 2024-01-09T16:24:36+09:00
---
asyncio 라이브러리가 제공하는 잠금으로 코루틴 간 경합 상황을 해결하는 도구이다.

멀티 스레딩 환경에서는 적합하지 않은데, 스레드 레벨에서는 점유 배제를 보장할 수 없기 때문이다. 즉, 스레드 A의 코루틴이 잠금을 획득했더라도 스레드 B의 코루틴은 영향 받지 않는다.


## refs
- [asyncio의 동기화수단들 · Wireframe](https://soooprmx.com/asyncio%EC%9D%98-%EB%8F%99%EA%B8%B0%ED%99%94%EC%88%98%EB%8B%A8%EB%93%A4/)


## links
- 
