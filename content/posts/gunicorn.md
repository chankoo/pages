---
title: gunicorn
categories:
  - 백엔드
tags:
  - python
  - 동시성
date: 2022-10-09T12:34:05+09:00
draft: false
modified: 2023-12-20T22:31:16+09:00
---

## content
UNIX 용 WSGI 서버이다.

파이썬 어플리케이션을 서빙하는 worker 를 fork하는데, worker 타입은 다음과 같다.
- sync
	- 병렬로 동작하는 N개 프로세스를 fork한다. 
	- I/O로 인한 블로킹이 적을 경우 적합
- gthread
	- N개 스레드를 fork한다.
	- 멀티스레딩을 지원하는 앱일 경우 적합
- gevent
	- gevent로 구현한 N개 웹서버를 실행한다.
	- I/O 바운드인 보통의 서비스에 적합


## refs
- [Gunicorn vs Python GIL. What is the Python GIL, how it works… | by Luis Sena | Medium](https://luis-sena.medium.com/gunicorn-vs-python-gil-221e673d692)


## links
- [WSGI]({{< ref "/posts/WSGI.md" >}})
- [7가지 동시성 모델]({{< ref "/posts/7가지 동시성 모델.md" >}})
- [gevent]({{< ref "/posts/gevent.md" >}})
