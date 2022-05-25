## Operating System Upgrade


하나의 파드가 죽었을 때

- 워커 노드가 다른 노드로 이동되도록 모든 워커노드의 노도를 의도적으로 옮길 수 있다.
- 파드는 자신이 있는 노드에서 정상적으로 종료되고 다른 노드에서 다시 생성된다.
- 파드가 다른 노드에서 안전하므로 첫 번째 노드를 재부팅할 수 있다. 
![image](https://user-images.githubusercontent.com/81672260/170164576-a4eafe7e-067a-4f4b-bb3e-1380c20c5c98.png)

```
kubectl drain node-1
kubectl coredon node-2
kubectl uncordon node-1
```
