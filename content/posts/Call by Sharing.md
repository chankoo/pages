---
title: Call by Sharing
categories:
  - 언어
tags:
  - python
  - javascript
date: 2024-01-23T17:13:57+09:00
draft: false
featured: false
modified: 2024-01-25T15:26:24+09:00
---
인자의 레퍼런스(또는 포인터)를 복사해서 사용하는 함수 호출 방식이다.

파이썬에서는 모든 타입을 Call by Sharing으로 전달한다. print_arg를 실행하면 인자로 전달된 객체의 레퍼런스 카운트가 증가(2 -> 4)함을 확인할 수 있다.
```
// python
import sys
def print_arg(arg):
	print(id(arg), sys.getrefcount(arg))

a = 9999
print(id(a), sys.getrefcount(a))  # 4416168912 2
print_arg(a)  # 4416168912 4


b = [1,2,3]
print(id(b), sys.getrefcount(b))  # 4416560768 2
print_arg(b)  # 4416560768 4
```


js 에서는 참조 타입을 인자로 전달할때 사용된다(원시 타입은 Call by value로 동작). 객체 내부 값을 수정(`modifyObject`) 하는 경우 원래 객체가 변하지만, 다른 객체를 할당 하는 경우(`replaceObject`) 원래 객체에는 영향 주지 못함을 확인할 수 있다.
```
// js

function modifyObject(obj) { 
	obj.value += 10; 
}

let myObject = { value: 10 };
modifyObject(myObject);
console.log(myObject.value); // 20

function replaceObject(obj) { 
	obj = {value: 30}
}
replaceObject(myObject);
console.log(myObject.value); // 20
```

## refs
- [전문가를 위한 파이썬]({{< ref "/posts/전문가를 위한 파이썬.md" >}})
- [[JS] 📚 Call by Value & Call by Reference (+ Call by Sharing)](https://inpa.tistory.com/entry/JS-%F0%9F%93%9A-Call-by-Value-Call-by-Reference)


## links
- [레퍼런스]({{< ref "/posts/레퍼런스.md" >}})
