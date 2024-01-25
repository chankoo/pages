---
title: Asyncio Event Loop
categories:
  - 언어
tags:
  - python
  - 동시성
date: 2024-01-25T17:38:42+09:00
draft: true
featured: false
modified: 2024-01-25T19:07:13+09:00
---
퓨처는 이벤트 루프와 상호작용하는 객체로 작업 실행 상태와 결과를 저장한다. 
- 상태는 1) PENDING, 2) CANCELLED, 3) FINISHED 의 세가지이며, CANCELLED 와 FINISHED는 완료 상태이다
- 결과 값을 저장(`.set_result(value)`)하고 가져올(`.result()`) 수 있다.
- 실행 중 취소(`.cancel()`) 할 수 있다.
- `.add_done_callback()` 으로 완료 후 호출할 콜백을 등록할 수 있다.

태스크는 퓨처의 서브클래스로 퓨처 인터페이스에 더해 코루틴과 상호작용하는 역할을 한다. 내부에 코루틴 객체를 저장(`_coro`)하고 해당 코루틴(또는 코루틴 체인)의 실행을 개시한 후 결과를 받아올 수 있다. 이는 이벤트 루프를 통하여 진행되는데, 태스크가 이벤트 루프에 코루틴을 실행하도록 예약하는 방식이다.
- `asyncio.run(coro)` 이나 `asyncio.create_task(coro)` 를 호출하여 태스크 객체를 생성하고, 이벤트 루프에 코루틴을 예약한다.
- 코루틴을 실행 중 await가 필요한 코드(ex. `asyncio.sleep()`)를 만나면 태스크는 실행을 중단하고 이벤트 루프에 제어를 넘긴다. 이벤트 루프는 예약된 태스크 중 우선 순위가 높은 것을 선택하여 실행을 재개한다.
- 코루틴의 실행을 완료하면 그 반환 값을 태스크 결과 값으로 업데이트한다. 즉, 태스크 상태가 FINISHED로 변한다.


## refs
- [[Python] 비동기 프로그래밍 동작 원리 (asyncio)](https://it-eldorado.tistory.com/159)
- [Using Asyncio in Python]({{< ref "/posts/Using Asyncio in Python.md" >}})


## links
- [Asyncio]({{< ref "/posts/Asyncio.md" >}})
