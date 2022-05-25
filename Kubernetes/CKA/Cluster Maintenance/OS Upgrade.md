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

## cordon
- cordon은 특정 노드를 선택하여 스케줄 대상에서 제외 시킨다. 간단한 Deployment nginx 이미지를 생성해주는 매니페스트 파일을 작성 후 아래와 같이 
cordon 명령을 실행하면 선택한 특정 노드가 SchedulingDisabled 상태가 되는 것을 확인할 수 있다.
![image](https://user-images.githubusercontent.com/81672260/170183047-71bdd431-1f14-4e5f-9267-9fc879da551e.png)

- 이후 scale를 이용하여 deployment nginx의 replicas 개수를 늘려주면 아래 이미지와 같이 cordon 했던 노드에는 pod가 증가하지 않고, 다른 노드에서 증가하는것을 확인할 수 있다.

![image](https://user-images.githubusercontent.com/81672260/170183142-a8b65024-b6dc-45d3-8fe2-204bff16f49f.png)

