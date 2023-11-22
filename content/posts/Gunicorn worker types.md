---
title: Gunicorn worker types
categories:
  - 백엔드
tags:
  - gunicorn
  - python
  - 동시성
  - 이벤트
date: 2022-10-09T12:34:05+09:00
draft: true
modified: 2023-11-21T19:48:08+09:00
---

## content

- sync
- gthread
- gevent / eventlet
	- 코루틴이다


## refs
- https://medium.com/@nhudinhtuan/gunicorn-worker-types-practice-advice-for-better-performance-7a299bb8f929
- https://luis-sena.medium.com/gunicorn-vs-python-gil-221e673d692


## links
- [coroutine]({{< ref "/posts/coroutine.md" >}})
- [스레드와 잠금장치 발표자료.pdf](obsidian://open?vault=chankoo&file=Media%2F7%EA%B0%80%EC%A7%80%20%EB%8F%99%EC%8B%9C%EC%84%B1%20%EB%AA%A8%EB%8D%B8%20-%20%EC%8A%A4%EB%A0%88%EB%93%9C%EC%99%80%20%EC%9E%A0%EA%B8%88%EC%9E%A5%EC%B9%98.pdf)
