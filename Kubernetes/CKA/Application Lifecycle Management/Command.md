![image](https://user-images.githubusercontent.com/81672260/169467857-5c6c397e-4103-4b02-afbd-3883dcc19bc9.png)

- 컨테이너 내에서 실행될 프로그램을 정의하는 명령을 나타내는 명령어는 `CMD` 
- Nginx 이미지의 경우 mysql(d)의 명령.

```
docker run ubuntu [command]
docker run ubuntu sleep 5
```

- 이렇게 하면 컨테이너가 시작될 때 절전 프로그램을 실행하고 5초 동안 기다린 다음 종료된다.

## 예제

### 1. What is the command used to run the pod ubuntu-sleeper?

```
kubectl edit po ubuntu-sleeper
```

![image](https://user-images.githubusercontent.com/81672260/169726240-d00feae7-5b99-4b92-9b65-d422baf344c9.png)


### 2. Create a pod with the ubuntu image to run a container to sleep for 5000 seconds. Modify the file ubuntu-sleeper-2.yaml.
Note: Only make the necessary changes. Do not modify the name.

```
vi ubuntu-sleeper-2.yaml
kubectl apply -f ubuntu-sleeper-2.yaml
```

![image](https://user-images.githubusercontent.com/81672260/169726682-cd9ecdcf-ebd5-40e2-967d-c19205d02010.png)

### 3. Create a pod using the file named ubuntu-sleeper-3.yaml. There is something wrong with it. Try to fix it!

Note: Only make the necessary changes. Do not modify the name.

```
vi ubuntu-sleeper-3.yaml
```

![image](https://user-images.githubusercontent.com/81672260/169726849-8f99ffcd-f32e-4a93-baaa-b1ccd802cf15.png)

1200 -> "1200"

### 4. Inspect the file Dockerfile given at /root/webapp-color directory. What command is run at container startup?

```
cd webapp-color
vi Dockerfile
```
![image](https://user-images.githubusercontent.com/81672260/169727206-f563f955-9c2f-4363-916a-c7adcdbada1b.png)

ENTRYPOINT ["python","app.py"]

