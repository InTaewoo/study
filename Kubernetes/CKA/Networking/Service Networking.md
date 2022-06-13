## 예제 

### 1. What network range are the nodes in the cluster part of?

`ip a`
![image](https://user-images.githubusercontent.com/81672260/173305914-07d0e031-39d3-4f83-8492-c6713a293ada.png)

### 2. What is the range of IP addresses configured for PODs on this cluster?
파드에서의 IP범위

```
kubectl get po -n kube-system
kubectl logs weave-net-qfxwd weave -n kube-system
```

![image](https://user-images.githubusercontent.com/81672260/173307617-f78a9d1b-249f-40c2-84db-1ea243fd053e.png)

![image](https://user-images.githubusercontent.com/81672260/173307667-8486cbbe-0464-4d26-a0e0-eeb6928d24f7.png)

### 3. What is the IP Range configured for the services within the cluster?
서비스에서의 IP범위

```
cat /etc/kubernetes/manifests/kube-apiserver.yaml
```

![image](https://user-images.githubusercontent.com/81672260/173308565-dbb9a054-f036-4a06-aa54-bfa486fc41d5.png)

### 4. How many kube-proxy pods are deployed in this cluster?
```
kubectl get po -n kube-system
```
![image](https://user-images.githubusercontent.com/81672260/173309332-81469fe8-8ed0-4e2f-a325-0171dda16797.png)


### 5.What type of proxy is the kube-proxy configured to use?
```
kubectl get po -n kube-system
kubectl logs kube-proxy-d6hsh -n kube-system
```


![image](https://user-images.githubusercontent.com/81672260/173310681-b5678e1b-1c15-4f2a-ab14-851cb5cbd9ec.png)

### 6.How does this Kubernetes cluster ensure that a kube-proxy pod runs on all nodes in the cluster?
Inspect the kube-proxy pods and try to identify how they are deployed

```
kubectl get ds -n kube-system
```
![image](https://user-images.githubusercontent.com/81672260/173311207-febb53d1-8593-41b6-b77d-3088642635e0.png)

