---
title: SRP
categories:
  - 아키텍처
tags:
  - SOLID
date: 2022-10-27T22:10:27+09:00
draft: false
modified: 2024-01-09T14:04:26+09:00
---
단일 책임 원칙 - Single Responsibility Principle
모듈은 한 액터(사용자, 이해관계자)만 책임진다. 모듈을 변경한다면 그 이유는 반드시 한 액터 때문이어야 한다.

SRP를 따르면, 여러 액터의 요구를 책임지는 모듈은 책임을 찢어야 한다. 

예를 들어 클래스 Employee가 재무팀을 위한 급여 계산 / 인사팀을 위한 업무 시간 계산을 책임지고 있다면, 이는 SRP를 위반한다. 
그래서 -> 급여 계산을 위한 클래스와 업무 시간 계산을 위한 클래스로 책임을 분리하고, EmployeeFacade 클래스를 두어 인터페이스를 정리할 수 있다.


## refs
- [클린 아키텍처]({{< ref "/posts/클린 아키텍처.md" >}})


## links
- [SOLID]({{< ref "/posts/SOLID.md" >}})
- [퍼사드 패턴]({{< ref "/posts/퍼사드 패턴.md" >}})
