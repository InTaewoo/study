# 도커 실행 연습문제

1. 기존에 설치된 모든 컨테이너와 이미지 정지 및 삭제
2. 도커 기능을 사용해 Jenkins 검색
3. Jenkins를 사용하여 설치
4. Jenkins 포트로 접속하여 웹 서비스 열기
5. Jenkins의 초기 패스워드 찾아서 로그인하기

## 1. 기존에 설치된 모든 컨테이너와 이미지 정지 및 삭제

```
docker stop `docker ps -a -q` 실행중인 모든 컨테이너 중지
docker rm `docker ps -a -q` 실행중인 모든 컨테이너 삭제
docker rmi `docker ps -a -q` 모든 이미지 삭제
```
