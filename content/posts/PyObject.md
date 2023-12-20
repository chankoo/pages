---
title: PyObject
categories:
  - 언어
tags:
  - python
date: 2022-10-03T15:37:15+09:00
modified: 2023-12-20T17:10:59+09:00
---

## content
일반적인 CPython 구현체를 가정했을때, 파이썬의 메모리 관리 알고리즘은 C로 쓰여졌고, 이해를 위해서는 CPython 의 내부 구현을 알아야한다.

모든 파이썬 객체는 PyObject라는 c struct 를 확장하여 가지고 있다. 
- ob_type 은 해당 객체의 타입 오브젝트(PyTypeObject)를 가리키는 포인터이다.
	- PyTypeObject 역시 c struct 이며 특정 타입(int, dict 등)에 대한 메타 데이터를 가진다.
- ob_refcnt 는 객체를 참조하는 레퍼런스의 수를 저장한다.

![](https://www.heurekadevs.com/upload/514-figure-1-1.png)



## refs
- [Memory Management in Python – Real Python](https://realpython.com/python-memory-management/#memory-management-from-hardware-to-software)


## links
- [CPython]({{< ref "/posts/CPython.md" >}})
