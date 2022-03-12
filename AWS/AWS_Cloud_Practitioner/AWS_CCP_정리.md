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

<img width="368" alt="image" src="https://user-images.githubusercontent.com/81672260/158002966-54bb936a-4fb8-47ef-b001-32148e4c9dfb.png">


### 11.1 AWS Lex
- 대화형 챗봇 서비스

### 11.2 AWS Polly
Text -> 음성으로 변환

<img width="564" alt="image" src="https://user-images.githubusercontent.com/81672260/158003014-f8c88b83-3990-4133-9260-d0303d5e76c9.png">

### 11.3 AWS Rekognition *중요*
- 이미지, 비디오 분석
- 사진에 나타나는 객체를 자동으로 감지

<img width="677" alt="image" src="https://user-images.githubusercontent.com/81672260/158003072-7b2cd566-9b66-4480-a855-ba569cc6a78d.png">


