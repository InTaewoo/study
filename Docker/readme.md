# 1.2 도커(Docker)
- 컨테이너 기술을 지원하는 다양한 프로젝트 중 하나
- 컨테이너 기술을 이전에도 있었으나 도커로 인해 알려짐
- 컨테이너 기술의 사실상 표준
- 2014년 가장 인기 있는 클라우드 오픈소스 2위
- 다양한 운영체제에서 사용가능 (리눅스,윈도우,Mac)
- 애플리케이션에 국한되지 않고 의존성 및 파일 시스템까지 패키징하여 빌드, 배포,실행을 단순
- 리눅스의 네임 스페이스와 cgroups와 같은 커널 기능을 사용하여 가상화
![image](https://user-images.githubusercontent.com/81672260/143965846-4db9b685-6c59-431e-bb9a-2138bef90bc8.png)


- vm과 비교했을때 훨씬 가벼운 애플리케이션을 돌리는 환경을 제공
- 도커는 다양한 클라우드 서비스 모델과 같이 사용 가능

- 이미지: 필요한 프로그램과 라이브러리, 소스를 설치한 뒤 만든 하나의 파일

- 컨테이너: 이미지를 격리하여 독립된 공간에서 실행한 가상 환경

![image](https://user-images.githubusercontent.com/81672260/143965812-605958bb-9a25-433e-8d6c-ef8507a41288.png)

# 1.3 컨테이너가 해결한다!

- 동일 시스템에서 실행하는 소프트웨어의 컴포넌트가 충돌하거나 다양한 종속성을 가지고 있음

- 컨테이너는 가상머신을 사용해 각 마이크로 서비스를 격리(isolate)하는 기술

- 컨테이너는 가상머신처럼 하드웨어를 전부 구현하지 않기 때문에 매우 빠른 실행 가능

- 프로세스의 문제가 발생할 경우 컨테이너 전체를 조정해야 하기 때문에 컨테이너에 하나의 프로세스를 실행하도록 하는 것이 좋다. (브라우저와 비슷 !)

![image](https://user-images.githubusercontent.com/81672260/143966137-06bc846e-c5a2-4303-80a3-5f48dc6844fd.png)

# 1.4 컨테이너 성능 비교


VM으로 실행했을 때와 컨테이너로 실행했을 때 CPU 튀는 현상 비교
![image](https://user-images.githubusercontent.com/81672260/143966202-5782a3dc-71f2-49fe-a38d-ce81331589ac.png)

네이티브, VM, 컨테이너로 G플롭스(GFLOPS, GPU FLoating point Operations Per Second)

G플롭스(GFLOPS, GPU FLoating point Operations Per Second)는 컴퓨터의 성능을 수치로 나타낼 때 주로 사용되는 단위

![image](https://user-images.githubusercontent.com/81672260/143966306-6e284a77-3f3f-476e-98ff-25e370b5f233.png)

# 1.5 컨테이너를 격리하는 기술
리눅스 네임 스페이스 : 각 프레서스가 파일 시스템 마운트, 네트워크, 유저, 호스트네임 등에 대해 시스템에 독립 뷰를 제공
![image](https://user-images.githubusercontent.com/81672260/143966681-edb939dd-746f-4f7a-8c5d-9a079a7f695f.png)

리눅스 컨트롤 그룹 : 프로세스가 소비할 수 있는 리소스양(CPU,메모리,I/O, 네트워크 대역대, device, 노드 등)을 제한
![image](https://user-images.githubusercontent.com/81672260/143966777-51733d80-973c-4a93-983b-420593f5b297.png)

# 1.6 도커의 한계
서비스가 커지면 커질 수록 관리해야 하는 컨테이너의 양이 급격히 증가. 도커를 사용하여 관리를 한다 하더라도 쉽지않은 형태 배포 및 컨테이너 배치 전략 스케일-인, 스케일-아웃이 어려움
![image](https://user-images.githubusercontent.com/81672260/143966867-d74cf358-e0f5-4d8f-96fa-278ed09f8fdb.png)

[출처] 왕초보도 따라하는 도커 기초 1 도커와 컨테이너 소개|작성자 일선스

