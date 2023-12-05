---
title: TCP
categories:
  - 네트워크
tags:
  - TCP
date: 2023-12-05T20:08:04+09:00
draft: false
modified: 2023-12-05T21:35:15+09:00
---

## content
Transmission Control Protocol. TCP/IP 스택 전송 계층 프로토콜로 소켓 간 신뢰할 수 있는 통신을 보장한다.

- 프로세스와 프로세스(엄밀히는 소켓과 소켓)를 잇는 논리적인 개념의 **point-to-point** 통신
- **reliable**: 응용계층에서 받은 데이터의 error와 loss가 없음을 보장
- **in-order byte stream**: 데이터의 순서를 유지
- **Pipelined** : window size 단위로 패킷을 묶어 통신
- **send & receive buffers**: 송신 측과 수신 측 모두 send, receive buffer를 각각 가짐
- **Full duplex**: 통신하는 host 양쪽 모두가 데이터 전송 가능
- **Connection oriented**: handshake를 먼저 수행한 후 통신. handshake에서 window size, buffer, seq number와 같은 정보를 교환함
- **Flow control**
- **Congetion control**


## refs
- [TCP.md](https://github.com/chankoo/TIL/blob/master/general/TCP.md)
- [reliable\_data\_transfer.md](https://github.com/chankoo/TIL/blob/master/general/reliable_data_transfer.md)


## links
- [소켓]({{< ref "/posts/소켓.md" >}})
