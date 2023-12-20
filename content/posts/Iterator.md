---
title: Iterator
categories:
  - 자료구조
tags:
  - 디자인패턴
  - python
  - javascript
  - java
date: 2022-10-11T23:36:52+09:00
draft: false
modified: 2023-12-20T17:48:04+09:00
---

## content
특정 집합 객체 요소에 순차적으로 접근 가능하도록 구현해놓은 객체. Iterator 패턴을 따라서 내부를 노출하지 않고 집합 객체의 구현에 종속되지 않아야한다.

Iterator 를 제공하는 객체는 Iterator Protocol 을 따랐다고 표현하는데, 이는 언어마다 상이하다. 에를 들어 javascript 에선 Iteration Protocol 하위에 Iteration Protocol 과 Iterator Protocol이 존재한다.

구현은 프로그래밍 언어마다 다양할 수 있다. 보통 Iterable 객체와 묶여서 구현한다. python과 java 모두 Iterable 객체로 부터 Iterator를 얻으며(__iter__, iterator()), 다음 요소를 가져오는 메소드를 제공한다(__next__, next()). 그리고 Iterable 을 상속받은 기본 자료형이 존재한다. 이 자료형들은 순회를 위한 코드를 따로 작성하지 않아도 Iterator 를 통해 반복 가능하다. for _ in Iterable 객체: 와 같은 형태로 작성하면 Iterable 객체가 내부적으로 Iterator를 통해 다음 요소를 불러오는 것이다.

![python Iterable](https://dojang.io/pluginfile.php/13952/mod_page/content/3/039002.png)

![java iterator](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FvV8SN%2FbtqP12nvlzR%2Fos6HVe7yvvmXC0QQCnJ2EK%2Fimg.png)





## refs
- [GoF의 디자인 패턴]({{< ref "/posts/GoF의 디자인 패턴.md" >}})
- [파이썬 코딩 도장: 39.1 반복 가능한 객체 알아보기](https://dojang.io/mod/page/view.php?id=2405)
- [[Java] Iterable과 Iterator :: 그냥 그냥 블로그](https://girawhale.tistory.com/17)


## links
- 
