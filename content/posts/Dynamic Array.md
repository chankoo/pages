---
title: Dynamic Array
categories:
  - 자료구조
tags:
  - python
date: 2022-10-03T00:11:36+09:00
modified: 2023-12-20T13:58:38+09:00
---

## content
python 의 list 는 dynamic array이다. 런타임에 element를 추가할때, 리스트에 할당된 메모리 공간이 모자라면 리스트 크기를 늘린다. 그런데 dynamic array도 엄연한 array 이기에 'element 가 연속된 메모리 공간을 점유한다'는 제약을 따라야한다. 그래서 python(cpython)은 요소가 추가되어 리스트 크기가 변해야할 때, 전체 list를 복사하여 더 큰(2의 거듭제곱) 공간에 통째로 재할당 한다.

![](https://enfow.github.io/image/study/python_list_and_dynamic_array.png)

이는 시간 복잡도 계산에 영향을 준다. list 에 요소를 더하는 append 나 insert 연산의 시간 복잡도를 계산할 때 메모리 재할당 시간까지 고려해야 한다는 의미다. 동적 배열에 요소를 추가할때 메모리 재할당이 필요하다면, O(N) 시간이 필요하다(분할 상환하여 계산한 일반적인 시간 복잡도는 O(1)). 또한 list.pop(k) 역시 k번째 요소를 가져온 뒤 메모리 재할당이 필요하므로 O(N)이다.

## refs
- [Python Bulit-in Time Complexity: List · Enfow's Blog](https://enfow.github.io/study/algorithm/2020/12/08/python_bulitin_time_complexity-copy/)


## links
- [분할 상환 분석]({{< ref "/posts/분할 상환 분석.md" >}})
