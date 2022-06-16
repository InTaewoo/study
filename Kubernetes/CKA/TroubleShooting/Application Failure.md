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


