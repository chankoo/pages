---
title: 도커 Shutdown
categories:
  - OS
tags:
  - docker
date: 2024-01-27T18:11:01+09:00
draft: false
featured: false
modified: 2024-01-27T23:20:55+09:00
---
일반적으로 `docker stop [-t]`  명령(SIGTERM)을 통해 컨테이너의 graceful shutdown을 유도한다. t초 후 SIGKILL을 통해 프로세스를 강제 종료한다.

다만 컨테이너의 루트 프로세스에 시그널을 보내는 것임을 주의해야한다. 종료하려는 프로세스가 루트가 아닌 경우, 비정상적으로 종료될 수 있다. 아래와 같이 `entrypoint` 를 이용한 경우, 컨테이너 루트 프로세스인 `/bin/bash` 가 종료 시그널을 받게 되는 것이다. `/bin/bash`는 `SIGTERM` 을 자식 프로세스에 전파하지 않아 정상적인 종료를 방해한다. 

```
root@a4373403d220:/ebook_moim/ebookFinder# ps -ef
UID        PID  PPID  C STIME TTY          TIME CMD
root         1     0  0 09:02 ?        00:00:00 /bin/bash /ebook_moim/ebookFinder/docker-entrypoint.sh
root        15     1  9 09:02 ?        00:00:01 /usr/local/bin/python /usr/local/bin/uvicorn asgi:application --workers 1 --host 0.0.0.0 
```

이는 컨테이너 ENTRYPOINT(CMD)인 프로세스를 루트 프로세스(PID 1)로 정의하는 도커의 특성 때문이다. 원래 리눅스는 PID 1인 init 프로세스를 모든 프로세스의 루트로 두어 자식 프로세스를 관리하고, 고아가 된 프로세스를 거두는 역할을 한다. init 프로세스 역할을 임의의 명령이 대체하며 1) 종료 시그널을 전파하지 않고 2) 좀비 프로세스가 발생하는 문제를 만드는 것이다. 

이를 해결하기 위해 **Tini**, **Dumb-It** 과 같은 컨테이너 초기화 시스템(프로세스)를 사용한다. `ENTRYPOINT ["tini", "--", "/docker-entrypoint.sh"]` , `ENTRYPOINT ["/usr/bin/dumb-init", "--", "/my/script"]` 과 같이 명령 프로세스를 감싸는 형태로 사용하여 tini 또는 dumb-init 프로세스를 루트 프로세스로 만드는 방식이다. 해당 초기화 프로세스는 signal 핸들러를 내장하여 자식에게 시그널을 전파하고, 고아 상태인 자손 프로세스를 자식으로 거두는 역할을 수행한다. 

Docker 1.13 부터는 도커가 Tini를 내장하여 명령어에 옵션 추가하여 간단히 사용할 수 있다. 아래 예시와 같이 `/sbin/docker-init` 이라는 tini 프로세스가 init 프로세스의 역할을 맡게된다.
- `docker run --init`(docker)
- `init: true`(docker-compose)

```
root@4e975699fee8:/ebook_moim/ebookFinder# ps -ef
UID        PID  PPID  C STIME TTY          TIME CMD
root         1     0  0 14:16 ?        00:00:00 /sbin/docker-init -- /ebook_moim/ebookFinder/docker-entrypoint.sh
root         8     1  0 14:16 ?        00:00:00 /bin/bash /ebook_moim/ebookFinder/docker-entrypoint.sh
root        16     8 12 14:16 ?        00:00:00 /usr/local/bin/python /usr/local/bin/uvicorn asgi:application --workers 1 --host 0.0.0.0 --port
```

## refs
- [Why Your Dockerized Application Isn’t Receiving Signals](https://hynek.me/articles/docker-signals/)
- [Best practices for propagating signals on Docker | Kaggle](https://www.kaggle.com/code/residentmario/best-practices-for-propagating-signals-on-docker)
- [컨테이너 환경을 위한 초기화 시스템 (tini, dumb-init) | Swalloow Blog](https://swalloow.github.io/container-tini-dumb-init/)


## links
- [시그널]({{< ref "/posts/시그널.md" >}})
