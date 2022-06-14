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

