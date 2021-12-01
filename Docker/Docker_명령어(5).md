# 7 도커의 유용한 명령어

# 7.1 포트포워딩 톰캣 실행하기

![image](https://user-images.githubusercontent.com/81672260/144150354-3a33004e-5420-4122-9221-0aaa7851d7d5.png)

만약 접속이 안될시 캐시 삭제후 진행

![image](https://user-images.githubusercontent.com/81672260/144150593-15df4ab3-b812-4231-b67f-ca894fe6a01a.png)

# 7.2 컨테이너 내부 셸 실행
```
docker exec -it tc(컨테이너이름) /bin/bash
```
나갈땐 exit

# 7.3 컨테이너 로그 확인

```
docker logs tc(컨테이너이름)
```

# 7.4 호스트 및 컨테이너 간 파일 복사

```
sudo docker cp <path> <to container>:<path>
sudo docker cp <from container>:<path> <path>
sudo docker cp <from container>:<path> <to container>:<path>
```

# 7.5 도커 컨테이너 모두 삭제

![image](https://user-images.githubusercontent.com/81672260/144151736-f3f7e8f0-53e9-4f46-a2af-135728789f41.png)

전체 중지후 삭제 
```
sudo docker stop `sudo docker ps -a -q`
sudo docker rm `sudo docker ps -a -q`
```

```
컨테이너 ID
docker ps -a -q
```

# 7.6 임시 컨테이너 생성

![image](https://user-images.githubusercontent.com/81672260/144152923-ca2ac900-10e6-486b-8368-c9e9f93cbc6f.png)

```
docker run -d -p 80:8080 --rm --name tc tomcat
```

임시 컨테이너라 정지만 해도 삭제됨
![image](https://user-images.githubusercontent.com/81672260/144153074-c6ce213a-4c24-40c1-aaaf-eed0bd9d0f32.png)
