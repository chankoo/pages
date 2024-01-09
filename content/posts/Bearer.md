---
title: Bearer
categories:
  - 네트워크
tags:
  - 인증
date: 2022-11-19T22:58:21+09:00
draft: false
modified: 2024-01-09T11:33:31+09:00
---
OAuth2.0 에서 정의된 내용으로, 인증을 위해 토큰이 정보를 전달(bear)함을 의미하는 문자열이다.

```
[header]
Authorization: <type> <credentials>
Authorization: Bearer {a token}
```

토큰은 대부분 JWT를 사용한다.

## refs
- [RFC 6750 - The OAuth 2.0 Authorization Framework: Bearer Token Usage](https://datatracker.ietf.org/doc/html/rfc6750)
- [토큰 기반 인증 Bearer Authentication](https://www.ssemi.net/what-is-the-bearer-authentication/)


## links
- [JWT]({{< ref "/posts/JWT.md" >}})
- [OAuth2.0]({{< ref "/posts/OAuth2.0.md" >}})
