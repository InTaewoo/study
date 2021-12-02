# Docekr 명령어 정리

CentOS
- Docker는 OS의 자원을 사용하기 때문에 기본적으로 Root 사용자에서 명령어를 사용해야한다.

## Search (image검색)
```
docker search centos
```

- Docker Hub로부터 사용가능한 image를 찾는 명령어

- Docker는 Dokcer HUB 를 통해 Git Hub 처럼 사용자들간의 이미지 공유를 할 수 있는 환경이 구축되어 있다

- 공식이미지는 galid/centos 처럼 / 앞에 사용자의 이름이 붙지 않는 것

## pull (image 다운로드)
```
docker pull centos:latest
```

- docker hub로 부터 image를 다운받는 명령어

## images(image목록 보기)
```
docker images
```
- 현재 Host PC에 다운 받아져있는 image들을 출력하는 명령어

## run(컨테이나 생성과 동시에 컨테이너로 접속)
```
docker run "REPOSITORY"
```

(docker run <옵션> <이미지이름 or 이미지ID> <실행할 파일>)

- 단순히 image안의 파일을 실행할 목적으로 생성된 것 때문에 메인으로 실행되는 파일이 종료되면 

   컨테이너도 같이 종료된다 따라서 계속해서 컨테이너를 유지하고 싶다면 -d 옵션을 이용해야 한다.

- 다운받은 image를 실행한 형태인 컨테이너로 만드는 명령어이다

## 컨테이너 종료
- Ctrl+d
- Ctrl+p , Ctrl+q

## ps(컨테이너 확인(실행중인 image확인))
```
docker ps
```
- 실행중인 컨테이너의 목록을 확인

```
docker ps -a 
```
- 이전에 종료되었던 컨테이너들을 포함한 컨테이너의 목록을 확인한다

## start(종료된 컨테이너 시작)
```
docker start "container ID"
```

## attach (컨테이너에 접속하기)
```
docker attach "container ID"
```

