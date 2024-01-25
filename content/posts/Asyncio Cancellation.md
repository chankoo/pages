---
title: Asyncio Cancellation
categories:
  - 언어
tags:
  - python
  - 동시성
date: 2024-01-25T15:44:56+09:00
draft: false
featured: false
modified: 2024-01-25T17:31:17+09:00
---
코루틴이 외부 요인에 의해 중단되었음을 의미

모든 await 구문에서 아무때나 발생 가능하다. CancelledError 예외가 발생하게되며, 예외 처리를 통해 clean-up 해야한다. clean-up 작업이 까다로운데, 제대로 처리하지 못하면 예기치 못한 문제(취소된 작업이 db 커넥션을 물고 있다거나)를 야기한다.

명시적으로 Cancellation을 발생시키려면,
- 코루틴에 `asyncio.CancelledError` 를 throw 하거나(실제 코드에선 잘 안쓰임)
- 퓨처 또는 태스크 객체의 `.cancel()` 을 호출하거나
- `raise asyncio.CancelledError` 를 통해 스스로 작업을 취소

```
import asyncio
async def f():
	try:
		while True: await asyncio.sleep(0)  # cancellable 하게 만드는 asyncio.sleep(0)
	except asyncio.CancelledError:
		print('cancelled!')
	else:
		return 123

coro = f()
coro.send(None)
coro.throw(asyncio.CancelledError)
# cancelled!
# StopIteration
```


## refs
- [Using Asyncio in Python]({{< ref "/posts/Using Asyncio in Python.md" >}})
- [Real-world asyncio - 김준기 - PyCon.KR 2019 - YouTube](https://www.youtube.com/watch?v=QaiczQzJAmA&ab_channel=PyConKorea)


## links
- [Asyncio]({{< ref "/posts/Asyncio.md" >}})
