---
title: Mock과 Fake
categories:
  - 테스트
tags: 
date: 2022-12-16T17:01:16+09:00
draft: false
modified: 2024-01-09T17:31:57+09:00
---

## content

mockist vs classicist
- mockist(aka 런던 학파) - 단위 테스트에 실제 의존성 사용을 피하고,  목과 스텁을 이용해서 요소가 **어떻게 상호작용**하는지를 테스트해야 한다고 주장
- classicis(aka 디트로이트 학파) - 실제 의존성을 테스트하는 것을 최우선으로 두어서, 목과 스텁 보단 페이크를 사용하여 실행 코드의 **최종 결과가 무엇인지** 확인해야 한다고 주장


## refs
- [좋은 코드 나쁜 코드]({{< ref "/posts/좋은 코드 나쁜 코드.md" >}})
- [Mocks Aren't Stubs](https://martinfowler.com/articles/mocksArentStubs.html#ClassicalAndMockistTesting)

## links
- 
