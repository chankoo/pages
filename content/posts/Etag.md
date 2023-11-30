---
title: Etag
categories:
  - 네트워크
tags:
  - http
  - cache
date: 2022-11-04T11:32:20+09:00
draft: false
modified: 2023-11-30T14:32:17+09:00
---

## content
클라이언트의 http 요청의 갱신 여부를 파악하기 위해 설정하는 응답 헤더. 

요청 -> 서버가 요청을 Etag 변환(해시 사용) -> 응답 헤더에 Etag 포함 -> 클라이언트가 사용(If-None-Match에 담아)해 요청 -> 동일한 Etag 라면 http 304 Not Modified 반환


## refs
- [Etag를 이용하여 더 나은 Restful API 만들기 | 요즘IT](https://yozm.wishket.com/magazine/detail/1772/)
- [Conditional View Processing | Django documentation | Django](https://docs.djangoproject.com/en/dev/topics/conditional-view-processing/)
- [ETag - HTTP | MDN](https://developer.mozilla.org/ko/docs/Web/HTTP/Headers/ETag)


## links
- 
