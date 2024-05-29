---
title: SQLite
categories:
  - DB
tags:
  - sqlite
date: 2024-05-24T14:12:15+09:00
draft: false
featured: false
modified: 2024-05-28T23:51:54+09:00
---
SQLite는 DBMS로 아래와 같은 특징이 있다.

- 파일 기반 DB
	- DBMS 내 모든 데이터를 하나의 파일로 관리한다. 백업과 마이그레이션이 무척 편리하다.
- 서버리스 라이브러리
	- 다른 DBMS와 달리 클라이언트-서버 아키텍처가 아님. 클라이언트 어플리케이션이 사용하는 라이브러리이다. 클라이언트 프로세스가 데이터베이스 엔진을 라이브러리로 사용하여, 파일IO를 통해 DBMS에 접근하는 것이다.
	-  DB 서버 프로세스와 통신하지 않으므로 IPC가 발생하지 않는다. 기존 클라이언트-서버 구조보다 더 가볍고, 빠를 수 있다.
	- 이러한 특성 덕에 Django, 안드로이드 등에 기본적으로 내장되었다.
- 전체 DB를 잠그는 방식으로 락을 구현한다. 
	- 파일 기반 DB이므로 파일 잠금으로 락이 동작하는데, 이 파일은 전체 DB이다. 따라서 락은 전체 DB를 잠근다.
	- 때문에 Write시 오직 하나의 세션만 락을 획득한다. 동시성 제공이 제한된다.
- 트랜잭션은 Rollback Journal 또는 WAL 방식으로 구현한다.
	- 롤백 저널
		- journal 이라는 임시 파일을 생성하여 db 스냅샷으로 사용한다. 트랜잭션을 시작할때 저널을 생성하고, 저널 파일을 삭제한 후 커밋하여 트랜잭션을 마친다. 
		- 롤백이 필요하면 저널 파일 내용을 db에 붙여넣는다.
		- 데이터를 db에 쓰는 시점에 read 요청도 막는 Exclusive Lock이 동작하여 동시성 이슈가 크다.
	- WAL(Write-ahead-log)
		- 변경사항을 로그 파일에 쌓다가, 특정 조건이 만족되면(commit 포함 로그 발생, 로그 파일 크기 초과) 쓰기 작업을 수행한다.
		- 수행 시점과 WAL을 비교하여 적합한 데이터를 읽어간다.
		- 저널링에 비해 읽기/쓰기 동시성이 좋다. WAL 파일을 쓰는 동안 read 요청을 막지 않기 때문이다. write 효율도 좋아지는데, DB에 데이터 쓰는 작업이 배치성으로 진행되어 디스크 IO가 줄어들기 때문이다.



## refs
- [About SQLite](https://www.sqlite.org/about.html)
- [File Locking And Concurrency In SQLite Version 3](https://www.sqlite.org/lockingv3.html)
- [WAL vs rollback journal](https://www.hackingnote.com/en/versus/wal-vs-rollback/index.html)
- [SQLite 개념/구조/멀티 DB 실사용기 :: 메모장](https://ehdvudee.tistory.com/23)
- [SQLite 1탄, 이것만은 알고 넘어가자! – gywndi's database](https://gywn.net/2013/08/let-me-intorduce-sqlite/)


## links
- 
