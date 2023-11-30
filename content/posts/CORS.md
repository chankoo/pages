---
title: CORS
categories:
  - 보안
tags:
  - web
  - http
  - 브라우저
date: 2023-11-29T21:32:15+09:00
draft: false
modified: 2023-11-30T23:25:21+09:00
---

## content
Cross-Origin Resource Sharing. 출처가 다른(Cross-Origin) 요청에 대해 리소스를 내려 줄 것인지 판단하는 정책이다. 

- 요청 헤더 Origin에 출처가 담긴다.
- 스킴, 도메인, 포트 중 하나라도 다르면 Cross-Origin으로 본다.
- 응답 헤더 Access-Control-Allow-Origin에 허용된 출처가 담긴다.
- 브라우저가 Origin, Access-Control-Allow-Origin 그리고 요청 시나리오를 고려하여 CORS 위반 여부를 판단한다.


## refs
- [CORS는 왜 이렇게 우리를 힘들게 하는걸까? | Evans Library](https://evan-moon.github.io/2020/05/21/about-cors/)


## links
- 
