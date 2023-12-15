---
title: 2PC
categories:
  - 아키텍처
tags:
  - MSA
  - 분산시스템
date: 2022-12-06T23:29:16+09:00
draft: false
modified: 2023-12-15T14:19:28+09:00
---

## content
2단계 커밋(Two Phase Commit) 으로 분산 트랜잭션 환경에서 트랜잭션을 구현하는 방법이다. 
트랜잭션의 커밋을 준비와 실제 동작의 2단계로 나누어, 분산 환경에서 커밋 준비가 완료되면 비로소 실제 커밋을 하는 방식이다.

2PC 에서 원자성은 2개의 되돌릴 수 없는 포인트에 의해 결정되는데, 1) 참여자가 준비 단계에서 커밋 가능하다고 답변하는 시점과 2) 코디네이터(리소스 매니저)가 커밋하는 시점이다. 1)과 2) 가 만족되면 참여자의 커밋이 어떤 사유로 실패하든, 반복적으로 커밋을 시도한다.

트랜잭션에 관여하는 모든 서비스가 정상 동작해야하는 가용성 이슈와, 동기적으로 동작하는 성능 이슈 때문에 지고 있는 추세이다.


![2PC](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FcrJspK%2FbtqvAgfh88l%2Fm9kBx1Kn5qTQOB0aAjxwh1%2Fimg.png)
## refs
- [[Architecture] MSA : SAGA 패턴이란 - Azderica](https://azderica.github.io/01-architecture-msa/)
- [데이터 중심 애플리케이션 설계]({{< ref "/posts/데이터 중심 애플리케이션 설계.md" >}})
- [마이크로서비스 패턴]({{< ref "/posts/마이크로서비스 패턴.md" >}})


## links
- [분산 트랜잭션]({{< ref "/posts/분산 트랜잭션.md" >}})

