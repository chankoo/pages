---
title: MVVM
categories: [아키텍처]
tags: [디자인패턴, frontend, iOS]
date: 2022-10-03T13:02:32+09:00
---

## content
View -> ViewModel -> Model 의 구조. 
View 를 그리기 위한 데이터와 비즈니스 로직을 ViewModel에 모두 담아 View와 Model 결합을 끊는다.
![](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FCiXz0%2FbtqBQ1iMiVT%2FstaXr7UO95opKgXEU01EY0%2Fimg.png)



MVC(UIKit) 를 이용하던 iOS 개발의 대세 흐름이 MVVM(SwiftUI)을 이용하는 것으로 변했는데, MVC에 비해 각 계층이 더 잘 분리되어 유지보수와 테스트가 더 용이하다. MVVM은 View가 ViewModel을, ViewModel이 Model을 소유하는 방식인데, MVC의 ViewController가 Model과 View를 모두 떠맡아 비대해지는 이슈를 해결하는 구조이다. 화면을 VC 단위로 구성하는 것이 아니라, View가 필요한 비즈니스 로직(ViewModel)을 가져와 사용하는 것이다.

{{< figure src="/images/Pasted image 20221226224316.png" >}}

계층을 분리하는 구조를 더 자세히 이해하려면 Reactive Programming(Data Binding)과 커맨드 패턴에 대한 이해가 필요하다. 


## refs
- [iOS 개발 — MVVM 패턴이란? UIKit의 MVC와의 비교 | by Heechan | HcleeDev | Medium](https://medium.com/hcleedev/ios-swiftui%EC%9D%98-mvvm-%ED%8C%A8%ED%84%B4%EA%B3%BC-mvc%EC%99%80%EC%9D%98-%EB%B9%84%EA%B5%90-8662c96353cc)


## links
- [Reactive Programming]({{< ref "/posts/Reactive Programming.md" >}})
- [커맨드 패턴]({{< ref "/posts/커맨드 패턴.md" >}})
