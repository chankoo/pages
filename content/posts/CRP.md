---
title: CRP
categories:
  - 아키텍처
tags:
  - 컴포넌트
date: 2022-10-31T22:37:28+09:00
draft: false
modified: 2023-12-20T13:39:09+09:00
---

## content
공통 재사용 원칙; Common Reuse Principle
컴포넌트의 요소가 공통적으로 재사용하는 모듈만 컴포넌트에 포함하라. 

컴포넌트 속 모듈(A)은 사실상 해당 컴포넌트의 모든 모듈과 의존성을 지닌다고 할 수 있다. 다른 모듈이 A에 직접 의존하지 않는다고해도, A의 변경으로 다른 모듈에 변화(재컴파일, 재검증, 재배포)가 발생할 가능성이 있어서 그렇다. 그래서 CRP는 컴포넌트 내 모듈과 강하게 결합하지 않는 모듈(A)을 컴포넌트에 위치시키지 말라고 조언하는 배제의 원칙으로서 기능한다.


## refs
- [클린 아키텍처]({{< ref "/posts/클린 아키텍처.md" >}})


## links
- [컴포넌트]({{< ref "/posts/컴포넌트.md" >}})