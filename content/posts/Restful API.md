---
title: Restful API
categories:
  - 아키텍처
tags:
  - api
  - drf
date: 2024-04-21T12:09:37+09:00
draft: false
featured: false
modified: 2024-04-22T00:43:01+09:00
---
REST(REpresentational State Transfer) 의 설계 원칙을 잘 지킨 API로, **URI로 리소스를, HTTP METHOD로 행위를 표현하는 아키텍처**이다.

Restful API는 아래 특성을 만족한다. Uniform Interface를 제외하고는 http 와 큰 차이가 없다.
- **Uniform Interface**
- Stateless
- Cacheable
- Client - Server
- Layered System

Uniform Interface은 아래와 같은 조건을 일관되게 만족하는 것을 의미한다.
- Identification of resources(by URI): URI를 통해 리소스를 유니크하게 식별한다.
- manipulation of resources through represenations: 표현의 전송(http 메시지에 포함)을 통해 리소스를 조작(생성, 수정, 삭제)한다.
- **Self-descriptiveness: 메시지 그 자체로 온전히 해석 가능해야한다.**
	- 서버가 변해서 메시지가 바뀌더라도, 메시지 자체로 이해 가능하다.
	- 메시지를 설명하는 별도의 명세가 필요할 수 있다.
- **HATEOAS**(Hypermedia as the engine of application state): **하이퍼링크를 통해 애플리케이션 상태를 전이해야한다.**
	- html에서 a 태그를 통해 전이 가능한 상태를 표현하는 것과 같이,
	- json으로 응답하더라도 전이 가능한 링크를 포함해야한다.
		- ex) DRF에서 pagination을 사용하면, Response 어트리뷰트 'next'와 'previous'에 각각 링크를 담아준다.


## refs
- [REST API 제대로 알고 사용하기 : NHN Cloud Meetup](https://meetup.nhncloud.com/posts/92)
- [[REST API] 그런 REST API로 괜찮은가?](https://blogshine.tistory.com/367)
- [rest](https://slides.com/eungjun/rest#/76/0/4)




## links
- 
