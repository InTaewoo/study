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

## uncordon
- SchedulingDisabled를 해제하고 싶다면 uncordon을 사용하시면 된다. (아래 drain에서도 마찬가지다.)
![image](https://user-images.githubusercontent.com/81672260/170183266-6bfb88ec-68eb-4b77-b202-186bd768df6b.png)

## drain
- drain은 cordon이랑 똑같이 동작하지만, SchedulingDisabled된 노드에 남아있는 Pod를 모두 삭제하고 재생성 하는 등의 기능이 추가된 것.
- kubectl drain [노드네임] --ignore-daemonsets 을 입력하면 아래와 이미지와 같이 실행이 됩니다. 참고로 선택하는 노드는 SchedulingDisabled가 될 노드 이다.

* 참고로 --ignore-daemonsets 옵션을 추가해주지 않고 drain을 사용하게 되면 아래와 같이 에러가 발생 합니다. daemonsets은 각 노드들에 하나씩 실행되기 때문에 다른 노드로 옮기수가 없어 발생하는 에러 입니다. 


## 예제

### 1. We need to take node01 out for maintenance. Empty the node of all applications and mark it unschedulable.

- Node node01 Unschedulable
- Pods evicted from node01

```
k get po -o wide
k cordon node01
k drain node01 --ignore-daemonsets
k get no
```

![image](https://user-images.githubusercontent.com/81672260/170185546-50473374-74de-4927-81a0-7d83996b9fda.png)


### 2. The maintenance tasks have been completed. Configure the node node01 to be schedulable again.
- Node01 is Schedulable

```
k get no
k uncordon node01
k get no
```

![image](https://user-images.githubusercontent.com/81672260/170185822-5adf6b6c-76b3-488c-8d3f-b51d8992f088.png)

### 3.hr-app is a critical app and we do not want it to be removed and we do not want to schedule any more pods on node01.
Mark node01 as unschedulable so that no new pods are scheduled on this node.
Make sure that hr-app is not affected.

- Node01 Unschedulable
- hr-app still running on node01?

```
k cordon node01
```

