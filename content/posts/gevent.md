---
title: gevent
categories:
  - 백엔드
tags:
  - 동시성
  - python
date: 2023-11-28T15:55:32+09:00
draft: false
modified: 2024-01-09T10:18:27+09:00
---
코루틴 기반의 파이썬 라이브러리로 고성능 I/O를 위한 동시성을 지원한다.

greenlet 이라는 경량 스레드(코루틴)와 event loop를 이용하여 넌블러킹 & 비동기 I/O를 지원한다. monkey patching을 이용해 표준 라이브러리의 구현을 gevent의 구현으로 바꿔치기하는 방식으로 동작한다.

파이썬이 표준으로 제공하는 구현이 아니고 어디까지나 monkey patching(~~흑마법~~) 이기에 한계가 분명하다. (대표적으로 mysqlclient는 gevent 와 호환되지 않는다)
## refs
- [What is gevent? - gevent 23.9.2.dev0 documentation](https://www.gevent.org/)
- [백엔드 개발자들이 알아야할 동시성 번외편— Python의 Concurrency | by Choi Geonu | Medium](https://choi-geonu.medium.com/%EB%B0%B1%EC%97%94%EB%93%9C-%EA%B0%9C%EB%B0%9C%EC%9E%90%EB%93%A4%EC%9D%B4-%EC%95%8C%EC%95%84%EC%95%BC%ED%95%A0-%EB%8F%99%EC%8B%9C%EC%84%B1-%EB%B2%88%EC%99%B8%ED%8E%B8-python%EC%9D%98-coroutine-799fc0692fb3)


## links
- [coroutine]({{< ref "/posts/coroutine.md" >}})
- [스레드]({{< ref "/posts/스레드.md" >}})
