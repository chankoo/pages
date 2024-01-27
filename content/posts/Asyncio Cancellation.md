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
modified: 2024-01-27T23:32:53+09:00
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


일반적으로 CancelledError 를 핸들링하는 도중엔 create_task 를 피해야한다. `asyncio.run()` 이 프로세스 내 태스크들을 취소 완료한 후에야 태스크를 생성하게된다. 그 결과 pending 상태에서 이벤트 루프가 소멸하며 'Task was destroyed but it is pending!' 에러를 만들게 된다.

```
import asyncio
from asyncio import StreamReader, StreamWriter

async def send_event(msg: str):
	await asyncio.sleep(1)

async def echo(reader: StreamReader, writer: StreamWriter):
	print('New connection.')
	try:
		while (data := await reader.readline()):
			writer.write(data.upper())
			await writer.drain()
		print('Leaving Connextion.')
	except asyncio.CancelledError:
		msg = 'Connection dropped!'
		print(msg)
		asyncio.create_task(send_event(msg))  # don't

async def main(host='0.0.0.0', port=8888):
	server = await asyncio.start_server(echo, host, port)
	async with server:
			await server.serve_forever()

try:
	asyncio.run(main())
except KeyboardInterrupt:
	print('Bye!')


$ python telnetdemo.py
New connection.
^C^CConnection dropped!
^CBye!
Task was destroyed but it is pending!
task: <Task cancelling name='Task-1' coro=<main() done, defined at /Users/chankoo/sourcecode/tmp_scripts/telnetdemo.py:19> wait_for=<Future pending cb=[Task.task_wakeup()]> cb=[gather.<locals>._done_callback() at /Library/Frameworks/Python.framework/Versions/3.12/lib/python3.12/asyncio/tasks.py:767]>
```


비동기 시스템에서 graceful shutdown 은 쉽지 않은 과제이다. 예를 들면, 아래 코드와 같이 `run_in_executor`로 실행하는 작업 `blocking` 의 수행 시간이 main 태스크보다 긴 경우에 문제가 생길 수 있다. `acyncio.run` 이 main을 수행하고 `blocking` 이 완료되지 않은 상태에서 이벤트 루프를 소멸시켜 에러가 발생한다. (python 3.9 부터는 `acyncio.run` 을 수정하여 `run_in_executor` 로 수행한 작업이 끝나기를 기다린 후 루프를 닫는다.)

```
import time
import asyncio

async def main():  
	loop = asyncio.get_running_loop() 
	loop.run_in_executor(None, blocking)
	print(f'{time.ctime()} Hello!') 
	await asyncio.sleep(1.0) 
	print(f'{time.ctime()} Goodbye!')

def blocking():
	time.sleep(1.5)
    print(f"{time.ctime()} Hello from a thread!")

asyncio.run(main())

# Sat Jan 27 17:22:14 2024 Hello!
# Sat Jan 27 17:22:15 2024 Goodbye!
# Sat Jan 27 17:22:16 2024 Hello from a thread!

# python 3.9 미만에서 RuntimeError 발생
exception calling callback for <Future at 0x1073434c0 state=finished returned NoneType>
Traceback (most recent call last):
...
RuntimeError: Event loop is closed
```

서버 운영을 위해 의도적으로 프로세스를 종료할 때도 graceful shutdown에 실패하면 의도치 않은 동작을 발생시킬 수 있다. 이를 방지하고자 signal_handler를 커스텀하는 방식을 사용하는데, sig_handler가 clean up을 수행한 뒤, 명시적으로 루프를 종료하는 것이다.

```
import asyncio
import signal
import os

async def sig_handler(loop):
    print('stopping loop...')
    print('clean up all the things')
    loop.stop()

def main():
    loop = asyncio.new_event_loop()

    for sig in (signal.SIGINT, signal.SIGTERM):
        loop.add_signal_handler(sig, lambda l: l.create_task(sig_handler(l)), loop)

    try:
        loop.run_forever()
        print('loop stopped')
    finally:
        loop.close()
        print('loop closed')

main()

^C
# stopping loop...
# clean up all the things
# loop stopped
# loop closed
```

## refs
- [Using Asyncio in Python]({{< ref "/posts/Using Asyncio in Python.md" >}})
- [Real-world asyncio - 김준기 - PyCon.KR 2019 - YouTube](https://www.youtube.com/watch?v=QaiczQzJAmA&ab_channel=PyConKorea)
- [asyncio 뽀개기 3 - SIGTERM (CTRL+C) 올바르게 처리하기](https://tech.buzzvil.com/blog/asyncio-no-3-sigterm/)


## links
- [Asyncio]({{< ref "/posts/Asyncio.md" >}})
