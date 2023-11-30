---
title: coroutine
categories:
  - 컴퓨터구조
tags:
  - 동시성
date: 2022-10-11T20:39:15+09:00
modified: 2023-11-30T17:11:39+09:00
---

## content
Co-Routine. 다른 루틴과 동등한 레벨에서 상호 협력하는 루틴. routine - subroutine 으로 종속되는 개념과 대비된다.

프로그래머는 코루틴 간 제어 흐름을 의도에 따라 통제하는데, 실행 중인 코루틴이 자신의 흐름을 멈추고 다른 코루틴에 양보(yield) 하도록 하는 방식이다.

코루틴 간의 스위칭을 통해 (스레드 스위칭과 유사하게) 동시성 프로그래밍할 수 있다. 코루틴이 "lightweight" 스레드라고도 불리는 이유이다. 

스레드와의 주된 차이는, 별도의 스택 메모리를 갖지 않는다(stackless coroutine)는 점, 병렬 실행이 불가하다는 점 등이 있다.

+) 작업 후 다른 루틴에게 명시적으로 제어권을 넘겨줄 경우, CPS를 따라 구현했다고 볼 수 있다. 
## refs
- [파이썬과 동시성 프로그래밍 - Sungho's Blog](https://sgc109.github.io/2020/11/25/python-and-concurrency/)
- [Coroutine, Thread 와의 차이와 그 특징 - Crucian Carp](https://aaronryu.github.io/2019/05/27/coroutine-and-thread/)


## links
- [동시성]({{< ref "/posts/동시성.md" >}})
- [스레드]({{< ref "/posts/스레드.md" >}})
- [CPS]({{< ref "/posts/CPS.md" >}})
