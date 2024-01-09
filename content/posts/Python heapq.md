---
title: Python heapq
categories:
  - 자료구조
tags:
  - python
date: 2022-11-18T15:42:48+09:00
draft: false
modified: 2024-01-09T09:42:35+09:00
---
heap을 이용하는 q의 구현을 제공하는 모듈

```
heap = []
heapq.heappush(heap, item)
heapq.heappop(heap)
```

heappush 와 heappop 을 통해 힙 큐를 구현할 수 있다.

주의할 것은
1. heap 은 heap 자료구조가 아님. 선형 자료구조(ex. 리스트) 를 받아 힙의 구현을 도와주는 모듈임
2. 최소 힙을 구현함
3. 0을 제외한 인덱스로 읽지 말자 - heap[0] 을 제외한 값은 정렬된 형태가 아님

## refs
- [heapq — 힙 큐 알고리즘 — Python 3.12.0 문서](https://docs.python.org/ko/3/library/heapq.html)
- [파이썬의 heapq 모듈로 힙 자료구조 사용하기 | Engineering Blog by Dale Seo](https://www.daleseo.com/python-heapq/)


## links
- 
