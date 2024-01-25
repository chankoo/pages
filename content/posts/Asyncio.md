---
title: Asyncio
categories:
  - 언어
tags:
  - python
  - 동시성
date: 2024-01-20T13:30:38+09:00
draft: false
featured: false
modified: 2024-01-25T12:36:57+09:00
---
async / await 문을 이용해 비동기 프로그래밍을 구현하는 파이썬 라이브러리이다.

IO 작업에 async 기반 동시성은 
- 스레드 기반 동시성 보다 안전한 선점 스케줄링을 구현하면서 가볍다. 많은 자원이 아니라 단순히 시간이 필요한 IO 작업에 적합하다.
- 멀티 스레딩 코드보다 제어권 변동을 명시적으로 표현(await)하여 코드 레벨에서 관측 가능하다.

사용자 관점에서 주요한 요소들을 알아보자.
1. asyncio.run()
	- 코루틴 체인의 최상위 진입점으로, 코루틴 내 코루틴들을 모두 실행한다.
	- 이벤트 루프 생성, 태스크 실행, 보류 태스크 취소, 이벤트 루프 소멸까지 한번에 작업한다.

```
async def main():
	print(f'{time.ctime()} Hello!')
	await asyncio.sleep(1.0)
	print(f'{time.ctime()} Goodbye!')

asyncio.run(main())

# Sun Aug 18 02:14:34 2019 Hello!
# Sun Aug 18 02:14:35 2019 Goodbye!
```

2. asyncio.get_event_loop()
	- 스레드 내 존재하는 (대개 유일한) 이벤트 루프를 가져온다.
	- async 함수 내에서는 asyncio.get_running_loop()를 호출해야한다.
3. loop.create_task(coro)
	- 코루틴을 태스크로 감싸고 이벤트 루프에 실행을 예약한다.
	- 태스크 객체를 리턴한다.
4. loop.run_until_complete(coro)
	- 이벤트 루프의 태스크를 실행한다.
	- 코루틴 체인이 종료될 때까지 스레드(주로 메인 스레드)를 블락한다.
5. loop.close()
	- 이벤트 루프를 닫으며 관련된 큐나 executor 등을 모두 종료한다.
	- 주로 정지된(stoppped) 루프에 호출한다.
```
# asyncio.run 보다 저수준 함수 사용

async def main():
	print(f'{time.ctime()} Hello!')
	await asyncio.sleep(1.0)
	print(f'{time.ctime()} Goodbye!')

loop = asyncio.get_event_loop()
task = loop.create_task(main())
loop.run_until_complete(task)
loop.close()

# Sun Aug 18 02:14:34 2019 Hello!
# Sun Aug 18 02:14:35 2019 Goodbye!
```

6. asyncio.gather(\*awaitables)
	- 인자로 받은 어웨이터블 시퀀스를 동시에 실행한다.
	- 모든 어웨이터블을 완료하고 반환 값의 리스트를 리턴한다.
	- 일부 작업이 취소되더라도 gather는 계속 진행된다.

```
async def main():
    L = await asyncio.gather(
        factorial(2),
        factorial(3),
        factorial(4),
    )
    print(L)

asyncio.run(main())

# 2 (factorial(2))
# 6 (factorial(2))
# 24 (factorial(4))
```

7. loop.run_in_executor(executor, func)
	- 스레드나 프로세스 등 별도의 executor 에서 작업을 실행한다. 
	- 메인 스레드를 블락하지 않으므로 무거운 블라킹 i/o 나 cpu 바운드 작업을 비동기로 실행할 때 적합하다.
	- 다만 작업 시간이 메인 스레드의 작업보다 긴 블락 함수의 경우 주의가 필요하다.

```
def blocking(): 
    time.sleep(0.5)
    print(f"{time.ctime()} Hello from a thread!")

async def main():
	print(f'{time.ctime()} Hello!')
	loop = asyncio.get_running_loop()
	result = await loop.run_in_executor(
        None, blocking)
	await asyncio.sleep(1.0)
	print(f'{time.ctime()} Goodbye!')

asyncio.run(main())

# Thu Jan 25 12:31:03 2024 Hello!
# Thu Jan 25 12:31:03 2024 Hello from a thread!
# Thu Jan 25 12:31:04 2024 Goodbye!
```
## refs
- [Using Asyncio in Python]({{< ref "/posts/Using Asyncio in Python.md" >}})
- [Coroutines and Tasks — Python 3.12.1 documentation](https://docs.python.org/3.12/library/asyncio-task.html)


## links
- [Awaitable 객체]({{< ref "/posts/Awaitable 객체.md" >}})
