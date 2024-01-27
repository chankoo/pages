---
title: 도커 Shutdown
categories:
  - OS
tags:
  - docker
date: 2024-01-27T18:11:01+09:00
draft: false
featured: false
modified: 2024-01-27T18:33:15+09:00
---
일반적으로 `docker stop [-t]`  명령(SIGTERM)을 통해 컨테이너의 graceful shutdown을 유도한다. t초 후 SIGKILL을 통해 프로세스를 강제 종료한다.

다만 컨테이너의 루트 프로세스에 시그널을 보내는 것임을 주의해야한다. 종료하려는 프로세스가 루트가 아닌 경우, 비정상적으로 종료될 수 있다. 아래와 같이 `entrypoint` 를 이용한 경우, 컨테이너 루트 프로세스인 `/bin/bash` 가 종료 시그널을 받게 되는 것이다. `/bin/bash`는 자식 프로세스가 종료할 때까지 `SIGTERM` 을 대기시킴으로써 정상적인 종료를 방해한다.

```
root@a4373403d220:/ebook_moim/ebookFinder# ps -ef
UID        PID  PPID  C STIME TTY          TIME CMD
root         1     0  0 09:02 ?        00:00:00 /bin/bash /ebook_moim/ebookFinder/docker-entrypoint.sh
root        15     1  9 09:02 ?        00:00:01 /usr/local/bin/python /usr/local/bin/uvicorn asgi:application --workers 1 --host 0.0.0.0 
```



## refs
- [Why Your Dockerized Application Isn’t Receiving Signals](https://hynek.me/articles/docker-signals/)
- [Best practices for propagating signals on Docker | Kaggle](https://www.kaggle.com/code/residentmario/best-practices-for-propagating-signals-on-docker)


## links
- [시그널]({{< ref "/posts/시그널.md" >}})
