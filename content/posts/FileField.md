---
title: FileField
categories:
  - 언어
tags:
  - django
date: 2022-10-20T19:25:34+09:00
draft: false
modified: 2024-01-07T10:32:41+09:00
---
업로드한 파일을 위한 Django Field 객체로 DB 테이블의 컬럼을 추상화했다. 파일을 추상화한 FieldFile 객체의 wrapper이다. 생성을 위해 파일 시스템을 추상화한 Storage 의 구현체와 path로 지정할 문자열(upload_to)가 필요하다. 

FileField 를 get 하면 항상 FieldFile 객체를 가져오는데, 이는 파이썬의 디스크립터를 이용하여 기능한다. FileField에 descriptor_class로 FileDescriptor 객체가 선언되어있어서, FileField 를 가져올때 Dynamic lookup 을 통해 FieldFile을 내어놓는 것이다.


## refs
- [Model field reference | Django documentation | Django](https://docs.djangoproject.com/en/dev/ref/models/fields/#filefield)


## links
- [파일 시스템]({{< ref "/posts/파일 시스템.md" >}})
- [파이썬 디스크립터]({{< ref "/posts/파이썬 디스크립터.md" >}})
- 
