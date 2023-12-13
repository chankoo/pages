---
title: Snowflake ID
categories:
  - 자료구조
tags:
  - 분산시스템
date: 2023-12-12T21:13:53+09:00
draft: false
modified: 2023-12-12T21:44:13+09:00
---

## content
분산 시스템의 ID 생성 목적으로 트위터가 고안한 자료구조. 크기가 작고(8바이트) 특정 기술에 의존하지 않아 대용량 분산 시스템의 요구사항을 잘 만족시킨다. 

- timestamp - 약 70년의 timestamp를 표현 가능. 생성 순으로 정렬 가능
- instance - 장비의 고유 ID로 사용
- seqence - 동일한 ms에 생성한 id에 순번을 매김. 즉, ms 마다 4097(2^12)개 id 생성 가능

![wikipedia](https://upload.wikimedia.org/wikipedia/commons/5/5a/Snowflake-identifier.png)


## refs
- [Snowflake ID - Wikipedia](https://en.wikipedia.org/wiki/Snowflake_ID)
- [가상 면접 사례로 배우는 대규모 시스템 설계 기초]({{< ref "/posts/가상 면접 사례로 배우는 대규모 시스템 설계 기초.md" >}})
- [분산 처리 시스템에서 유일한 식별자를 만드는 방법(twitter snowflake)](https://jeong-pro.tistory.com/251)


## links
- 
