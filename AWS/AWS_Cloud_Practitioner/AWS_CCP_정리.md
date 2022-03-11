# AWS Cloud Practitioner 자격증 요약 정리

![image](https://user-images.githubusercontent.com/81672260/157174909-547f0eaf-aed1-4691-9d5e-4bf4c5c6d25f.png)

![image](https://user-images.githubusercontent.com/81672260/157174944-2508788b-cc24-46f4-8b45-1c772f05db6d.png)

## 1. 엑세스하는 3가지 방법

### 1.1 AWS Management Console
- 관리 콘솔을 통한 접근

### 1.2 명령줄 인터페이스
- command line 커맨드로 접근

### 1.3 소프트웨어 개발 키트(SDK)
- SDK를 사용하여 접근 : 개발자가 애플리케이션 코드에서 AWS서비스에 액세스 할 수있는 매커니즘


## 2. 컴퓨팅

### 2.0 온 프레미스
- 온 프레미스(on-premise)는 소프트웨어 등 솔루션을 클라우드 같이 원격 환경이 아닌 자체적으로 보유한 전산실 서버에 직접 설치해 운영하는 방식을 말한다.

### 2.1 AWS EC2(Elastic Computing Cloud)  *중요*
- elastic 탄력적 -> 컴퓨팅 서버를 애플리케이션 수요에 따라 늘리거나, 줄이거나가 가능하다.
- compute 컴퓨팅, 서버를 의미함
- cloud 구름
- 구름위에 탄력적인(줄이거나 늘리거나 가능한)서버들 -> 아마존 EC2인스턴스들

### 2.2 AWS EC2 Container Service, ECS
- 도커 컨테이너를 지원하는 컨테이너 관리 서비스
- 클러스터 관리 인프라를 설치, 운영 및 확장

### 2.3 AWS EC2 Container Registry
- 개발자가 도커 컨테이너 이미지를 손쉽게 저장, 관리 및 배포할 수 있게 해주는 완전관리형 도커 컨테이너 레지스트리
- AWS Indentity and Access Management(IAM)과 통합함으로써 각 리포지토리를 리소스 수준에서 제어할 수 있다.
- Amazon ECR에는 선수금이나 약정이 없다. 리포지트로에 저장한 데이터와 인터넷으로 전송한 데이터 양에 대한 요금만 지불한다.

### 2.4 AWS Lightsail
- AWS에서 가상 프라이빗 서버를 시작하고 관리할 때 사용할 수 있는 가장 간편한 방법.
- Lightsail 계획에는 프로젝트에 착수하는 데 필요한 모든 것(가상 머신,SSD 기반 스토리지, 데이터 전송, DNS관리, 고정 IP 주소)이 포함되어 있으며 고객은 이러한 서비스를 저렴하고 예측 가능한 요금으로 사용할 수 있다.

### 2.5 AWS Batch
- 사용하면 개발자, 과학자 및 엔지니어가 AWS에서 수많은 배치 컴퓨팅 작업을 효율적으로 손쉽게 실행할 수 있다.
- 코어가 많이 필요한 실험에 좋다 라는 것이다.
- 암 표적에 대해 천 만개의 화합물 실험 39년 -> 9시간

### 2.6 AWS Elastic Beanstalk
- Java,.NET, PHP, Node.js, Python, Ruby, Go, Docker를 사용하여 Apache, Nginx, Passenger, IIS(인터넷 정보 서비스) 같은 친숙한 서버에서 개발된 웹 애플리케이션 및 서비스를 배포하고 확장하는 허비흐로서 사용이 간편하다.

### 2.7 AWS Lambda
- 서버리스, 서버를 프로비저닝 하거나 관리할 필요 없이 코드를 실행할 수 있다.
- 비용 청구기준(1. 실행시간, 2.요청 수)
 ![image](https://user-images.githubusercontent.com/81672260/157180202-cfb0ed7a-c6ac-40cf-a82d-756238a9244d.png)

### 2.8 Auto Scaling   *중요*
- 애플리케이션 가용성을 유지하는 데 도움이 되고 정의한 조건에 따라 Amazon EC2용량을 자동으로 확장하거나 축소할 수 있다.

## 스토리지

![image](https://user-images.githubusercontent.com/81672260/157182115-c951fcd1-c9e4-4552-ad0e-c53b16f9a63c.png)

### 3.1 AWS S3 (Simple Storage Service)
- 심플하게 자주 저장하는 용도
- Object 객체 기반
- 99.9 내구성
- 정적 웹 사이트를 호스팅 용도
- S3 standard : 가장 많이 쓰며, 핫데이터(컨텐츠)를 쓸때 사용
- 인프리퀀트 액세스(Standard Infrequent Access) : 자주 액세스 하지 않은것들로
- 웹 어느 곳에서든지 용량에 관계 없이 데이터를 저장하고 검색할 수 있는 단순한 웹 인터페이스를 갖춘 객체 스토리지
- Amazon S3으로 대량의 데이터를 간편하게 송신 또는 수신할 수 있다.
- 데이터를 Amazon S3에 저장한 후에는 Amazon S3 스탠다드(Infequent Access, 아카이브용 Amazon Glacier)와 같이 비용이 더 적게 드는 장기클라우드 스토리지 클래스로 자동 티어링(tiering)할 수 있다.
- ![image](https://user-images.githubusercontent.com/81672260/157182824-6a1de4db-3d65-4cb7-b6f2-c489c2e0c61f.png)

### 3.2 AWS Elastic Block Store, EBS
- 영구적인 스토리지를 위함
- 하드처럼 EC2에 붙여쓸수 있는 EBS
- EC2 VM에 붙여쓰는 하드디스크

![image](https://user-images.githubusercontent.com/81672260/157562172-bd407d20-bb21-4945-b070-6a360fc6a67c.png)


### 3.3 AWS Elastic File System, EFS  *중요*
- EFS : 네트워크 파일 시스템, 한 지역에서 수백 개의 인스턴스 연결 가능
- Linux 기반 AWS 및 온 프레미스 서버와 함께 사용 가능 / 간단하고 확장 가능한 공유 파일 스토리지 솔루션
- AWS 클라우드 서비스 및 온 프레미스 리소스와 함께 사용할 수 있는 간단하고 확장

### 3.4 AWS Glacier  *중요*
- 아카이빙 용도, 내가 로드할 때 비용 발생
- 99.9 내구성
- 데이터 보관 및 장기 백업을 위한 안전하고 안정적이며 비용이 매우 저렴한 스토리지 서비스.

### 3.5 AWS Storage Gateway
- 온 프레미스 데이터 스토리지를 AWS 클라우드에 연결하는 용도
- 온 프레미스 스토리지 환경(전산실)과 AWS 클라우드 양쪽을 넘나들며 하이브리드 스토리지를 원할하게 사용할 수 있다.

## 4. 데이터베이스

![image](https://user-images.githubusercontent.com/81672260/157563531-1220a369-bb24-4f6f-a772-ebf22178cfdc.png)

### 4.1 AWS Aurora 오로라 *중요*

- MySQL 및 PostgreSQL과 호환되는 관계형 데이터베이스 엔진
- 고사양 상업용 데이터베이스의 속도/가용성과 오픈 소스 데이터베이스의 단순성 및 비용 효율성을 결합한 것
- 
![image](https://user-images.githubusercontent.com/81672260/157565539-339b56d4-25fe-47a5-8fd8-0ae9b79ea5a5.png)

### 4.2 AWS RDS (Relational Database Service) *중요*

- RDS 소프트웨어 패치는 AWS에서 해준다(사용자 측이 하는것이 아님)
- DB 이중화 -> Multi - AZ
- 클라우드에서 관계형 데이터베이스를 설정, 운영, 확장하기가 쉬워짐.
- Amazon RDS가 제공하는 엔진 (Amazon Aurora, PostgreSQL, MySQL, MariaDB, Oracle, Microsoft SQL Server)

![image](https://user-images.githubusercontent.com/81672260/157566064-e7aee78d-df2d-449b-9678-edc6658efe09.png)


### 4.3 AWS DynamoDB  *중요*

- NoSQL DB 서비스
- 어떤 상황에서든 지연 시간이 일괄적으로 한 자릿수 밀리초 단위여야 하는 모든 애플리케이션을 위한, 빠르고 유연한 NoSQL데이터베이스 서비스이다.

### 4.4 AWS ElastiCache
- 데이터베이스 액세스 부하를 줄이는 데 도움이 되는 공통 데이터베이스 쿼리 결과를 저장하는데 가장 적합한 서비스
- NoSQL 데이터베이스 및 애플리케이션의 부하를 줄이는데 탁월한 선택

## 5. 마이그레이션

### 5.1 AWS Application Discovery Service

### 5.2 AWS Database Migration Service

### 5.3 AWS Server Migration Service
- 에이전트 없는 서비스로 수천 개의 온프레미스 워크로드를 AWS로 쉽고 빠르게 마이그레이션 할 수 있게 해준다.

### 5.4 AWS Snowball  *중요*
- 페타바이트 규모, 대용량 안전하게 전송하기 위함
- 기가(giga) > 테라(tera) > 페타(peta) > 엑사(exa)
- 보통 온 프레미스 데이터 센터 -> AWS로 데이터를 이동한다.(같은 역할 서비스, AWS Database Migration Service(AWS DMS))
- 비용 또한 고송 인터넷 비용의 1/5 정도로 저렴

### 5.5 AWS Snowball Edge
- 온보드 스토리지 및 컴퓨팅 기능을 포함하는 100TB 데이터 전송 디바이스

### 5.6 AWS Snowmobile
- 엑사바이트 규모의 데이터 세트를 AWS에서 또는 AWS로 마이그레이션 하거나 전송
- 기가 -> 테라 -> 페타 -> 엑사

## 6.네트워킹과 콘텐츠 전송

### 6.1 AWS VPC
- 사용자의 AWS 계정 전용 가상 네트워크

![image](https://user-images.githubusercontent.com/81672260/157570461-95ef8837-aed3-414e-bbf0-ad56ab6d81ef.png)

![image](https://user-images.githubusercontent.com/81672260/157570583-ccc6dcf4-b0ce-4082-b236-7a02476cd21a.png)

![image](https://user-images.githubusercontent.com/81672260/157570599-6ee3acef-a614-4045-8ace-5903b38c8f5c.png)

### 6.2 AWS CloudFront  *중요*
- CDN
- 앞(Front)에서 미리 Request를 처리해준다.
- DDos 방어 제공(AWS Shield)
- 웹 사이트, API, 동영상 콘텐츠 또는 기타 웹 자산의 전송을 가속화하는 글로벌 콘텐츠 전송 네트워크(CDN)서비스.

![image](https://user-images.githubusercontent.com/81672260/157572133-0ee9637a-2357-4386-ac32-c8fad11dec9f.png)

### 6.3 AWS Route 53
- 도메인 등록, 도메인 관리
- 서버가 다운되면 다른 곳으로 Routing 해줌
- 가용성과 확장성이 우수한 클라우드 Domain Name System(DNS) 웹서비스.

### 6.4 AWS Direct Connect  *중요*
- 온 프레미스에서 AWS로 전용 네트워크 연결을 쉽게 설정할 수 있다.
- 기존 서버실 -> AWS로 전용 네트워크 연결을 쉽게!

### 6.5 Elastic Load Balancing(ELB)
- 트래픽 몰리면 EC2 인스턴스에 분산해서 배포해줌.
- 수신되는 애플리케이션 트래픽을 여러 EC2 인스턴스에 자동으로 배포
- 지원하는 밸런스
 - Application Load Balancer -> HTTP / HTTPS (Layer 7)트래픽을 라우팅하는 데 사용  *중요*
 - Network Load Balancer -> TCP (Layer4) 트래픽을 라우팅
 - Classic Load balancer -> TCP (Layer 4)트래픽을 라우팅

## 7. 개발자 도구

### 7.1 AWS CodeCommit
- 완전관리형 소스 제어 서비스로 기업이 안전하고 확장성이 뛰어난 프라이빗 Git 리포지토리를 손쉽게 호스팅할 수 있게 해준다.
- 소프트웨어 버전 관리

### 7.2 AWS CodeBuild

### 7.3 AWS CodeDeploy

### 7.4 AWS CodePipeline
- 빠르고 안정적인 애플리케이션 및 인프라 업데이트용
- 릴리스 파이프 라인을 자동화하는데 데 도움이 되는 서비스
- 릴리스 모델에 따라 코드가 변경 될 때마다 릴리스 프로세스의 빌드, 테스트 및 배포 단계를 자동화한다.
- 내가 코드를 수정 -> 릴리스 프로세스로 자동화 해줌.
