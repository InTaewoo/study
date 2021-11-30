# 4. 도커 라이프 사이클 이해하기
![image](https://user-images.githubusercontent.com/81672260/143989429-17aa77ee-5765-496c-9bac-fa0d3046bb35.png)
 
 ![image](https://user-images.githubusercontent.com/81672260/143990740-83944b05-f831-4da6-ad85-154b28a67b9c.png)
# 5.1 도커 이미지 다운로드와 삭제
nginx 이미지 설치,삭제

```
docker pull nginx
```

```
docker rmi nginx
```


![image](https://user-images.githubusercontent.com/81672260/143990960-d08ca8a7-70ca-4f01-8caa-c6bb8f91aaf0.png)

# 5.3 
```
docker ps -a
```
실행하여 실행중인지 확인

![image](https://user-images.githubusercontent.com/81672260/143991627-a7d8c61b-d7c3-4b3f-b883-3d2bd8b995ea.png)

``` 
docker start "container ID"
```

```
docker run -d -p 80:80 --name nx2 nginx
```

![image](https://user-images.githubusercontent.com/81672260/143991360-5d4de0d0-2329-41ef-b930-91e0505c994d.png)

![image](https://user-images.githubusercontent.com/81672260/143991757-f9502a0a-be18-4dae-8d39-11adcee042d6.png)
- 현재 실행중인 container




![image](https://user-images.githubusercontent.com/81672260/143992622-158cfb3c-98f2-45a8-8f40-9674bb7e4c28.png)

- docker 컨테이너가 생성은 되지만 포트가 겹치기 때문에 읽혀지진 않음

# 5.4 컨테이너 중지

![image](https://user-images.githubusercontent.com/81672260/143993140-3bc33cba-f51d-4463-a43f-d98299a244fe.png)

- docker container가 실행중일땐 stop하고 삭제해야 삭제가 가능

```
docker stop "container ID"
```

# 5.5 컨테이너 삭제

![image](https://user-images.githubusercontent.com/81672260/143994341-6df12b47-5e7b-4a01-a30f-9fd2a3be0033.png)
 
 # 5.6 이미지 삭제
 
 ```
 docker rmi "images"
 ```
 
 ```
 모든 이미지 삭제
 docker rmi -f
 docker image rm
 ```
