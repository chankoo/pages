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
modified: 2023-11-30T16:48:25+09:00
---

## content

- sync
- gthread
	- 
- gevent
	- 코루틴이다
	- gevent로 구현된 웹서버를 실행하고 monkey patching을 이용해 애플리케이션을 gevent 호환 코드로 바꿔치기한다.


## refs
- [Selecting gunicorn worker types for different python web applications. | by Tuan Nhu Dinh | Medium](https://medium.com/@nhudinhtuan/gunicorn-worker-types-practice-advice-for-better-performance-7a299bb8f929)
- [Gunicorn vs Python GIL. What is the Python GIL, how it works… | by Luis Sena | Medium](https://luis-sena.medium.com/gunicorn-vs-python-gil-221e673d692)
- [백엔드 개발자들이 알아야할 동시성 번외편— Python의 Concurrency | by Choi Geonu | Medium](https://choi-geonu.medium.com/%EB%B0%B1%EC%97%94%EB%93%9C-%EA%B0%9C%EB%B0%9C%EC%9E%90%EB%93%A4%EC%9D%B4-%EC%95%8C%EC%95%84%EC%95%BC%ED%95%A0-%EB%8F%99%EC%8B%9C%EC%84%B1-%EB%B2%88%EC%99%B8%ED%8E%B8-python%EC%9D%98-coroutine-799fc0692fb3)


## links
- [coroutine]({{< ref "/posts/coroutine.md" >}})
- [스레드와 잠금장치 발표자료.pdf](obsidian://open?vault=chankoo&file=Media%2F7%EA%B0%80%EC%A7%80%20%EB%8F%99%EC%8B%9C%EC%84%B1%20%EB%AA%A8%EB%8D%B8%20-%20%EC%8A%A4%EB%A0%88%EB%93%9C%EC%99%80%20%EC%9E%A0%EA%B8%88%EC%9E%A5%EC%B9%98.pdf)
- [gevent]({{< ref "/posts/gevent.md" >}})
