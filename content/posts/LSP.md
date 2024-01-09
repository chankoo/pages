---
title: LSP
categories:
  - 아키텍처
tags:
  - SOLID
date: 2022-10-30T17:51:17+09:00
draft: false
modified: 2024-01-09T14:16:34+09:00
---
리스코프 치환 원칙; Liskov Subsitution Principle
상위 타입 객체는 하위 타입 객체로 별도 조작 없이 치환 가능해야한다.

객체 지향 언어는 다형성을 제공하기에, LSP를 지킨 설계를 활용하기 유리하다. 사용할 하위 타입을 런타임에 선택하여 상위 타입을 대체하기 용이하다. 

LSP를 위반하면 OCP를 위반하는 것이다. 하위 타입을 추가(확장)하여 상위 타입을 바로 대체할 수 없기 때문이다. LSP를 위반한다면 보통 해당 객체를 사용하는 클라이언트 코드를 수정해야한다. 그리고 이 수정은 끔찍한 형태로 의존을 낳는다. 흔히 드는 예시가 *직사각형을 상속한 정사각형* 인데, 정사각형은 반드시 너비와 높이가 일치해야하므로 직사각형 객체를 대체할 수 없다. 때문에 다형성을 활용해 의존 없이 짜두었던 클라이언트 코드에 직사각형 여부를 확인하는 방식(isinstanceof 나 downcasting을 사용하는 것이 전형적인 위반이다)으로 코드를 수정해야한다. 수정에는 닫혀 있다는 OCP도 위반하는 것이다.

## refs
- [클린 아키텍처]({{< ref "/posts/클린 아키텍처.md" >}})
- [Fetching Title#gtbo](https://steady-coding.tistory.com/383)


## links
- [OCP]({{< ref "/posts/OCP.md" >}})
- [다형성]({{< ref "/posts/다형성.md" >}})
- [SOLID]({{< ref "/posts/SOLID.md" >}})
