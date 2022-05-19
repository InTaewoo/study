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
