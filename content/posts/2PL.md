---
title: 2PL
categories:
  - DB
tags:
  - 동시성
date: 2023-12-20T21:29:31+09:00
draft: false
featured: false
modified: 2023-12-20T21:43:27+09:00
---

## content
Two Phase Locking. DB에서 직렬성을 구현하는데 널리 쓰이는 알고리즘.

잠금을 확장과 수축의 두단계로 나누어 모든 트랜잭션이 lock을 획득한 후 차례로 unlock 하기에 직렬성을 구현할 수 있다.

 ![](https://mblogthumb-phinf.pstatic.net/MjAxOTA3MDFfOTMg/MDAxNTYxOTY3MjQzOTc0.0aYn8JfZiGEQl1CtQaixDz-1h37Uk4VCkQbjQ4qeHTcg.BEYO6A0-A17e0A1Te3mezcHlVoNGA22t_TI2D02Nrh4g.PNG.sdug12051205/1.png?type=w2)

## refs
- [데이터 중심 애플리케이션 설계]({{< ref "/posts/데이터 중심 애플리케이션 설계.md" >}})
- [2 Phase Locking (2PL) : 네이버 블로그](https://m.blog.naver.com/sdug12051205/221575076036)


## links
- [직렬성]({{< ref "/posts/직렬성.md" >}})
