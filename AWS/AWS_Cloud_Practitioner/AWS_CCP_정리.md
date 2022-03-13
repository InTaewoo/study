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
- 사용자가 코드 및 구성 설정을 제공하면 Elastic Beanstalk이 다음 작업을 수행하는 데 필요한 리소스를 배포한다.
- 용량 조정
- 로드 밸런싱
- 자동 조정
- 애플리케이션 상태 모니터링

### 2.7 AWS Lambda
- 서버리스, 서버를 프로비저닝 하거나 관리할 필요 없이 코드를 실행할 수 있다.
- 비용 청구기준(1. 실행시간, 2.요청 수)
 ![image](https://user-images.githubusercontent.com/81672260/157180202-cfb0ed7a-c6ac-40cf-a82d-756238a9244d.png)

### AWS Fargate
- 컨테이너 용 서버리스 컴퓨팅 엔진


### 2.8 Auto Scaling   *중요*
- 애플리케이션 가용성을 유지하는 데 도움이 되고 정의한 조건에 따라 Amazon EC2용량을 자동으로 확장하거나 축소할 수 있다.
- 수요가 적을 때 불필요한 Amazon EC2인스턴스 제거
- 온라인 상점의 인기있는 세일 기간 중 두번째 Amazon EC2 인스턴스 추가
- 수요에 맞춰 Amazon EC2 인스턴스 수를 자동으로 조정

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

### 7.5 AWS X-Ray

## 8. 관리도구

### 8.1 AWS CloudWatch  *중요*
- AWS Management Console 로그인 이벤트에 대한 경고를 모니터링하고 수신
- 예상 AWS 요금 모니터링 가능
- AWS 계정에 대한 예상 요금 모니터링 활성화 ON

### 8.2 AWS EC2 Systems Manager

### 8.3 AWS CloudFormation  *중요*
- Formation 정보
- 서비스 구성을 모델링 가능하게 해주고 맘에 들면 코드로 배포 가능
- 레고처럼 미리 모델링 가능하게 함
- 사용자가 리소스 프로비저닝 프로세스를 자동화하여 `코드 형 인프라`를 배포 할 수 있는 AWS 서비스는 무엇입니까?

### 8.4 AWS CloudTrail  *중요*
- AWS CloudTrail을 사용하여 계정 활동을 기록한다
- Amazon Kinesis를 사용하여 실시간으로 지표를 계산 및 스트리밍 한다.
- Amazon DynamoDB를 사용하여 계산 된 데이터를 지속적으로 저장하는 솔루션을 제공한다.

### 8.5 AWS Config
- 감사용 / AWS 리소스 변경 사항 확인용

### 8.6 AWS OpsWorks
- Chef 및 Puppet을 사용해 운영을 자동화
- Chef 및 Puppet은 코드를 사용해 서버 구성을 자동화할 수 있게 해주는 플랫폼이다.
- Chef 및 Puppet을 사용하여 구성 관리를 자동화하는 데 사용되는 AWS 서비스

### 8.7 AWS Marketplace  *중요*
- 클라우드에 쓸 SW를 구입하는 곳
- 다른 AWS사용자에게 솔루션을 판매
- 사용자는 라이선스에 따라 시간 또는 월 단위로 소프트웨어 비용을 지불
- AWS Marketplace를 사용하면 사용자가 1-click으로 애플리케이션을 시작할 수 있다.

### 8.8 AWS Trusted Advisor *중요*
- 고객의 AWS 환경을 정밀조사 -> 권장 사항을 알려줌
- 아래와 같은 베스트 모범사례 자동화 지원.
 - 비용 최적화
 - 성능
 - 보안
 - 내결함성
 - 서비스 제한
- Amazon S3 버킷 권한의 상태
- AWS 계정 루트 사용자에 대해 다단계(2중) 인증이 활성화 되었는지 여부
- 보안 그룹이 무제한 액세스를 허용하도록 구성된 경우

### 8.9 AWS Personal Health Dashboard
- 사용자가 진행중인 이벤트 관리에 도움을 줌
- 특정 AWS 서비스의 상태에 대한 맞춤형 보기를 제공
- 사용장에게 영향을 줄 수있는 이벤트를 경험할 때 알림 및 교정 지침을 제공
- 예약된 활동에 대해 사전 알림 제공

## 9. 보안, 자격 증명 및 규정 준수

### 9.1 AWS Cloud Directory

### 9.2 AWS IAM (Identity and Access Management) *중요*
- AWS 서비스 및 리소스에 대한 액세스를 안전하게 관리할 수 있다.
- AWS 서비스 및 그룹을 생성/관리, 권한에 따라 AWS 리서스 액세스 Allow/Deny설정 가능

### 9.3 AWS Inspector
- 의미 : 조사관, 감독관
- Amazon Inspector는 AWS에 배포 된 애플리케이션의 보안 및 규정 준수를 개선에 도움, 자동화된 보안평가 서비스

### 9.4 AWS Certificate Manager

### 9.5 AWS CloudHSM
- 클라우드 기반
- AWS 클라우드에서 자체 암호화 키를 쉽게 생성하고 사용할 수 있게 해주는 하드웨어 보안 모듈

### 9.6 AWS Directory Service

### 9.7 AWS Key Management Service

### 9.8 AWS Organizations  *중요*
- 통합된 결제를 추구
- 각 부서별 계정이 여러개라면 이를 어떻게 인식할까? -> Tag를 이용

### 9.9 AWS Shield  *중요*
- DDos 방지용


### 9.10 AWS WAF *중요*
SQL Injection, XSS


## 10. 분석

### 10.1 AWS Athena 아테나  *중요*
- 표준 SQL을 사용하여 Amazon S3에서 직접 데이터를 쉽게 분석 할 수있는 대화 형 쿼리 서비스 
- AWS S3, Amazon Simple Storage Service

### 10.2 AWS EMR (빅 데이터 플랫폼) *중요*
- 방대한 양의 데이터를 처리하기 위한 클라우드 빅 데이터 플랫폼
- Amazon Elastic MapReduce
- big data processing and analysis
- 빅 데이타를 분산 처리(Map) > 데이터를 합치는 과정(Reduce)
- Amazon EC2 인스턴스에서 대량의 데이터를 쉽고 빠르며 비용 효율적으로 처리할 수 있는 AWS 관리형 Hadoop 프레임 워크는 어떤 서비스입니까?

### 맵리듀스(MapReduce)란?
- 맵리듀스 프레임워크는 대용량 데이터를 분산 처리하기 위한 목적으로 개발된 프로그래밍 모델
- Google에 의해 고안된 맵리듀스 기술
- 맵리듀스는 임의의 순서로 정렬된 데이터를 분산 처리(Map)하고 이를 다시 합치는(Reduce)과정

### 10.3 AWS CloudSearch

### 10.4 AWS Elasticsearch Service

### 10.5 AWS Kinesis
- 실시간으로 비디오 및 데이터 스트림을 손쉽게 수집, 처리 및 분석

### 10.6 AWS Redshift
- 데이터 웨어하우스
- 클라우드에서 완벽하게 관리되는 페타바이트 급 데이터 웨어하우스 서비스.
- 작게는 수백 기가바이트부터 시작하여 페타바이트 이상까지 데이터를 확장할 수 있다.

### 10.7 AWS QuickSight
- 한 회사가 비즈니스 인텔리전스 솔루션을 구축 중이며 보고 목적으로 대시보드를 사용하려고 한다.

<img width="368" alt="image" src="https://user-images.githubusercontent.com/81672260/158002873-8a3bfc10-4d05-4b8b-93e4-487245999087.png">

### 10.8 AWS Data Pipeline

### 10.9 AWS Glue
- 분석을 위해 데이터를 쉽게 준비 할 수 있도록 데이터 추출, 변환 및 로드(ETL)도구로 작동하는 AWS서비스
- 글루건,,,풀로 붙여서 미리 준비


## 11. 인공지능

<img width="660" alt="image" src="https://user-images.githubusercontent.com/81672260/158003111-ae3961ad-9e59-45e4-9132-ae3582abd0a6.png">


### 11.1 AWS Lex
- 대화형 챗봇 서비스

### 11.2 AWS Polly
Text -> 음성으로 변환

<img width="564" alt="image" src="https://user-images.githubusercontent.com/81672260/158003014-f8c88b83-3990-4133-9260-d0303d5e76c9.png">

### 11.3 AWS Rekognition *중요*
- 이미지, 비디오 분석
- 사진에 나타나는 객체를 자동으로 감지

<img width="677" alt="image" src="https://user-images.githubusercontent.com/81672260/158003072-7b2cd566-9b66-4480-a855-ba569cc6a78d.png">

## 12. 모바일 서비스

### 12.1 AWS Mobile Hub

### 12.2 AWS Cognito
- 임시 권한
- 웹 및 모바일 앱에 대한 인증, 권한 부여 및 사용자 관리를 제공
- 클라이언트가 AWS 서비스에 액세스 할 수 있도록 임시 액세스 자격 증명을 생성 할 수 있으므로 클라이언트 애플리케이션에 장기 자격 증명을 저장할 필요가 없다.

### 12.3 AWS Pinpoint

### 12.4 AWS Device Farm

### 12.5 AWS Mobile SDK

### 12.6 AWS Mobile Analytics

## 13. 애플리케이션 서비스

### 13.1 AWS Step Functions

### 13.2 AWS API Gateway

### 13.3 AWS Elastic Transcoder

### 13.4 AWS SWF

## 14. 메시징

### 14.1 AWS SQS(Simple Queue Service)

### 14.2 AWS SNS (Simple Notification Service)

### 14.3 AWS SES (Simple Email Service)

## 15. 기업 생산성

### 15.1 AWS WorkDocs

### 15.2 AWS WorkMail

### 15.3 AWS Chime

## 16.데스크톱 및 앱스트리밍

### 16.1 AWS WorkSpaces

### 16.2 AWS AppStream 2.0

## 17. 사물인터넷

### 17.1 AWS loT 플랫폼

### 17.2 AWS Greengrass

### 17.3 AWS loT 버튼

## 18. 게입 개발

### 18.1 AWS GameLift

### 18.3 AWS Lumberyard

## 19. 벡서에 없는 내용

### 19.1 공동 책임 모델 - Shared Responsibility Model *중요*

<img width="677" alt="image" src="https://user-images.githubusercontent.com/81672260/158003424-e2e1d8ed-3501-4188-9c25-fea2253d51b3.png">

구성 : 고객/AWS 책임 공유 !
- AWS : 클라우드 인프라 자체
- 고객 : 자체 Guest OS/DB 클라우드 인프라 위의 보안

### 19.2 비용 할당 태그 - Cost Allocation tags
- 태깅을 해서 각 부서별 금액이 얼마 나왔는지 알 수 있다.

### 19.3 조직에 대한 통합 결제 - Consolidated builling  *중요*
통합 결제 -> AWS Organizations
고객이 여러 AWS 계정을 통합하고 중앙에서 관리하려면 어떤 서비스를 사용해야 합니까?
-> AWS Organizations

### 19.4 AWS Budgets. *중요*
- 예산 설정된 한계치 도달하면 알림 경보

### 19.5 APN 기술 파트너 - AWS Partner Network Technology Partners

### 19.6 APN 컨설팅 파트너 - AWS Partner Network Consulting Partners

### 19.7 AWS Cost Explorer - 비용 탐색기
- 과거의 데이터가 있어야 비용 탐색이 가능

### 19.8 Detailed Billing Report - 상세 비용 보고서
- 상세한 비용 내용이 보고 싶을때

### 19.11 Virtual Private Gateway
[site to site VPC]

### 19.12 AWS Simple Monthly Calculator *중요*
- AWS 없는 고객도 AWS 서비스 예상 비용을 알아볼 수 있다.\
<img width="627" alt="image" src="https://user-images.githubusercontent.com/81672260/158004446-60cc0bbb-e69e-4ca7-9be3-17a29854a293.png">

### 19.13 AWS 총 소유 비용(TCO)계산기  *중요*
온 프레미스 -> AWS으로 이전하는데 발생되는 비용 확인할 때 서비스

### 19.14 AWS Professional Services

### 19.15 AWS Artifact *중요*
- 준수 규정
- 규정 준수와 관련된 정보를 제공하는 신뢰할 수 있는 중앙 리소스
- AWS 보안 및 규정 준수 보고서

### 19.16 AWS Schema Conversion Tool

### 19.17 AWS CloudWatch Logs *중요*

### 19.18 AWS Neptune *시험출제*

### 19.19 AWS SageMaker

### 19.20 AWS Machine Imange(AMI)
- 사용자가 사전 구성된 Amazon EC2인스턴스를 시작할 수 있도록 하는 것

### 19.21 AWS Macie *중요*
- 개인 식별 정보(PII)와 같은 민감한 데이터를 식별하고 경고하는 데 도움을 준다.
- 민감한 정보 -> 피자는 맥심

### 19.22 AWS Global Accelerator *중요*
- 엔드 단 상태 지속 모니터링 -> 즉시 대응 서비스
- AWS의 방대하고 가용성이 높고 혼잡이 없는 글로벌 네트워크를 사용하여 사용자의 인터넷 트래픽을 AWS리전에서 실행되는 애플리케이션으로 보낸다.
- Network Load Balancer, Application Load Balancer, EC2 인스턴스 또는 탄력적 IP와 같은

### 19.23 암호화 관련
1. AWS KMS(AWS Key Management Service)  *중요*
- 데이터 암호화에 사용되는 암호화 키인 고객 마스터 키 (CMK)를 쉽게 생성하고 제어 할 수 있는 관리형 서비스.

2. AWS CloudHSM
- 클라우드 기반
- AWS 클라우드에서 자체 암호화 키를 쉽게 생성하고 사용할 수 있게 해주는 하드웨어 보안 모듈(HSM)

### 19.24 VPC Flow Logs
- AWS VPC 인프라에서 `수신 및 발신 트래픽에 대한 정보를 캡처`하는 데 사용할 수 있는 AWS 기능 또는 서비스
<img width="661" alt="image" src="https://user-images.githubusercontent.com/81672260/158004842-ae81633e-3b98-4782-9317-de8ace70ea86.png">

### 19.25 AWS Support플랜 비교 *중요*
<img width="657" alt="image" src="https://user-images.githubusercontent.com/81672260/158004916-75fc178e-bf6c-47a7-bf62-b352e1d992b9.png">

- 전체 AWS Trusted Advisor 점검 세트를 제공하는 AWS Support플랜(전체 세트) -> Enterprise / Business

### 19.26 Amazon S3 One Zone-Infrequent Access(S3 One Zone-IA)
- 자주 엑세스하지 않지만 필요할 때 빠르게 액세스해야 하는 데이터에 적합
- 가용성 및 복원력이 필요 없는 고객에게 적합 -> 복원력 요구사항이 낮음

### 19.27 AWS Control Tower
- 안전하게 잘 설계되었으며, 바로 사용할 수 있는 다중계정 AWS환경을 자동화하고 관리

### 19.28 CloudEndure

- CloudEndure기반 자동 재해 복구 출시
- CloudEndure Disaster Recovery 사용 사례

1. 온프레미스-클라우드 재해 복구
2. 리전 간 재해 복구
3. 클라우드 간 재해 복구
4. 80% 요금 인하(경제적인 복구 서비스)

## 내용 추가

### Amazon EMR (빅 데이터 플랫폼) *중요*
- 방대한 양의 데이터를 처리하기 위한 클라우드 빅 데이터 플랫폼

### AWS Outpost
- AWS 서비스를 고객사 전산실에 집어 넣는다고 생각
- 아래와 같은 이유로 온프레미스에 데이터 센터를 유지할 수 밖에 없음
 - 네트워크 지연 시간이 민감한 워크로드
 - 로컬 데이터 : 보안 규정 때문에 건물을 벗어나지 못하는 경우
 - 로컬 데이터 : 현장에서 대량의 데이터를 처리해야하는 애플리케이션

### AWS 대응 방안
- AWS 인프라와 서비스를 고객의 데이터센터로 보냄
- AWS Outposts Rack을 고객사에 완전 조립하여 배송
- AWS가 설치함 전원과 네트워크만 연결
- <img width="666" alt="image" src="https://user-images.githubusercontent.com/81672260/158005196-1b53b02f-d54b-4ff1-9b56-49a698eab3e6.png">

### AWS Simple Queue Service(SQS)
- FIFO 방식으로 선입 선출하는 메시지 서비스

### AWS Amazon Inspector
- 기타 보안 도구 인 Amazon QuickSight (BI Service)를 읽어야한다.

### AWS Well-Arichitected 프레임 워크, 각 요소 암기 *중요*
1. 운영 우수성
2. 보안
3. 안정성
4. 성능 효율성
5. 비용 최적화

### AWS Trusted Advisor *중요*
1. 고객의 AWS환경을 정밀 조사 -> 권장사항 알려줌
2. 아래와 같은 베스트 모범사례 자동화 지원
3. `AWS 계정을 분석하고 권장 사항(베스트 모범사례)를 제공한다.`
 - 비용최적화
 - 성능
 - 보안
 - 내결함성
 - 서비스 제한

### Amazon Comprehend. *중요*
- 자연어 처리 (NLP)에 기계 학습을 사용하고 싶지만 기계 학습 경험이 없는 사용자를 돕기 위해 설계된 AWS 서비스
- 기계 학습을 사용하여 텍스트 안에 있는 통찰력과 관계를 찾아내는 자연어 처리(NLP)서비스.

### AWS Neptune *중요*
- 클라우드용으로 구축된 빠르고 안정적인 그래프 데이터 베이스
- 고성능 그래프 데이터베이스 

## S3 Standard vs S3 Standard IA vs S3 one zone IA 차이 비교 *중요*
<img width="664" alt="image" src="https://user-images.githubusercontent.com/81672260/158005447-ed97dd74-4e38-4376-b17c-9be7faf44a2d.png">

<img width="678" alt="image" src="https://user-images.githubusercontent.com/81672260/158005481-4907e05b-8cf7-44c7-8f02-424d0aec9408.png">

가격 : AWS Glacier가 가장 저렴

### AWS Direct Connect(DX) *중요*
- AWS와 데이터 센터, 사무실, 코로케이션 환경 사이에 안정적인 프라이빗 연결
- AWS <---> 데이터 센터를 Direct Connect로 연결

### VPN과 Direct Connect 비교
- Direct Connect는 온 프레미스-AWS 연결용, 전용 프라이빗 네트워크 연결

<img width="653" alt="image" src="https://user-images.githubusercontent.com/81672260/158005559-f2b4920a-19b0-4b97-bcdd-9e26f641f95f.png">

### VPC에서 S3, DynamoDB와 같은 곳에 접근하기 위해서는?
- 인터넷 게이트 웨이를 통해 접근이 가능 -> 다이렉트 접근은 불가
- <img width="649" alt="image" src="https://user-images.githubusercontent.com/81672260/158005697-f5b30326-f440-443e-93e8-7493299918ed.png">

### AWS Transit Gateway

- AWS에서 온프레미스 외부와 연결하기 위해서는
1. VPN
2. Direct Connect
3. AWS Trasit Gateway를 사용하면 된다.

### Availability Zone in AWS
- 1개, 1개이상의 물리적 데이터센터를 의미  *중요*
- 한국의 리전안에, 서울/대전/대구와 같은 의미

### 피어링 연결(Peering Connection)
- 두개의 서로 다른 VPC간의 네트워크 연결
- Private IP를 사용하여 두 VPC내의 인스턴스들이 직접 통신할 수 있는 기능을 제공.

### 보안 그룹(Security Group)  *중요*

- Amazon EC2 인스턴스에 대한 가상 방화벽 역할
Network ACL과 함께 VPC내의 보안을 강화하기 위하여 기본적으로 사용하는 기능, Network ACL과 다르게 Stateful 방화벽으로 동작.


### AWS클라우드에서 고 가용성의 예는 ?
- 리소스 장애가 발생하더라고 애플리케이션에 계속 액세스 할 수 있도록 보장하는 것

## Amazon EC2 요금 모델 비교 정리 *중요*
- AWS EC2인스턴스에 대한 요금을 지불하는 방법에는 온 디맨디드 인스턴스, 예약 인스턴스, 스팟 인스턴스, 전용 호스트 네 가지 방법이 있다.

### 1. Amazon EC2 On-Demand Pricing, 온 디맨드 인스턴스
- 가장 기본 요금제
- 장기 및 단기 약정/선결제 금액 없이 인스턴스를 만들고 시작해서 사용
- 종료하여 반납하면 사용한 만큼 정산되는 요금 방식
- 온디맨드 -> 찾아오는 서비스 라는 뜻으로 생각
- 내가 원할 때 클라우드 컴퓨팅을 사용할 수 있고, 사용한 만큼 돈을 지불
- 보통 시간 단위로 컴퓨팅 사용량을 지불
- 장기 약정 없이 시간 단위로 인스턴스를 사용하기 때문에 보편적으로 가장 많이 선택하는 요금제

### 2. Amazon EC2 Spot Instances Pricing, 스팟 인스턴스
- 온디맨드 요금보다 90% 할인된 가격(온디맨드 인스턴스와 차이)
- 스팟 인스턴스 요금제는 내가 사용할 인스턴스 상품을 입찰해서 사용.
- 스팟 요금제는 AWS클라우드에서 미사용 EC2 용량을 활용하기 위해서 출시된 것
- 따라서, AWS 클라우드 전체 자원이 남아돌때는 저렴하게 Get해서 사용할 수 있다는 것을 의미

### 3.Amazon EC2 Reserved Instances Pricing, 예약 인스턴스
- 선납금을 납부하는 방식
- 온디맨드 인스턴스 보다 최대 75% 저렴하게 이용 가능
- 예약 인스턴스를 특정 가용 영역에 지정하면 용량 예약이 제공되므로 필요할 때 예약한 인스턴스를 시작할 수 있음
- ex)회사가 수요일에 특히 서버자원을 많이 쓴다면 수요일 자원을 늘려야함. 인스턴스를 수요일에 늘려 돈을 절약
- 1년 또는 3년의 약정 기간이 필요하다.

### 4. Amazon EC2 Dedicated Hosts, 전용 호스팅
- 고객 전용의 물리적 EC2서버.
- 전용 호스팅을 사용하면 기존 서버 한정 소프트웨어(MSSQL...)을 사용할 수 있으며 비용 절감
- 온디맨드로 구매 가능
- 온디맨드 요금과 비교하여 최대 70%할인된 예약 인스턴스로 구매 가능

### 5. 초당 결제
- 초당 결제에서는 사용한 만큼 비용 지불.
- 1시간에서 사용하지 않은 분 및 초를 차감하고 청구하므로 애플리케이션을 개선하는 데 집중할 수 있다.
- 개발/테스트, 데이터처리, 분석, 배치 처리 등 비정기적인 시간 동안 실행될때 유용.
- EC2사용량은 초 단위로 청구되며 최소 청구 시간은 60초
- 온디맨드, 예약 및 스팟 형태
- 모든 리전 및 가용영역, Amazon Linux 및 Ubuntu

## 서브넷
- 서브넷은 보안 또는 운영 요구 사항에 따라 리소스를 그룹화할 수 있는 내의 한 섹션이다. 서브넷은 퍼블릭 또는 프라이빗일 수 있다.

![image](https://user-images.githubusercontent.com/81672260/158044636-fe201e8b-7214-4bc1-8550-04d42e766326.png)

### 퍼블릭 서브넷
- 온라인 상점의 웹 사이트와 같이 누구나 액세스할 수 있어야 하는 리서ㅗ스가 포함

### 프라이빗 서브넷
- 고객의 개인 정보 및 주문 내역이 포함된 데이터베이서와 같이 프라이빗 네트워크를 통해서만 액세스할 수 있다.
- VPC 내에서 서브넷은 서로 통신할 수 있다.  퍼블릭 서브넷 <-----> 프라이빗 서브넷

### VPC의 네트워크 트래픽
- 고객이 AWS 클라우드에서 호스팅되는 애플리케이션에 데이터를 요청하면 이 요청은 패킷으로 전송됩니다. 패킷은 인터넷이나 네트워크를 통해 전송되는 데이터의 단위입니다. 

## Amazon VPC란 ?
- Amazon Virtual Private Cloud(Amazon VPC)를 이용하면 사용자가 정의한 가상 네트워크로 AWS 리소스를 시작할 수 있습니다. 이 가상 네트워크는 AWS의 확장 가능한 인프라를 사용한다는 이점과 함께 고객의 자체 데이터 센터에서 운영하는 기존 네트워크와 매우 유사합니다.

## 네트워크 ACL(액세스 제어 목록)
- 네트워크 ACL(액세스 제어 목록)은 서브넷 수준에서 인바운드 및 아웃바운드 트래픽을 제어하는 가상 방화벽입니다.

## 상태 비저장 패킷 필터링
- 네트워크 ACL은 상태 비저장 패킷 필터링을 수행한다.
