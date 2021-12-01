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

## 2. 도커 기능을 사용해 Jenkins 검색

```
docker search jenkins
```

## 3. jenkins를 사용하여 설치

```
docker pull jenkins/jenkins
docker inspect jenkins/jenkins
docker run -d -p 8080:8080 --name jk jenkins/jenkins
```
![image](https://user-images.githubusercontent.com/81672260/144155128-c0d5bc5f-667f-4330-bd3e-e288677b69e3.png)
- jenkins/jenkins 설치

![image](https://user-images.githubusercontent.com/81672260/144155362-53e7a24e-4860-4abb-938b-00dc8281a236.png)
- inspect jenkins/jenkins 정보를 통해 8080포트가 열려있다는걸 확인

![image](https://user-images.githubusercontent.com/81672260/144155614-55351cda-c34f-45e1-b28e-e2a4e8bc2d58.png)


## 4. jenkins포트를 사용하여 웹 서비스 열기
```
firefox 127.0.0.1:8080
브라우저에 캐시가 남아있는 경우에는 ctrl+shift+del
```
## 5. jenkins 초기 패스워드를 찾아서 로그인하기

```
sudo docker exec -it jk cat /var/jenkins_home/secrets/initialAdminPassword
sudo docker logs jk
```

![image](https://user-images.githubusercontent.com/81672260/144156980-97e009bb-c927-498c-a587-4acd60d6b34a.png)
- sudo docker exec -it jk cat /var/jenkins_home/secrets/initialAdminPassword

![image](https://user-images.githubusercontent.com/81672260/144156932-24c9c7d1-1e8d-46ef-8d6a-1488daa33a74.png)
- sudo docker logs jk

