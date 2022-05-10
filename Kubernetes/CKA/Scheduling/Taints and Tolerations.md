## 테인트(Taint)와 톨러레이션(Toleration)

kubectl taint를 사용하여 노드에 테인트을 추가한다. 예를 들면 다음과 같다.  
`
kubectl taint nodes node1 key1=value1:NoSchedule
`
## 테인트 제거

`
kubectl taint nodes node1 key1=value1:NoSchedule-
`

PodSpec에서 파드에 대한 톨러레이션를 지정한다. 다음의 톨러레이션은 위의 kubectl taint 라인에 의해 생성된 테인트와 "일치"하므로, 어느 쪽 톨러레이션을 가진 파드이던 node1 에 스케줄 될 수 있다.  
```
tolerations:
- key: "key1"
  operator: "Equal"
  value: "value1"
  effect: "NoSchedule"
 ```
 
 ### 예시
 
```
apiVersion: v1
kind: Pod
metadata:
  name: nginx
  labels:
    env: test
spec:
  containers:
  - name: nginx
    image: nginx
    imagePullPolicy: IfNotPresent
  tolerations:
  - key: "example-key"
    operator: "Exists"
    effect: "NoSchedule"
```

지정하지 않으면 `operator`의 기본값은 `Equal`이다.


## 문제 예시 
- Create a taint on node01 with key of spray, value of mortein and effect of NoSchedule

```
kubectl taint nodes node01 spray=mortein:NoSchedule
```

