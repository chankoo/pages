---
title: JWT
categories:
  - 네트워크
tags:
  - web
  - http
  - 인증
date: 2022-11-19T21:38:05+09:00
draft: false
modified: 2024-05-09T16:38:04+09:00
---
JSON Web Token. 사용자의 정보를 Json에 담아 보내는 형식의 웹 토큰이다.

Header / Payload / Signature 로 나뉘며, base64 인코딩을 통해 url-safe한 xxx.yyy.zzz 형태로 표현한다. Header에는 Signature 에 서명한 알고리즘 정보를 담는다.  Payload에는 실제 사용자 정보를 Json 형태로 담으며 추가에 열려있다. Signature는 header와 payload가 변경 안되었음을 보증한다.

주로 인증을 위해 사용하는데, JWT의 유효성(위조 여부)만 확인하면 인증은 완료된다. 이미 JWT 발급 시점에 (id, pwd로) 사용자를 인증했고 그 결과로 JWT를 생성했기에, (Signature를 이용하여) JWT 가 위조되지 않았다는 것만 확인하면 JWT 발급 시점과 같은 사용자라는 것을 알게되는 원리이다.

동작은 아래와 같다. 액세스 토큰의 유효 기간을 짧게하고, 리프레시 토큰을 사용하여 액세스 토큰이 탈취되는 리스크를 보완한다.
1. 사용자가 로그인하면, 서버는 JWT(액세스 토큰, 리프레시 토큰)를 발급한다.
2. 사용자는 JWT를 쿠키나 로컬 스토리지에 저장한다.
3. 사용자는 액세스 토큰과 리프레시 토큰을 포함하여 서버에 요청한다.
	1. 액세스 토큰이 만료되었다면 서버는 리프레시 토큰을 확인한다. 
	2. 리프레시 토큰이 인증된다면 서버는 액세스 토큰을 다시 발급한다.
4. 서버는 액세스 토큰의 위조 여부를 확인하여 인증한다.

리프레시 토큰이 탈취되는 경우를 대비해 별도의 토큰 저장소를 운영하기도 한다.
1. 액세스 토큰과 리프레시 토큰 쌍을 저장하여
2. 리프레시 토큰으로 새 액세스 토큰 발급 요청이 오면
3. 리프레시 토큰으로 기존 액세스 토큰을 조회하여 만료 여부를 확인한다
4. 기존 액세스 토큰이 만료되지 않았다면, 리프레시 토큰이 탈취된 것으로 간주, 리프레시 토큰을 만료시킨다

JWT를 쿠키에 (Http only 옵션 사용하여) 저장하면 브라우저에서(js로) 쿠키 접근이 불가해 XSS로 부터 안전하지만, 매번 request에 권한을 담기 때문에 CSRF로 부터 취약하다. 


![](https://velog.velcdn.com/cloudflare/curiosity806/143796a2-0b71-420d-9f61-d68e9e55bbad/image.png)
비대칭키 방식을 사용하면, 인증 서버가 아닌 곳에서도 JWT를 복호화하여 payload에 담긴 정보를 확인할 수 있다. 즉, 비밀키로 암호화를 공개키로 복호화하는 방식인데, 인증서버가 암호화한 JWT를 제3의 서비스가 복호화하는 방식이다. MSA에서 인증 로직을 여러 서비스에 나눠가져갈 경우, 사용할 수 있겠다.

## refs
- [JSON Web Token - Wikipedia](https://en.wikipedia.org/wiki/JSON_Web_Token)
- [RFC 7519: JSON Web Token (JWT)](https://www.rfc-editor.org/rfc/rfc7519.html)
- [JWT (Json Web Token)와 비대칭키](https://velog.io/@curiosity806/JWT-Json-Web-Token)
- [🌐 JWT 토큰 인증 이란? (쿠키 vs 세션 vs 토큰)](https://inpa.tistory.com/entry/WEB-%F0%9F%93%9A-JWTjson-web-token-%EB%9E%80-%F0%9F%92%AF-%EC%A0%95%EB%A6%AC#Token_%EC%9D%B8%EC%A6%9D_%EB%B0%A9%EC%8B%9D)
- [JWT에서 Refresh Token은 왜 필요한가?](https://velog.io/@park2348190/JWT%EC%97%90%EC%84%9C-Refresh-Token%EC%9D%80-%EC%99%9C-%ED%95%84%EC%9A%94%ED%95%9C%EA%B0%80)
- [JWT는 어디에 저장해야할까? - localStorage vs cookie](https://velog.io/@0307kwon/JWT%EB%8A%94-%EC%96%B4%EB%94%94%EC%97%90-%EC%A0%80%EC%9E%A5%ED%95%B4%EC%95%BC%ED%95%A0%EA%B9%8C-localStorage-vs-cookie)


## links
- [쿠키 보안]({{< ref "/posts/쿠키 보안.md" >}})
- [XSS]({{< ref "/posts/XSS.md" >}})
- [CSRF]({{< ref "/posts/CSRF.md" >}}) 
