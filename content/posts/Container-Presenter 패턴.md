---
title: Container-Presenter 패턴
categories:
  - 아키텍처
tags:
  - 디자인패턴
  - react
date: 2022-10-03T12:37:15+09:00
modified: 2023-12-02T13:13:14+09:00
---

## content
리액트에서 로직과 뷰 컴포넌트를 분리하는 패턴. 데이터를 가져오고 가공하는 컨테이너 컴포넌트와, 데이터를 렌더링하는 프레젠터 컴포넌트로 나눈다. 

aka Smart & Dumb conponents
대개 컨테이너는 렌더링하는 컴포넌트 외에 다른 ui는 렌더링하지 않으며, 프레젠터는 컨테이너로 부터 데이터를 받아 단순히 렌더링 한다.

관심사 분리를 통해 재사용성 높은 순수한 프레젠터 컴포넌트를 만드는 이점이 있으며, 테스트가 쉬워서 험블 객체 패턴을 따랐다고도 볼 수 있겠다.

반면 데이터 가져오는 역할을 hook이 점차 대체하며, 굳이 컨테이너 컴포넌트를 두는게 불필요하다는 의견도 늘고있다.

{{< ref "/images/Component.png|400" >}}


## refs
- [Container/Presentational Pattern](https://www.patterns.dev/posts/presentational-container-pattern/)


## links
- [험블 객체 패턴]({{< ref "/posts/험블 객체 패턴.md" >}})
