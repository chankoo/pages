---
title: gRPC
categories:
  - 네트워크
tags:
  - http
  - api
date: 2022-11-29T19:33:00+09:00
draft: false
modified: 2024-01-09T11:33:04+09:00
---
google에서 개발한 RPC(Remote Procedure Call) 프레임워크.

기존 RPC처럼, 네트워크 통신이 필요한 요청을 로컬에서 호출하는 것처럼 도와주는 프로토콜이다. HTTP/2 를 사용하며 프로토콜 버퍼(ProtoBuf)를 이용해 통신 효율을 높이는 특징이 있다.

일반적인 http 기반 API(REST 등) 보다 더 빠르고(5배 가량), HTTP2의 기능을 사용할 수 있는 것이 장점이다.

## refs
- [[네이버클라우드 기술&경험] 시대의 흐름, gRPC 깊게 파고들기 #1 | by NAVER CLOUD PLATFORM | NAVER CLOUD PLATFORM | Medium](https://medium.com/naver-cloud-platform/nbp-%EA%B8%B0%EC%88%A0-%EA%B2%BD%ED%97%98-%EC%8B%9C%EB%8C%80%EC%9D%98-%ED%9D%90%EB%A6%84-grpc-%EA%B9%8A%EA%B2%8C-%ED%8C%8C%EA%B3%A0%EB%93%A4%EA%B8%B0-1-39e97cb3460)
- [What is RPC? gRPC Introduction. - YouTube](https://www.youtube.com/watch?v=gnchfOojMk4&t=11s&ab_channel=ByteByteGo)


## links
- [HTTP2]({{< ref "/posts/HTTP2.md" >}})
- [프로토콜 버퍼]({{< ref "/posts/프로토콜 버퍼.md" >}})
