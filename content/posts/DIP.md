---
title: DIP
categories:
  - 아키텍처
tags:
  - SOLID
date: 2022-10-06T23:42:10+09:00
modified: 2023-11-27T20:43:09+09:00
---

## content
Dependency Inversion Principle(의존성 역전 원칙)
더 구체적인(하위 계층) 모듈에 의존하는 일반적(절차적)인 의존성의 흐름을 역전 시켜 더 추상적인(상위 계층) 모듈에 의존하도록해야한다.

추상 팩토리 패턴이 대표적이다. 객체 생성을 위해 구체 팩토리에 의존(요소 -> 팩토리)하는 것이 아니라, 추상 팩토리에 의존(요소 -> 추상 팩토리 $\Leftarrow$ 구체 팩토리)하는 것이다.


## refs
- [클린 아키텍처]({{< ref "/posts/클린 아키텍처.md" >}})


## links
- [SOLID]({{< ref "/posts/SOLID.md" >}})
- [추상 팩토리 패턴]({{< ref "/posts/추상 팩토리 패턴.md" >}})
