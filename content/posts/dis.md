---
title: dis
categories: [언어]
tags: [python]
date: 2022-10-09T22:02:55+09:00
draft: true
---

## content
파이썬 바이트코드 역 어셈블러. CPython의 바이트 코드를 역 어셈블하여 바이트 코드 레벨의 분석을 돕는 모듈이다.

ex)
```
def hi(x):
	x += 1
	print(x)
	return x
```

![[Pasted image 20221009230203.png]]

![[Pasted image 20221009225606.png]]

위 정의에 따르면, 추상화한 바이트코드를 바이트코드로 바꾸는 것도 어셈블이라 볼 수 있다.

## refs
- https://python.flowdas.com/library/dis.html


## links
- [[Bytecode]]
- [[Assembler]]
