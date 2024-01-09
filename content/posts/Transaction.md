---
title: Transaction
categories:
  - DB
tags: 
date: 2022-10-10T16:37:09+09:00
draft: false
modified: 2024-01-09T12:04:31+09:00
---
DB에서 데이터를 조작하는 논리적 작업 단위.
이론적으로 Transaction은 ACID해야한다. 

예로 들면, 송금은 한 Transaction 이어야 하는데, 송금을 구성하는 1) 본인 계좌에서 출금 2) 상대 계좌에 입금이

- Atomic - 발생하거나, 발생하지 않거나하여 그 중간 상태가 없어야하며
- Correct(Consistant) - 송금 실행 전 후 모두 관련된 제약을 지키는 상태여야하며
- Isolated - 송금 실행 중 다른 Transaction과는 격리(read x, write x)되어야 하며
- Durable - 송금 성공의 시점 데이터를 지속적으로 보관해야한다.



## refs
- 


## links
- 
