---
title: GIL
categories:
  - 언어
tags:
  - python
  - 동시성
date: 2022-10-03T15:57:13+09:00
draft: true
modified: 2023-12-02T13:27:44+09:00
---

## content
파이썬 객체의 레퍼런스 카운팅이 정상적으로 동작하도록, 인터프리터의 동작을 전역적으로 통제하는 락. 여러 스레드가 한 객체의 레퍼런스 카운트를 조작하는 [동시성]({{< ref "/posts/동시성.md" >}}) 을 제어하기위해, GIL 을 가진 스레드만 자원을 통제할 수 있다.

더 구체적으로 말하면, 멀티 스레딩 환경에서 각 스레드는 레퍼런스 카운팅을 위해 PyObject 의 ob_refcnt를 조작하는데, 이는 race condition이다. race condition 해결을 위해 일반적인 mutex 를 사용하자니 각 객체 마다 락이 필요하고, deadlock 의 리스크도 존재한다. 그래서 파이썬(CPython)은 GIL을 통해 인터프리터 자체를 잠가버렸다.

GIL로 레퍼런스 카운팅 문제를 해결했지만, 이것이 파이썬에서 race condition 이 발생하지 않는다는 얘기는 아니다. GIL은 바이트코드를 레벨에서 atomic한 실행을 보장하기 때문이다. 

![](https://miro.medium.com/max/1100/1*6oZyK3qTdl5pmd5U1ucznA.jpeg)

ex) GIL 을 획득하려 대기하는 스레드(B)는 timeout을 걸고 -> timeout 내 작업을 완료 못한 스레드(A)는 작업을 중단한다. 스레드 A의 작업은 thread-safe 하지 못하다.

```
[GIL 의 timeout]
import sys
sys.getswitchinterval()  # default 5ms
```




## refs
- [왜 Python에는 GIL이 있는가](https://dgkim5360.tistory.com/entry/understanding-the-global-interpreter-lock-of-cpython)
- [Gunicorn vs Python GIL. What is the Python GIL, how it works… | by Luis Sena | Medium](https://luis-sena.medium.com/gunicorn-vs-python-gil-221e673d692)


## links
- [동시성]({{< ref "/posts/동시성.md" >}})
- [PyObject]({{< ref "/posts/PyObject.md" >}})
- [Race Condition]({{< ref "/posts/Race Condition.md" >}})
- [CPython]({{< ref "/posts/CPython.md" >}})
- [스레드와 잠금장치 발표자료.pdf](obsidian://open?vault=chankoo&file=Media%2F7%EA%B0%80%EC%A7%80%20%EB%8F%99%EC%8B%9C%EC%84%B1%20%EB%AA%A8%EB%8D%B8%20-%20%EC%8A%A4%EB%A0%88%EB%93%9C%EC%99%80%20%EC%9E%A0%EA%B8%88%EC%9E%A5%EC%B9%98.pdf)
- [Bytecode]({{< ref "/posts/Bytecode.md" >}})
- [Thread Safe]({{< ref "/posts/Thread Safe.md" >}})
