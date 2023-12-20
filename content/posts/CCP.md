---
title: CCP
categories:
  - 아키텍처
tags:
  - 컴포넌트
date: 2022-10-31T22:12:39+09:00
draft: false
modified: 2023-12-20T13:40:07+09:00
---

## content
공통 폐쇄 원칙; Common Closure Principle
컴포넌트는 변경에 대해 닫혀있는 수준이 공통적이어야한다. 즉, 컴포넌트 변경하는 이벤트는 동일한 시점에 동일한 사유로 발생해야하며, 그 외 이벤트로는 변경이 불가해야한다.

하나의 모듈이 하나의 액터만 책임진다는 SRP의 컴포넌트 수준 원칙이다. 변경 사유가 다른 모듈은 별개 컴포넌트로 분리해야한다,

OCP 의 Closure와 동일한 의미의 닫혀있음이다.


## refs
- [클린 아키텍처]({{< ref "/posts/클린 아키텍처.md" >}})


## links
- [컴포넌트]({{< ref "/posts/컴포넌트.md" >}})
- [SRP]({{< ref "/posts/SRP.md" >}})
- [OCP]({{< ref "/posts/OCP.md" >}})
