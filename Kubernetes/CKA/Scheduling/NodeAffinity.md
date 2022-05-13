## PODs to Nodes
- 노드 어피니티 기능의 주요 목적은 파드가 특정 노드에서 호스팅되도록 하는 것이다.

## Node Affinity Type

### 필수적인 노드 어피니티를 사용해 파드 스케줄하기
- 이 매니페스트는 `disktype:ssd` 라는 `requiredDuringSchedulingIgnoredDuringExecution` 노드 어피니티를 가진 파드를 설명한다.  
파드가 `disktype=ssd` 레이블이 있는 노드에만 스케쥴될 것이라는 것을 의미한다.

```
apiVersion: v1
kind: Pod
metadata:
  name: nginx
spec:
  affinity:
    nodeAffinity:
      requiredDuringSchedulingIgnoredDuringExecution:
        nodeSelectorTerms:
        - matchExpressions:
          - key: disktype
            operator: In
            values:
            - ssd            
  containers:
  - name: nginx
    image: nginx
    imagePullPolicy: IfNotPresent
```

1. 매니페스트를 적용하여 선택한 노드에 스케줄된 파드를 생성한다.  

`kubectl apply -f pod-nginx-preferred-affinity.yaml`

2. 파드가 선택한 노드에서 실행 중인지 확인.
```
kubectl get pods --output=wide
```

## 선호하는 노드 어피니티를 사용해 파드 스케줄하기
- 이 매니페스트는 `disktype: ssd`라는 `preferredDuringSchedulingIgnoredDuringExecution` 노드 어피니티를 가진 파드를 설명한다.  
파드가 `disktype=ssd`레이블이 있는 노드를 선호한다는 것을 의미한다.

```
apiVersion: v1
kind: Pod
metadata:
  name: nginx
spec:
  affinity:
    nodeAffinity:
      preferredDuringSchedulingIgnoredDuringExecution:
      - weight: 1
        preference:
          matchExpressions:
          - key: disktype
            operator: In
            values:
            - ssd          
  containers:
  - name: nginx
    image: nginx
    imagePullPolicy: IfNotPresent
```

1. 매니페스트를 적용하여 선택한 노드에 스케줄된 파드를 생성한다.

```
kubectl apply -f pod-nginx-preferred-affinity.yaml
```

2. 파드가 선택한 노드에서 실행 중인지 확인.
```
kubectl get pods --output--wide
```
## 예제

 ### 1. Set Node Affinity to the deployment to place the pods on node01 only.
 
 ```
 kubectl create deployment blue --image=nginx --replicas=3 --dry-run=client -o yaml > blue.yaml
 vi blue.yaml

 ```
 ![image](https://user-images.githubusercontent.com/81672260/167808212-35d8d67f-ecd9-4949-a1d4-22a9f218db73.png)

위와 같이 affinity부분을 추가해준다.

```
kubectl apply -f blue.yaml
kubectl get deployment.app
```
![image](https://user-images.githubusercontent.com/81672260/167808709-d6a0081c-77ea-4224-bad6-205f7fb66ca1.png)

### 2. Create a new deployment named red with the nginx image and 2 replicas, and ensure it gets placed on the controlplane node only.

Use the label key - node-role.kubernetes.io/master - which is already set on the controlplane node.


- Name: red

- Replicas: 2

- Image: nginx

- NodeAffinity: requiredDuringSchedulingIgnoredDuringExecution

- Key: node-role.kubernetes.io/master

- Use the right operator

```
kubectl create deployment red --image=nginx --replicas=2 --dry-run=client -o yaml > red.yaml
vi red.yaml
kubectl apply -f red.yaml
```

![image](https://user-images.githubusercontent.com/81672260/168190932-975d43e1-9027-4005-82f6-51bd34c0b4ee.png)

```
         nodeAffinity:
           requiredDuringSchedulingIgnoredDuringExecution:
             nodeSelectorTerms:
             - matchExpressions:
               - key: node-role.kubernetes.io/master
                 operator: Exists
``` 
위와 같이 Affinity 부분을 추가해 준다.
