## Ingress 

명령적 방법으로 Ingress 생성

ex) 
```
kubectl create ingress ingress-test --rule="wear.my-online-store.com/wear*=wear-service:80"
```

[공식 사이트](https://kubernetes.io/ko/docs/concepts/services-networking/ingress/)

### 1. Which namespace is the Ingress Controller deployed in?

![image](https://user-images.githubusercontent.com/81672260/173527429-bd7b1c39-2c22-4373-b146-5fcc3547548a.png)

### 2. What is the name of the Ingress Controller Deployment?
![image](https://user-images.githubusercontent.com/81672260/173527959-70169741-d2c9-4ad4-a443-0e3d6a3656b1.png)

### 3. What is the name of the Ingress Resource?
```
kubect get ingress -A
```

### 4. What is the Host configured on the Ingress Resource?

![image](https://user-images.githubusercontent.com/81672260/173529146-07193eb5-df57-4e58-b4c3-258dae1e4a33.png)

### 5. What backend is the /wear path on the Ingress configured with?

```
kubectl describe ingress -n app-space
```

![image](https://user-images.githubusercontent.com/81672260/173530069-7c54077d-b383-4a05-90c5-4daad75dd75e.png)


### 6. If the requirement does not match any of the configured paths what service are the requests forwarded to?

![image](https://user-images.githubusercontent.com/81672260/173530304-f1a29539-25f2-49e3-a5c8-6a4ca55eb93d.png)


### 7. You are requested to change the URLs at which the applications are made available.

- Ingress: ingress-wear-watch

- Path: /stream

- Backend Service: video-service

- Backend Service Port: 8080

```
kubectl edit ingress -n ingress-wear-watch
```

![image](https://user-images.githubusercontent.com/81672260/173530791-56359b4b-ce44-4f24-8d5d-d81d86fe2b0a.png)

### 8. You are requested to make the new application available at /pay.

- Ingress Created

- Path: /pay

- Configure correct backend service

- Configure correct backend port


### 9. Let us now deploy an Ingress Controller. First, create a namespace called ingress-space. - Namespace 생성
We will isolate all ingress related objects into its own namespace.

![image](https://user-images.githubusercontent.com/81672260/173735007-a496dec6-d396-48ca-b00d-dc4eedc93ebb.png)

```
kubectl create namespace ingress-space
```

### 10.The NGINX Ingress Controller requires a ConfigMap object. Create a ConfigMap object in the ingress-space. ConfigMap 생성

Use the spec given below. No data needs to be configured in the ConfigMap.

![image](https://user-images.githubusercontent.com/81672260/173735275-d8951f23-97d8-4212-8a40-7f4e2a4ccc87.png)

```
kubectl create configmap nginx-configuration -n ingress-space
```

### 11. The NGINX Ingress Controller requires a ServiceAccount. Create a ServiceAccount in the ingress-space namespace. ServiceAccount 생성

Use the spec provided below.

```
kubectl create serviceaccount ingress-serviceaccount -n ingress-space
```

### 12. Let us now create a service to make Ingress available to external users. 서비스 배포하기

Create a service following the given specs. 

![image](https://user-images.githubusercontent.com/81672260/173736083-1508d8a4-b77b-4bcc-898a-8d975865a8ee.png)


### 13. Create the ingress resource to make the applications available at /wear and /watch on the Ingress service.- Ingress 생성하여 홈페이지 접속 확인
Create the ingress in the app-space namespace.

![image](https://user-images.githubusercontent.com/81672260/173737834-dcd801ff-3276-4164-ad74-4b7e000d4db2.png)

```
kubectl create ingress ingress-wear-watch -n app-space --rule="/wear=wear-service:8080" --rule="/watch=watch-service:8080"
kubectl get ingress ingress-wear-watch -n app-space
kubectl get deployments.apps -n app-space
kubectl edit ingress ingress-wear-watch -n app-space --> watch-service => video-service
```

하지만 홈페이지 접속 불가

![image](https://user-images.githubusercontent.com/81672260/173738440-2777a021-838d-4260-a19e-ddc7d7879ce7.png)

`ERR_TOO_MANY_REDIRECTS` 리디엑션 관련 오류는 SSL에서 시도하기 때문에 발생


```
kubectl edit ingress ingress-wear-watch -n app-space

추가
 annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /
    nginx.ingress.kubernetes.io/ssl-redirect: "false"
```

![image](https://user-images.githubusercontent.com/81672260/173739040-b3ec30d3-c14d-4efe-b498-751b76921e40.png)
![image](https://user-images.githubusercontent.com/81672260/173739057-0cbf3e0a-4a00-4a50-9028-72e39bb38f55.png)

