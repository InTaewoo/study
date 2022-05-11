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

