---
title: CQRS
categories:
  - 아키텍처
tags:
  - MSA
date: 2022-12-12T23:09:46+09:00
draft: false
modified: 2024-01-09T12:40:00+09:00
---
Command와 Query를 다른 것으로 보고 명시적으로 분리하는 패턴. 
OOP 관점에서 Command를 담당하는 객체와, Query를 담당하는 객체의 책임을 분리하는 것으로 이해하면된다.

MSA, DDD, 이벤트 소싱 등 다른 기술과 함께 활용되며 다양하게 구현한다.

특히 마이크로 서비스로 분리한 아키텍처에서는 Query가 어려운데, 여러 서비스에 흩어진 데이터를 조회하는 비용이 크기 때문이다. 그래서 Query 효율을 높이는 관점에서 CQRS를 많이 활용한다.



## refs
- [마이크로서비스 패턴]({{< ref "/posts/마이크로서비스 패턴.md" >}})


## links
- 
