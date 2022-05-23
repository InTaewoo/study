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


