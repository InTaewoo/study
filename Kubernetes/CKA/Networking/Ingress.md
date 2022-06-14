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


