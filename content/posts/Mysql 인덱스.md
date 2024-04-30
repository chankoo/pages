---
title: Mysql 인덱스
categories:
  - DB
tags:
  - mysql
date: 2023-11-21T19:20:55+09:00
draft: false
modified: 2024-04-28T12:03:16+09:00
---
mysql의 InnoDB는 아래와 같은 구조로 인덱스를 생성한다. 해당 인덱스는 B-Tree 로 기본키를 저장하고, 기본키는 데이터에 접근한다. 이때 기본키와 데이터는 같은 공간에 저장한다. 이를 클러스터드 인덱스(테이블이 곧 기본키 인덱스)라고 부른다.

{{< image src="/images/Pasted image 20231121192152.png" >}}


## refs
- [[MySQL] B-Tree로 인덱스(Index)에 대해 쉽고 완벽하게 이해하기 - MangKyu's Diary](https://mangkyu.tistory.com/286) 
- [데이터 중심 애플리케이션 설계]({{< ref "/posts/데이터 중심 애플리케이션 설계.md" >}})


## links
- [B-Tree]({{< ref "/posts/B-Tree.md" >}})
- [Hash 인덱스]({{< ref "/posts/Hash 인덱스.md" >}})
- [전문 검색 인덱스]({{< ref "/posts/전문 검색 인덱스.md" >}})
- [Real MySQL]({{< ref "/posts/Real MySQL.md" >}})
