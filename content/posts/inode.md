---
title: inode
categories:
  - OS
tags:
  - 파일시스템
date: 2022-10-13T23:27:02+09:00
draft: false
modified: 2024-01-09T14:34:29+09:00
---
유닉스 계통 파일 시스템에서 사용하는 자료구조. 

- 수퍼블록 - 파일시스템과 파티션 정보(df)
- inode 블록 - PCB와 유사하게 (inode 방식의) 파일 메타 데이터를 갖는다. 파일과 일대일 매핑
	- (compare with directory entry)
- 데이터 블록 - 실제 정보를 저장한 블록(디스크 블록)


## refs
- 


## links
- [파일 시스템]({{< ref "/posts/파일 시스템.md" >}})
- [PCB]({{< ref "/posts/PCB.md" >}})
- 
