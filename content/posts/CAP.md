---
title: CAP
categories:
  - 아키텍처
tags:
  - 분산시스템
date: 2023-12-02T12:38:19+09:00
draft: true
modified: 2023-12-02T12:57:52+09:00
---

## content
CAP Theorem. 분산 시스템에서 CAP의 세가지 조건이 동시에 만족할 수 없다는 정리이다.
- Consistency(일관성): 일관된 읽기를 보장
- Availability(가용성): 응답을 보장
- Partition tolererance(분할 용인): (네트워크 실패를 가정) 일부 메시지가 드랍되어도 시스템이 동작함

P의 조건은 분산 시스템과 네트워크의 본질이므로, 시스템 구현시 CP 또는 AP를 선택하는 문제만 남는다.


## refs
- [CAP Theorem, 오해와 진실](http://eincs.com/2013/07/misleading-and-truth-of-cap-theorem/)


## links
- 
