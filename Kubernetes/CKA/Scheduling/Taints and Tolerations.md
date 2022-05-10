## 테인트(Taint)와 톨러레이션(Toleration)

kubectl taint를 사용하여 노드에 테인트을 추가한다. 예를 들면 다음과 같다.  
`
kubectl taint nodes node1 key1=value1:NoSchedule
`
## 테인트 제거

`
kubectl taint nodes node1 key1=value1:NoSchedule-
`
