## Dockerfile
- Dockerfile은 DockerImage를 생성하기 위한 스크립트(설정파일)이다.
- 여러가지 명령어를 토대로 Dockerfile을 작성한 후 빌드하면 Dokcer은 Dockerfile에 나열된 명령문을 차례대로 수행하며 DockerImage를 생성해준다.
- Dockerfile을 읽을 줄 안다는 것은 해당 이미지가 어떻게 구성되어 있는지 알 수 있다는 의미다.

## Dockerfile의 장점
### 1. 이미지가 어떻게 만들어졌는지를 기록한다.
- 보통 사람들은 완성된 이미지를 가져다 쓰기 때문에 이미지가 어떻게 만들어졌는지에 대해서는 알 필요가 없다.
- 그러나 개발자의 경우라면 조금 다르다. 어떠한 애플리케이션을 담고 있는 이미지가 설치 되기 위한 과정은 어떠한지, 중간에 어떠한 과정을 수정해야 하는지 등을 알아야 하는 경우가 있다.
- 예를 들어 raw한 상태의 우분투 이미지에서 자신이 원하는 애플리케이션을 담은 이미지를 만들어내기까지, 그 과정들을 기록하고 수정하며 바꿔나갈 수 있다는 것이다.
- 이는 Dockerfile이 자동화된 스크립트 형태이기 때문이다.

### 2. 배포에 용이하다.
- 어떠한 이미지를 배포할 때, 몇 기가씩이나 되는 이미지 파일 자체를 배포하기보다는 그 이미지를 만들 수 있는 스크립트인 Dockerfile만을 배포한다면 매우 편리할 것이다.
- 사용자는 그 스크립트를 실행시키기만 하면 스스로가 그 Dockerfile에 해당하는 이미지를 얻을 수 있기 때문이다.
- 실제로 Docker Hub에 가면, Dockerfile로 이미지를 배포하고 있는 사람들을 심심찮게 볼 수 있다. 물론 이미지로 배포하는 사람도 있지만.
 
### 3. 컨테이너(이미지)가 특정 행동을 수행하도록 한다.
- 컨테이너 환경에서 애플리케이션을 개발하다 보면, 특정 행동을 취하도록 하는 컨테이너를(이미지를) 만들어야 할 때가 있다.
- 이는 사실 말로서 설명하기는 좀 어렵고, 실제 개발을 하다보면 '아, 이거 Dockerfile 쓰면 좀 간단해 지겠구나...' 라는 생각이 머릿속에서 불현듯 번개처럼 스칠때가 있다.

## Dockerfile 작성 및 명령어

- Dockerfile을 작성 할 땐 실제 파일의 이름을 `Dockerfile`로 해야한다.
- Dockerfile의 내용은 아래와 같다.

```
  # server image는 ubunutu 18.04를 사용
  FROM ubuntu:18.04 
  # Dockerfile 작성자
  MAINTAINER Wimes <yms04089@kookmin.ac.kr> 

  # image가 올라갔을 때 수행되는 명령어들
  # -y 옵션을 넣어서 무조건 설치가 가능하도록 한다.
  RUN \
      apt-get update && \
      apt-get install -y apache2

  # apache가 기본적으로 80포트를 사용하기 때문에 expose를 이용해 apache server로 접근이 가능하도록 한다.
  EXPOSE 80 

  # 컨테이너가 생성 된 이후에 내부의 아파치 서버는 항상 실행중인 상태로 만들어준다.
  # apachectl을 foreground(즉, deamon)상태로 돌아가도록 한다.
  CMD ["apachectl", "-D", "FOREGROUND"]
  ```
  
- From : 베이스 이미지
  - 어느 이미지에서 시작할건지를 의미한다.

- MAINTAINER : 이미지를 생성한 개발자의 정보 (1.13.0 이후 사용 X)
- LABEL : 이미지에 메타데이터를 추가 (key-value 형태)
- RUN : 새로운 레이어에서 명령어를 실행하고, 새로운 이미지를 생성한다.
  - RUN 명령을 실행할 때 마다 레이어가 생성되고 캐시된다.
  - 따라서 RUN 명령을 따로 실행하면 apt-get update는 다시 실행되지 않아서 최신 패키지를 설치할 수 없다.
  - 위 처럼 RUN 명령 하나에 apt-get update와 install을 함께 실행 해주자.

- WORKDIR : 작업 디렉토리를 지정한다. 해당 디렉토리가 없으면 새로 생성한다.
  - 작업 디렉토리를 지정하면 그 이후 명령어는 해당 디렉토리를 기준으로 동작한다.
  - cd 명령어와 동일하다.

- EXPOSE : Dockerfile의 빌드로 생성된 이미지에서 열어줄 포트를 의미한다.
  - 호스트 머신과 컨테이너의 포트 매핑시에 사용된다.
  - 컨테이너 생성 시 -p 옵션의 컨테이너 포트 값으로 EXPOSE 값을 적어야한다.

- USER : 이미지를 어떤 계정에서 실행 하는지 지정
  - 기본적으로 root에서 해준다.

- COPY / ADD : build 명령 중간에 호스트의 파일 또는 폴더를 이미지에 가져오는 것
  - ADD 명령문은 좀 더 파워풀한 COPY 명령문이라고 생각할 수 있다.
  - ADD 명령문은 일반 파일 뿐만 아니라 압축 파일이나 네트워크 상의 파일도 사용할 수 있다.
  - 이렇게 특수한 파일을 다루는 게 아니라면 COPY 명령문을 사용하는 것이 권장된다.


- CMD / ENTRYPOINT : 컨테이너를 생성,실행 할 때 실행할 명령어
  - docker run 명령으로 컨테이너를 생성하거나, docker start 명령으로 정지된 컨테이너를 시작할 때 실행된다.
  - 보통 컨테이너 내부에서 항상 돌아가야하는 서버를 띄울 때 사용한다.

- ENTRYPOINT : ENTRYPOINT는 docker run 실행 시, 추가적인 명령어의 존재 여부와 상관 없이 무조건 실행되는 명령이다.

## 생성한 Dockerfile을 Image로 빌드

- 이미지 빌드 명령어

```
docker build -tag(-t) [이미지 이름:이미지 버전] [Dockerfile의 경로]
docker build -t apache-image .
```

- 생성된 이미지 확인

```
docker images
```

## Image로 Container를 생성
- 컨테이너 생성 시 도커 볼륨을 통해 host와 도커 컨테이너의 html 폴더를 동기화.

```
docekr run --name apache-container -d -p 80:80 -v ~/html/:/var/www/html apache-image
```

- --name:컨테이너 이름
- -d : 백그라운드모드로 실행
- -p : [호스트포트][컨테이너포트] 포트 연결
- v : 로컬과 컨테이너 파일 연동

