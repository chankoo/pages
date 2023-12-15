---
title: B-Tree
categories:
  - 자료구조
tags:
  - mysql
date: 2023-11-21T18:54:17+09:00
draft: false
modified: 2023-11-27T20:28:33+09:00
---

## content
BST(Binary Search Tree)를 일반화한 자료구조로 2개 이상의 자식 노드를 갖는 Balanced Tree이다.

- B Tree 류 자료구조는 DB 인덱스로 많이 쓰인다.
{{ $image := resources.Get "images/Pasted image 20231121190007.png" }}
	- (Balanced BST인)AVL Tree, RB Tree에 비해 자식 노드 개수가 많아 디스크 접근 수가 적음
	- 블록 단위로 메모리에 적재하는 OS 특성도 효율적으로 활용


- B Tree 인덱스의 성능은 키의 크기, 키의 카디널리티, 레코드 대비 인덱스 스캔의 범위 등 다양한 요소에 영향 받는다.
	- 디스크 I/O로 데이터를 가져오는 단위인 블록의 크기는 고정(mysql은 16KB)인데, 키의 크기가 커지면 한블록에 저장하는 키의 개수가 적어진다. 결과적으로 더 많은 디스크 I/O를 유발하고, 인덱스 트리의 깊이를 더 깊게 만든다.
	- 인덱스를 거치는 읽기 작업이 효율적이려면, 보통 전체 레코드 대비 25% 정도 읽는 작업 까지를 한계로 본다. 키의 카디널리티가 낮거나(ex. 성별), 전체 레코드 대비 많은 양을 읽는 작업이라면 인덱스를 사용 않는 것이 좋다.
## refs
- [데이터 중심 애플리케이션 설계]({{< ref "/posts/데이터 중심 애플리케이션 설계.md" >}})
- [Site Unreachable](https://www.youtube.com/watch?v=bqkcoSm_rCs&ab_channel=%EC%89%AC%EC%9A%B4%EC%BD%94%EB%93%9C)
- [Real MySQL]({{< ref "/posts/Real MySQL.md" >}})



## links
- [블록]({{< ref "/posts/블록.md" >}})
