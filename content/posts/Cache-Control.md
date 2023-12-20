---
title: Cache-Control
categories:
  - 네트워크
tags:
  - cache
  - http
  - 브라우저
date: 2023-11-30T14:18:34+09:00
draft: false
modified: 2023-12-16T11:14:25+09:00
---

## content
리소스의 캐시 여부를 지정하는 http 응답/요청 헤더. Cache-Control에 부여한 directive에 따라 캐시 사용 전략이 결정된다. Etag나 bfcache 등이 모두 영향받는다.

- private - only cached in client
- public - can be cached in proxies

{{< image src="/images/Pasted image 20231130142540.png" >}}

## refs
- [Cache-Control - HTTP | MDN](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Cache-Control)
- [프론트엔드 개발자가 알아야 할 ‘캐싱’ 개념 정리 | 요즘IT](https://yozm.wishket.com/magazine/detail/2341/)


## links
- [Etag]({{< ref "/posts/Etag.md" >}})
- [bfcache]({{< ref "/posts/bfcache.md" >}})
