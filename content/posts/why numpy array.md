---
title: why numpy array
categories: [언어]
tags: [python, numpy, 메모리]
date: 2022-10-03T16:17:54+09:00
---

## content
파이썬의 list 보다 np array가 
1) 더 빠르다 
	1. element로 PyObject 대신 value를 들고 있어 직접 접근할 수 있다.
2) 메모리 효율이 좋다. 
	1. element의 크기가 작다
		1. 1. PyObject - 4 for type pointer, 4 for reference count, 4 for value -- and the memory allocators rounds up to 16
		2. value - single-precision numbers takes 4 bytes each, double-precision ones, 8 bytes
	2. 동적배열 아니어서 크기가 고정이며
	3. 정적할당하여 element 타입이 고정이다


## refs
- 


## links
- [PyObject]({{< ref "/posts/PyObject.md" >}})
- [Dynamic Array]({{< ref "/posts/Dynamic Array.md" >}})
