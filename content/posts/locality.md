---
title: locality
categories:
  - 컴퓨터구조
tags:
  - CPU
  - cache
  - 메모리
date: 2022-10-16T22:54:01+09:00
draft: false
modified: 2023-11-30T14:13:09+09:00
---

## content
(프로세서의 메모리)참조는 랜덤이 아니고 비슷한 지역에서 빈번하게 일어난다는 특성(Locality of reference)

1) Spatial Locality 와 2) Temporal Locality로 크게 나뉘는데 1)은 비슷한 공간의 영역을 반복적으로, 2)는 최근에 참조한 영역을 반복적으로 참조하는 현상을 말한다.

프로세서의 캐시는 locality를 고려하여 동작하기에 프로그램을 짤 때 locality를 활용한다면 더 캐시 효율적이다.


## refs
- [Locality of reference - Wikipedia](https://en.wikipedia.org/wiki/Locality_of_reference)


## links
- 