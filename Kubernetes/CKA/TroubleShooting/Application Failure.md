## 트러블 슈팅 예시

### 1. ubleshooting Test 1: A simple 2 tier application is deployed in the alpha namespace. It must display a green web page on success. Click on the App tab at the top of your terminal to view your application. It is currently failed. Troubleshoot and fix the issue.
![image](https://user-images.githubusercontent.com/81672260/173997262-65f0fe7c-7687-437c-812e-9f783d6e7563.png)

![image](https://user-images.githubusercontent.com/81672260/174012452-d3fb8c2d-7055-4ee6-b880-e68b5e8cfebd.png)

```
k config set-context --current --namespace=alpha
kubecl get svc -n alpha
kubectl describe deploy webapp-mysql  : DB_Host: mysql-service 이므로 서비스 이름 변경
kubectl edit svc mysql     : mysql -> mysql-service
```
![image](https://user-images.githubusercontent.com/81672260/174015030-0f6ec451-79e7-4ea6-8158-a81a3c7ba7d2.png)


## 2. roubleshooting Test 2: The same 2 tier application is deployed in the beta namespace. It must display a green web page on success. Click on the App tab at the top of your terminal to view your application. It is currently failed. Troubleshoot and fix the issue. 같은 예시

![image](https://user-images.githubusercontent.com/81672260/174015616-d003c812-8673-4918-9ce4-6a26244655fa.png)
- 111 Coneection refused 을 확인

![image](https://user-images.githubusercontent.com/81672260/174016039-30c66495-08ef-4789-a718-1d272dad020b.png)
port = 3306 이여야 한다.

```
kubectl edit svc mysql-service -n beta
targetport=3306 으로 변경
```

## 3. Troubleshooting Test 3: The same 2 tier application is deployed in the gamma namespace. It must display a green web page on success. Click on the App tab at the top of your terminal to view your application. It is currently failed. Troubleshoot and fix the issue. 같은 예시

- 접속 장애 연결 오류

![image](https://user-images.githubusercontent.com/81672260/174017152-2061df73-62cb-4126-9f80-2648925cb7cb.png)

```
kubectl get svc -n gamma -o wide : 파드의 이름이 잘못 지정돼 연결이 안되는 상태
```

## 4. Troubleshooting Test 4: The same 2 tier application is deployed in the delta namespace. It must display a green web page on success. Click on the App tab at the top of your terminal to view your application. It is currently failed. Troubleshoot and fix the issue.
![image](https://user-images.githubusercontent.com/81672260/174017794-64114838-68c9-4cf9-889f-c45cee59b3a1.png)

![image](https://user-images.githubusercontent.com/81672260/174017928-c64ba1fc-010f-4891-ac4b-eaf5354259b5.png)

- sql user에 접근할 수 없는 오류

```
kubectl edit deploy -n delta
DB_User 를 root로 수정
```


![image](https://user-images.githubusercontent.com/81672260/174018318-518b4786-24a7-4f84-b740-1261756c967d.png)




