---
title: CPS
categories:
  - OS
tags:
  - 동시성
  - 함수형프로그래밍
date: 2023-11-30T15:43:19+09:00
draft: false
modified: 2024-01-09T13:47:28+09:00
---
Continuation Passing Style. 말그대로 Continuation을 전달하는 방식으로 프로그래밍하는 것을 말한다.

이는 CPS 함수를 정의할 때 특정한 작업(ex. 콜백 함수) 을 명시적 인자로 받게되는데, CPS 함수는 해당 함수의 작업이 끝난 후 인자로 받은 작업을 수행하게 된다. Continuation이 CPS 함수에 있다가 인자로 받은 작업으로 넘어가는 것이다.

CPS가 아니라면 함수가 그냥(암묵적으로) 작업을 수행하며, Continuation은 해당 함수에 머무른다.

## refs
- [Continuation-passing style - Wikipedia](https://en.wikipedia.org/wiki/Continuation-passing_style)
- [백엔드 개발자들이 알아야할 동시성 5 — Continuation Passing Style | by Choi Geonu | Medium](https://choi-geonu.medium.com/%EB%B0%B1%EC%97%94%EB%93%9C-%EA%B0%9C%EB%B0%9C%EC%9E%90%EB%93%A4%EC%9D%B4-%EC%95%8C%EC%95%84%EC%95%BC%ED%95%A0-%EB%8F%99%EC%8B%9C%EC%84%B1-5-continuation-passing-style-5058ab5cb781)
- [Continuation-Passing Style. CPS 이해하기 | by Ji Sungbin | Medium](https://jisungbin.medium.com/continuation-passing-style-863608b37c18)


## links
- [스케줄링]({{< ref "/posts/스케줄링.md" >}})
- [Event Loop]({{< ref "/posts/Event Loop.md" >}})
- [콜백 함수]({{< ref "/posts/콜백 함수.md" >}})
