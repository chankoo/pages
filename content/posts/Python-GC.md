---
title: Python-GC
categories:
  - 언어
tags:
  - python
  - 메모리
date: 2022-10-03T16:08:52+09:00
modified: 2023-11-27T20:58:23+09:00
---

## content
파이썬(CPython)에서는 아래 두가지 객체에 대해 가비지 컬렉션을 실행한다.

1. PyObject의 ref count가 0
2. 순환 참조가 발생했고 그 외의 참조는 없음


	>예제
	> 1. l = []
	> 2. l.append(l)
	> 3. del l


## refs
- [Python GC가 작동하는 원리](https://blog.winterjung.dev/2018/02/18/python-gc)


## links
- [가비지 컬렉션]({{< ref "/posts/가비지 컬렉션.md" >}})
- [PyObject]({{< ref "/posts/PyObject.md" >}})
