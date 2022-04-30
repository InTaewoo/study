## Certification Tip

### Create an NGINX Pod

```
kubectl run nginx --image=nginx
```

## yaml파일을 만드는 법

### Generate POD Manifest YAML file (-o yaml). Don't create it(--dry-run)

```
kubectl run nginx --image=nginx --dry-run=client -o yaml
```

### Create a deployment

```
kubectl create deployment --image=nginx nginx
```

### Generate Deployment YAML file (-o yaml). Don't create it(--dry-run)

```
kubectl create deployment --image=nginx nginx --dry-run=client -o yaml
```

### Generate Deployment YAML file (-o yaml). Don't create it(--dry-run) with 4 Replicas (--replicas=4)

- Replicas가 4인 Deployment yaml을 생성(파일명 : nginx-deployment.yaml)


```
kubectl create deployment --image=nginx nginx --dry-run=client -o yaml > nginx-deployment.yaml
```
### 파일을 생성 후 deployment파일 create하기
```
kubectl create -f nginx-deployment.yaml
```

### In k8s version 1.19+, we can specify the --replicas option to create a deployment with 4 replicas. 한번에 파일을 만들고 create하기

```
kubectl create deployment --image=nginx nginx --replicas=4 --dry-run=client -o yaml > nginx-deployment.yaml
```
