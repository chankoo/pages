---
title: Event Loop
categories:
  - OS
tags:
  - gunicorn
  - javascript
date: 2022-10-25T23:23:22+09:00
draft: false
modified: 2023-11-27T20:50:22+09:00
---

## content
싱글 스레드에서 요청을 비동기로 처리하기 위해 사용하는 루프. 

- (gevent에서) I/O 요청시 커널에 요청을 주고 커널로 부터 응답 받은 이벤트를 처리하기 위해 돌고있는 루프
	- 유저 영역 요청 -> 이벤트 루프 -> 이벤트 루프 응답 -> 대기하며 진행
	- 커널 영역 블락 -> 이벤트 발생 -> 이벤트 루프에 노티 -> 대기 중인 것을 실현	
- (javascript에서) 콜백 큐에서 콜백 함수를 꺼내 콜 스택에 넣어 주는 루프


## refs
- https://deview.kr/2014/session?seq=47
- [[JS] 도대체 이벤트 루프가 뭔가요? - 배하람의 블로그](https://baeharam.netlify.app/posts/javascript/event-loop)


## links
- [Gunicorn worker types]({{< ref "/posts/Gunicorn worker types.md" >}})