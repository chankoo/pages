---
title: LSM Tree
categories:
  - 자료구조
tags: 
date: 2023-11-21T19:33:43+09:00
draft: false
modified: 2024-01-09T12:18:11+09:00
---
Log Structured Merge Tree는 로그성 데이터 색인을 위해 고안된 자료구조로, 정렬된 키-값 데이터인 SS테이블(Sorted String Table) 형식으로 디스크에 데이터를 저장한다.


## refs
- [데이터 중심 애플리케이션 설계]({{< ref "/posts/데이터 중심 애플리케이션 설계.md" >}})
- [색인(index)의 두 가지 형태 : LSM 트리 & B 트리 | by allocProc | Medium](https://jaeyeong951.medium.com/%EC%83%89%EC%9D%B8-index-%EC%9D%98-%EB%91%90-%EA%B0%80%EC%A7%80-%ED%98%95%ED%83%9C-lsm-%ED%8A%B8%EB%A6%AC-b-%ED%8A%B8%EB%A6%AC-7a4ab7887db5)


## links
- [B-Tree]({{< ref "/posts/B-Tree.md" >}})
- [Hash 인덱스]({{< ref "/posts/Hash 인덱스.md" >}})
