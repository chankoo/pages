---
title: B-Tree
categories:
  - 자료구조
tags: 
date: 2023-11-21T18:54:17+09:00
draft: true
modified: 2023-11-21T19:21:37+09:00
---

## content
BST(Binary Search Tree)를 일반화한 자료구조로 2개 이상의 자식 노드를 갖는 Balanced Tree이다.

- B Tree 류 자료구조는 DB 인덱스로 많이 쓰인다.
![Pasted image 20231121190007.png]({{< ref "/posts/Pasted image 20231121190007.png.md" >}})
	- (Balanced BST인)AVL Tree, RB Tree에 비해 자식 노드 개수가 많아 디스크 접근 수가 적음
	- 블록 단위로 메모리에 적재하는 OS 특성도 효율적으로 활용

## refs
- [데이터 중심 애플리케이션 설계]({{< ref "/posts/데이터 중심 애플리케이션 설계.md" >}})
- [Site Unreachable](https://www.youtube.com/watch?v=bqkcoSm_rCs&ab_channel=%EC%89%AC%EC%9A%B4%EC%BD%94%EB%93%9C)



## links
- [블록]({{< ref "/posts/블록.md" >}})
