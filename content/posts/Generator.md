---
title: Generator
categories: [자료구조]
tags: [python]
date: 2022-10-12T00:08:35+09:00
draft: true
---

## content
제너레이터는 제어 흐름을 양보할 수 있는 Iterator이다. 루프를 순회하는 도중 의도적으로 순회를 멈추고, 자신을 호출한 루틴으로 제어 흐름을 양보할 수 있다. 때문에 semicoroutine 이라고도 불리는데, 제어 흐름을 넘겨줄 routine을 지정할 수 있는 coroutine 의 특수한 형태이기 때문이다.

이러한 제너레이터의 동작은 1) 메모리 효율 2) 동시성 의 관점에서 살펴볼만하다. 루프 내 요소의 평가가 필요할때 메모리에 요소를 올리는 lazy evaluation 이고, 원하는 시점에 제어흐름을 넘겨가며 동시성 프로그래밍을 가능케하는 pseudo thread 이기 때문이다.


## refs
- [Generator (computer programming) - Wikipedia](https://en.wikipedia.org/wiki/Generator_(computer_programming))


## links
- [Iterator]({{< ref "/posts/Iterator.md" >}})
- [coroutine]({{< ref "/posts/coroutine.md" >}})
