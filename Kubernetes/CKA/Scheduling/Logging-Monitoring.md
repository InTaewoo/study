## Monitor

### Metrics Server
- Heapster은 kubernetes의 모니터링 및 분석 기능을 가능하게 하는 프로젝트 중 하나였다. 지금은 사용하지 X
- kubernetes 클러스터당 하나의 메트릭 서버를 가질 수 있다.
- kubernetes 노드 및 파드의 일부를 집계하여 메모리에 저장한다.
- 메트릭 서버는 메모리 모니터링 솔루션일 뿐 메트릭을 저장하지 않기 때문에 기록 성능 데이터를 볼 수 없다.
- minikube : `minikube addons enable metrics-server`
- others : `git clone https://github.com/kubernetes-incubator/metrics-server.git`

```
kubectl top node
kubectl top pod
```
를 통하여 파드와 노드 성능 모니터링한다.


## 예제

### 1. A user - USER5 - has expressed concerns accessing the application. Identify the cause of the issue. Inspect the logs of the POD

```
kubectl get po
kubectl logs webapp-1
```

![image](https://user-images.githubusercontent.com/81672260/169426467-0b7d2e3a-85f1-4a33-9c61-a0b661d51cd7.png)

### 2. A user is reporting issues while trying to purchase an item. Identify the user and the cause of the issue. Inspect the logs of the webapp in the POD

```
kubectl get po
kubectl logs webapp-2 
kubectl logs webapp-2 simple-webapp
```

![image](https://user-images.githubusercontent.com/81672260/169426689-cee6c693-cf7c-411a-8ea3-cc0de75909c5.png) -> 오류 발생

![image](https://user-images.githubusercontent.com/81672260/169426787-50f670d0-1ce5-41d4-893c-b99a74352e4a.png)

