---
title: API Gateway 패턴
categories:
  - 아키텍처
tags:
  - MSA
  - api
date: 2023-05-18T20:29:43+09:00
draft: false
modified: 2023-12-12T16:17:34+09:00
---

## content
1. API Gateway Pattern 을 정확히 이해하자
	- MSA에 API Gateway Pattern이 필수적임
	- API Gateway Pattern은 API Gateway Framework와는 무관함
		- 내부 api를 제공(단순 라우팅)할 용도로 API Gateway Framework를 쓰지말자 -> controller와 facade가 없는 프레젠테이션 레이어를 구현하게됨
		- 인가 로직이 비즈니스 레이어(각각의 마이크로서비스)에 들어가야해서 오염됨
		- 로직 구현의 책임을 잘못된 곳에 전가함
			- 클라이언트가 여러 로직을 직접 호출하여 조합하거나
			- 특정 서비스가 자신의 도메인인 것처럼 다른 서비스를 호출하여 구현하는 문제
		- 클라이언트와 비즈니스 레이어의 강결합
		- 클라이언트 성능 저하
		- 내부 서비스의 프로토콜 제약
			- 클라이언트에 응답할 수 있는 Http api 로 고정됨


{{ $image := resources.Get "images/image 1.png" }}

2. API Gateway Pattern 의 종류
	1. Edge Gateway(중앙 집중식)
		1. 가장 일반적인 패턴으로 게이트웨이가 거의 모든 것을 처리함. (마이크로)서비스가 많고, 서비스간(east-west) 트래픽이 많은 경우 적합하지 않음
			- SSL/TLS termination
			- 인증 (Authentication)
			- 권한 부여 (Authorization)
			- 요청 라우팅 (Request routing)
			- 속도 제한 (Rate limiting)
			- Request/response manipulation
			- Facade routing
		- {{ $image := resources.Get "images/Pasted image 20230525094854.png" | resources.Resize "400x" }}
	2. Two-Tier Gateway(2계층)
		1. 보안 게이트웨이와 라우팅 게이트웨이로 역할을 나눔. Edge Gateway 단독으로 쓰는 것보다 유연하지만 라우터 하나에 모든 서비스가 물려있는 한계가 있음
			1. 보안 게이트웨이
				- SSL/TLS termination
				- 인증 (Authentication)
				- 연결 및 요청의 중앙 집중식 로깅 (Centralized logging of connections and requests)
				- 추적 주입 (Tracing injection)
			2. 라우팅 게이트웨이
				- 권한 부여 (Authorization)
				- 서비스 발견 (Service discovery)
				- 부하 분산 (Load balancing)
			- {{ $image := resources.Get "images/Pasted image 20230525095238.png" | resources.Resize "400x" }}
	3. Microgateway
		1. 2계층을 확장하여 서비스마다 전용 게이트웨이를 두는 방식으로, 서비스 간 트래픽을 관리하는데 용이한 구조
			1. Edge 게이트웨이
				- SSL/TLS termination
				- 라우팅 (Routing)
				- 속도 제한 (Rate limiting)
			2. 마이크로 게이트웨이
				- 부하 분산 (Load balancing)
				- 서비스 발견 (Service discovery)
				- API별 인증 (Authentication per API)
		- {{ $image := resources.Get "images/Pasted image 20230525100203.png" | resources.Resize "400x" }}
	4. Per-Pod Gateway
		1. 개별 pod(또는 컨테이너)에 프록시 게이트웨이를 포함하는 형태로 Microgateway를 확장
		2. {{ $image := resources.Get "images/Pasted image 20230525095658.png" | resources.Resize "400x" }}
	5. Sidecar Gateways and Service Mesh(사이드카 게이트웨이 및 서비스 메시)
		1. 사이드카 게이트웨이가 ingress와 engress 를 모두 수행하는 형태로 보통 서비스 메시를 통하여 구현된다.
		2. 사이드카 게이트웨이
			- 아웃바운드 부하 분산 (Outbound load balancing)
			- 서비스 검색 통합 (Service discovery integration)
			- 서비스 간 인증 (Inter‑service authentication)
			- 권한 부여 (Authorization)
		1. {{ $image := resources.Get "images/Pasted image 20230525095907.png" | resources.Resize "400x" }}



## refs
- [WOOWACON](https://woowacon.com/ko/2022/detailVideo/18)
- [마이크로서비스 패턴]({{< ref "/posts/마이크로서비스 패턴.md" >}})
- [효과적인 API 제공을 위한 API Gateway 패턴 선택 - NGINX STORE](https://nginxstore.com/blog/api-gateway/%ed%9a%a8%ea%b3%bc%ec%a0%81%ec%9d%b8-api-%ec%a0%9c%ea%b3%b5%ec%9d%84-%ec%9c%84%ed%95%9c-api-gateway-%ed%8c%a8%ed%84%b4-%ec%84%a0%ed%83%9d/)


## links
- [서비스 메시]({{< ref "/posts/서비스 메시.md" >}})
