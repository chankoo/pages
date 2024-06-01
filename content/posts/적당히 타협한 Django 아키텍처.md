---
title: 적당히 타협한 Django 아키텍처
categories:
  - 아키텍처
tags:
  - django
  - MSA
  - DDD
date: 2023-11-09T23:16:07+09:00
draft: false
modified: 2024-06-01T23:41:13+09:00
---
{{< image src="/images/Screenshot 2024-04-24 at 9.57.51 AM.png" >}}

Django는 아래와 같은 특성 때문에 클린 아키텍처와 DDD를 적용하기 어렵다. (프레임워크의 의도와 다르게 코드를 작성해야하는 경우가 생긴다.)
1. 액티브 레코드 패턴을 사용하는 Model -> 도메인 모델로만 사용하기 어렵고 DB 테이블 구조와 밀접하게 연관
2. 비즈니스 로직과 엮여있는 View -> 뷰에 비즈니스 로직을 구현하기 쉬운 구조
3. Django ORM -> 데이터를 가져오고 저장하는 방식이 특정 ORM 코드에 종속됨

차선으로 DDD를 선택적으로 적용한 Layered 아키텍처를 생각한다. MSA로 확장 가능성을 고려해서, 적당히 타협한 아키텍처를 생각해본다.
1. app 단위로 Bounded Context를 정의하고
2. Domain Logic은 Model에 두고(Rich Domain Model)
3. Service Layer(User cases)에 Application Logic을 분리한다.
	1. 도메인 객체 사용
	2. 엔티티 조회/저장
	3. 트랜잭션 보장
	4. 사용자 인증/인가
	5. 입력값 검증
	6. Domain Event의 Listener
	7. 로깅
4. API 게이트웨이 패턴을 사용(또는 준비)한다. 게이트웨이 컴포넌트의 API에서 서비스의 API(또는 프로시저)를 조합한다.


DRF를 사용한다면 아키텍처의 혼란은 더 가중될 수 있다. 
- 시리얼라이저의 역할이 너무 많다. 원래 목적인 직렬화/역직렬화 외에도, 비즈니스 로직을 다루고 데이터 저장에 관여한다. 심지어 DRF의 뷰도 시리얼라이저에 강하게 종속되어있다.
- 비즈니스 로직을 책임질 곳이 불분명하다. 아래 모듈은 각각의 이유로 (비즈니스 로직을 구현하기에) 적합하거나, 적합하지 않다.
	- Model - Django 설계 철학에 적합하나, Active Record 의 한계로 DDD 등 적용 어려움
	- View - 프레젠테이션 레이어로 기능하는게 이상적이나 역시 Django 특성상 비즈니스 로직을 포함하기 쉬움
	- Serializer - 코어는 데이터 직/역직렬화 기능이나, 편의를 위해 비대해졌다. 데이터 접근 및 저장하는 Repository, 입출력 형식을 검증하는 Validator, 심지어 request 객체를 다루는 Controller로서 쓰일 수도 있다. 어떤 형태로든 비즈니스 로직이 섞이기 쉽다.


## refs
- [Clean Architectures in Python - presented by Leonardo Giordani - YouTube](https://youtu.be/C7MRkqP5NRI?si=HH5KeCVOP8UOtLJS&t=2249)
- [GitHub - HackSoftware/Django-Styleguide: Django styleguide used in HackSoft projects](https://github.com/HackSoftware/Django-Styleguide)
- [Django와 DDD가 함께하기 어려운 이유 (7/11 보완) | by Junha Baek | junhabaek](https://tech.junhabaek.net/django%EC%99%80-ddd%EB%8A%94-%ED%95%A8%EA%BB%98%ED%95%A0-%EC%88%98-%EC%97%86%EB%8A%94-%EC%A1%B4%EC%9E%AC%EC%9D%BC%EA%B9%8C-6602cf392c09)
- [Django와 Layered Architecture 사이에서 타협점 찾기 | by 아테나스랩 | 아테나스랩 팀블로그 | Medium](https://medium.com/athenaslab/django%EC%99%80-layered-architecture-%EC%82%AC%EC%9D%B4%EC%97%90%EC%84%9C-%ED%83%80%ED%98%91%EC%A0%90-%EC%B0%BE%EA%B8%B0-70769c13ef9d)
- [백엔드 서버 Application Layer의 개요, 역할, 구현 방식 | junhabaek](https://tech.junhabaek.net/%EB%B0%B1%EC%97%94%EB%93%9C-%EC%84%9C%EB%B2%84-%EC%95%84%ED%82%A4%ED%85%8D%EC%B2%98-application-layer-1-%EA%B0%9C%EC%9A%94%EC%99%80-%EA%B8%B0%EB%B3%B8-variation-9fac801ddba8#c757)
- [Django는 죄가 없다](https://www.qu3vipon.com/django-is-innocent)
- [Django, DRF Serializers - serializer 파헤치기, 왜 serializer? response가 만들어지기 까지](https://velog.io/@qlgks1/Django-DRF-Serializers-serializer-%ED%8C%8C%ED%97%A4%EC%B9%98%EA%B8%B0-%EC%99%9C-serializer-response%EA%B0%80-%EB%A7%8C%EB%93%A4%EC%96%B4%EC%A7%80%EA%B8%B0-%EA%B9%8C%EC%A7%80)


## links
- [Active Record]({{< ref "/posts/Active Record.md" >}})
- [클린 아키텍처]({{< ref "/posts/클린 아키텍처.md" >}})
