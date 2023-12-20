---
title: DBCP
categories:
  - DB
tags:
  - mysql
  - django
date: 2023-11-22T12:01:24+09:00
draft: false
modified: 2023-12-20T22:06:45+09:00
---

## content
DB Connection Pool. DB와의 커넥션 풀을 어플리케이션 단에 미리 만들어두는 것이다. DB와 커넥션을 맺고 끊기 위해 매번 TCP 통신하는 비용을 줄인다.

- mysql 기준으로 성능에 중요한 설정
	- max_connections: 클라이언트와 맺을 수 있는 최대 커넥션 수
	- wait_timeout: inactive 커넥션을 얼마까지 기다린 뒤 close 할지 설정
- django 기준으로 성능에 중요한 설정
	- django는 커넥션 풀을 지원하지 않고, 요청마다 커넥션을 맺고 끊는다. 
		- CONN_MAX_AGE: 하지만 CONN_MAX_AGE(default: 0)에 값을 주면, 커넥션을 지정한 시간 동안 종료하지 않아 커넥션 풀처럼 재사용이 가능하다.
	- 각 스레드는 고유한 커넥션을 갖는다. gunicorn 과 같은 서버를 이용하여 여러 스레드를 서빙하는 경우 그린 스레드(gevent) 조차 고유한 커넥션으로 연결된다.
		- 대규모 동시성이 필요한 경우, gunicorn의 worker_connection을 크게 설정한다.
		- db의 max_connections 를 더 크게 조정하면서 db의 부하를 살피거나
		- 커넥션 풀 라이브러리를 사용하여 불필요한 커넥션을 유지하는 비용을 줄일 수도 있다. 고유한 커넥션을 쓰지 말고 커넥션 풀에서 스레드가 커넥션을 가져다쓰는 방식으로 수정하는 것이다.


## refs
- [DBCP (DB connection pool)의 개념부터 설정 방법까지! hikariCP와 MySQL을 예제로 설명합니다! 이거 잘 모르면 힘들.. - YouTube](https://www.youtube.com/watch?v=zowzVqx3MQ4&ab_channel=%EC%89%AC%EC%9A%B4%EC%BD%94%EB%93%9C)
- [Django에서 DB Connection 관리 SH DEVLOG](https://seungho-jeong.github.io/technology/computer-science/django-db-connections/)
- [Design — Gunicorn 21.2.0 documentation](https://docs.gunicorn.org/en/stable/design.html?highlight=connection#gthread-workers)
- [Scaling Django+Gevent with LDAP Connection Pooling | by J. Clayton Tallieu | Medium](https://medium.com/@joey_tallieu/scaling-django-gevent-with-ldap-connection-pooling-d2c5cbb60a40)
- [(Django) Django에서 Thread를 다룰 때 주의할 점](https://americanopeople.tistory.com/340)


## links
- [gunicorn]({{< ref "/posts/gunicorn.md" >}})
