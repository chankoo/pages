---
title: Race Condition
categories:
  - OS
tags:
  - 동시성
date: 2022-10-08T21:56:55+09:00
modified: 2023-12-02T13:37:51+09:00
---

## content
경쟁 상태
여러 스레드나 프로세스가 한 자원에 동시에 접근하고 조작하여 예상치 못한 결과(non deterministic)을 도출할 수 있는 상태. 즉, 스레드가 자원에 접근하는 타이밍에 결과가 영향 받는 상태를 의미한다


|Thread 1|Thread 2||Integer value|
|---|---|---|---|
||||0|
|read value||←|0|
||read value|←|0|
|increase value|||0|
||increase value||0|
|write back||→|1|
||write back|→|1|
## refs
- [Race condition - Wikipedia](https://en.wikipedia.org/wiki/Race_condition)


## links
- 