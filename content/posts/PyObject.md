---
title: PyObject
categories: [언어]
tags: [python, 메모리]
date: 2022-10-03T15:37:15+09:00
draft: true
---

## content
일반적인 CPython 구현체를 가정했을때, 파이썬의 메모리 관리 알고리즘은 C로 쓰여졌고, 이해를 위해서는 CPython 의 내부 구현을 알아야한다.

모든 파이썬 객체는 PyObject라는 c struct 를 확장하여 가지고 있다. PyObject는 ob_type 포인터 객체의 타입 오브젝트를 가리키고, ob_refcnt를 통해 레퍼런스 카운팅을 한다. 

![](https://www.heurekadevs.com/upload/514-figure-1-1.png)



## refs
- https://realpython.com/python-memory-management/#memory-management-from-hardware-to-software


## links
- [[CPython]]
