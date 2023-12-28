---
title: <시스템 디자인 연습> 피드 서비스 3 - DB 병목
categories:
  - 백엔드
tags:
  - 부하테스트
  - django
  - aws
  - mysql
date: 2023-11-26T13:54:34+09:00
draft: false
modified: 2023-12-29T02:53:29+09:00
featured: false
series: 시스템 디자인 연습
---
### 작업
이번에는 피드 서비스에서 주된 이슈인 Fanout 시나리오를 실험했다. 유저가 게시글을 작성하면 해당 글이 500명의 친구 피드로 전송되는 상황이다. 한 유저 당 501개의 create 요청을 발생시키는 고부하 작업이다.

### 목표
500 RPS(약 250,000 QPS) 를 감당할 수 확인한다. 가상 사용자(VU) 500명을 설정하고, 1초 간격으로 3분 동안 요청을 지속했다.

### 결과 요약
1. DB의 옵션을 이해하고 우선적으로 DB 성능을 튜닝하는 것이 중요하다.
2. 그래도 DB가 병목일 땐 캐시와 비동기 작업을 적극적으로 활용하자.

### 환경
> 서버: Django + gunicorn
DB: SQLite or Mysql or Redis
인프라: Docker Compose or (AWS ECS Fargate + Docker)  
테스팅: K6 + Grafana + InfluxDB

### 결과 상세
vCPU 8개를 사용하여 테스트했을 때, 초당 1개 요청도 처리하지 못하는 저조한 성능을 보였다. 태스크 CPU와 메모리 사용량이 3%~5%로 낮아 DB 병목이 의심되었다. 기본적으로 Django에 설정된 SQLite는 높은 수준의 동시성을 요구하는 작업에 적합하지 않았다.

또 다른 문제는, 로컬 파일 시스템에 데이터를 저장하는 SQLite의 특성에서 기인했다. 데이터가 애플리케이션 서버마다 분산되어 있었고, 이로 인해 피드의 일관성 문제가 발생했다. 두 개의 태스크를 사용함에 따라, 각 태스크는 작성된 포스트의 절반만 조회할 수 있었다.

![[283491128-579dc6b7-6735-4818-b798-eba8947669ee.png]]

> AWS ECS Fargate 설정
태스크: 2
태스크 CPU: 4 vCPU
태스크 메모리: 8 GB

> 결과
> checks.........................: 99.19% 
> data_received..................: 122 kB 635 B/s
> http_reqs......................: 124    0.646009/s
> iteration_duration.............: avg=14.98s  p(95)=29.45s


DB를 MySQL로 변경하고 AWS EC2에서 도커 컨테이너로 DB 서버를 구축했을 때, 처리량은 100 RPS 수준으로 증가했지만 85%의 요청이 실패하는 새로운 문제에 직면했다.

![[283764373-b3286a7e-cc7e-40a3-aec3-76f2fdb5ffdb.png]]

> AWS EC2 - Mysql container
인스턴스 유형: t4g.medium(cpu 2 | memory 4GiB | EBS 버스트 대역폭 2,085 Mbps)
innodb_buffer_pool_size = 128M(default)
innodb_flush_log_at_trx_commit = 1(default)
max_connections = 150(default)

> 결과
> checks.........................: 15.48%
> data_received..................: 5.1 GB 27 MB/s
> http_reqs......................: 19611  104.708861/s
> iteration_duration.............: avg=4.67s   p(95)=14.95s


원인을 추정하다가 DB 커넥션 수가 요청 실패율에 결정적인 영향을 미친다는 것을 발견했다(꽤 오랜 시간이 걸렸다). MySQL 기준 max_connections 이 너무 낮으면, 요청이 커넥션을 맺기 위해 대기하다가 타임아웃이 나서 에러가 많아진다. 시도와 실패를 반복하며 많은 RPS를 기록하고, 앱 서버의 자원도 많이 사용한다. 반대로 max_connections이 높으면, 타임아웃으로 요청이 실패하는 경우가 줄어들고 DB 트랜잭션을 기다리는 상황이 발생한다. 자연히 DB 서버의 자원을 많이 사용하고, 과부하로 트랜잭션 처리량이 줄어들면 RPS 역시 적어진다.

아래처럼 max_connections을 1000으로 높여준 결과 11 RPS로 처리량이 크게 줄었지만, 1% 미만의 요청 실패율을 보여주었다. 버퍼 풀의 메모리 사이즈(innodb_buffer_pool_size)나 로그의 flush 타이밍(Innodb_flush_log_at_trx_commit) 옵션 역시 중요한 튜닝 포인트지만, 실패율 문제를 해결하는 것에는 부가적인 영향만 주었다.

![[284218236-788a2fc8-7306-4fac-88eb-7676207c129e.png]]

> AWS EC2 - Mysql container
인스턴스 유형: t4g.medium(cpu 2 | memory 4GiB | EBS 버스트 대역폭 2,085 Mbps)
innodb_buffer_pool_size = 2048M
innodb_flush_log_at_trx_commit = 2
max_connections = 1000

> 결과
> checks.........................: 99.03% 
> data_received..................: 2.3 MB 11 kB/s
> http_reqs......................: 2376   11.442402/s
> iteration_duration.............: avg=40.92s  p(95)=58.12s


요청 실패를 줄이는 것에는 성공했지만 DB가 병목인 상황을 쉽게 해결하기는 어려워보인다. 목표인 500 RPS을 달성하려면 DB가 약 250,000 QPS를 처리해야하는데, 이는 DB 서버 스펙을 크게 높이든지, 분산 DB를 도입해야하는 수준으로 보였다. 어느 쪽이든 금전적, 시간적 비용이 걱정되는 상황이라 캐시와 비동기를 도입하여 가볍게 해결해보고자 하였다.

피드를 캐시에 저장하도록 로직을 변경하고 별도의 비동기 태스크(Celery)로 작업했다. 캐시는 DB 부하를 줄이면서 고성능의 인메모리 저장소를 활용하려는 접근이다. 또한 별도의 비동기 서버를 활용하여 서비스 반응 시간을 줄이고, 동시성 수준을 높일 수 있었다. 이로써 고비용의 하드웨어 업그레이드나 복잡한 분산 시스템 구축 없이도 처리량을 300 RPS 수준으로 끌어올렸고, 성능 목표에 접근할 수 있었다. 

![[285499454-c73abb4d-39f0-402c-ba47-3fbea6318b72.png]]

다만 비동기 태스크의 처리량이 낮은 상태여서 추가적인 최적화와 확장이 필요한 상태이다. 아래 이미지에서 보이듯, 피드 서비스(sample-feed) 작업이 완료된 후에도 캐시(ElastiCache redis)와 저장 태스크(sample-feed) 작업이 한동안 지속되는 상황인 것이다.

![[285499893-3a0f2d1d-1847-4905-a6d7-a763220dd4c4.png]]

> AWS ECS Fargate (피드 서비스)
태스크: 4
태스크 CPU | 메모리: 2 vCPU | 4 GB

> AWS ECS Fargate (캐시 저장 태스크)
태스크: 2
태스크 CPU | 메모리: 2 vCPU | 4 GB

> AWS Elasticache - Redis
cache.t4g.medium

> 결과
> checks.........................: 99.96% 
> data_received..................: 19 MB  305 kB/s
> http_reqs......................: 18993  308.319286/s
> iteration_duration.............: avg=1.6s  p(95)=4.78s


## refs
- [sample-feed 4차 · Issue #4 · chankoo/load-testing-practices · GitHub](https://github.com/chankoo/load-testing-practices/issues/4)


## links
- 
