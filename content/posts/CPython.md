---
title: CPython
categories:
  - 언어
tags:
  - python
date: 2022-10-03T13:40:56+09:00
modified: 2024-05-09T15:29:33+09:00
---
C로 구현한 파이썬 인터프리터 시스템. 파이썬 언어로 쓰인 스크립트를 바이트코드(.pyc, pycache)로 컴파일한 후, 가상 머신에서 인터프리터로 실행한다. 

![](https://insightbookblog.files.wordpress.com/2022/09/cpython1.png?w=612&zoom=2)

'파이썬은 인터프리터 언어다'는 말은 반은 맞고 반은 틀리다. 전체 코드를 바이트코드로 컴파일하는 과정을 거치기 때문이다. 인터프리터는 컴파일한 언어를 가상머신 위에서 한줄한줄 실행한다. 물론 이건 CPython 기준이고, 구현체에 따라 실행 과정은 달라진다(Pypy, Jython 등)

개발 환경에서는 바이트코드 파일을 생성하는게 귀찮을 때가 있다. 다행히도 바이트 코드 컴파일 과정은 매우 빠르므로, `PYTHONDONTWRITEBYTECODE 1` 설정을 통해 파일을 저장하지 않도록 할 수 있다.





## refs
- [CPython 파헤치기: 따라 하면서 이해하는 파이썬 내부의 동작 원리 – 도서출판 인사이트](https://blog.insightbook.co.kr/2022/09/19/cpython-%ED%8C%8C%ED%97%A4%EC%B9%98%EA%B8%B0-%EB%94%B0%EB%9D%BC-%ED%95%98%EB%A9%B4%EC%84%9C-%EC%9D%B4%ED%95%B4%ED%95%98%EB%8A%94-%ED%8C%8C%EC%9D%B4%EC%8D%AC-%EB%82%B4%EB%B6%80%EC%9D%98-%EB%8F%99/)
- [파이썬의 구현체](https://velog.io/@happycyc/%ED%8C%8C%EC%9D%B4%EC%8D%AC%EC%9D%98-%EA%B5%AC%ED%98%84%EC%B2%B4)


## links
- [인터프리터]({{< ref "/posts/인터프리터.md" >}})
- [Bytecode]({{< ref "/posts/Bytecode.md" >}})
