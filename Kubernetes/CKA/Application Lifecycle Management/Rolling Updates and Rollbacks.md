## Rollout and Versioning

- 배포를 처음 생성하면 롤아웃, 새 롤아웃이 트리거 되고 새 배포가 생성된다.

![image](https://user-images.githubusercontent.com/81672260/169448439-f4a53d19-32cc-4fbe-baa5-29d49a1b9ff1.png)

- 새 버전, 새 롤 아웃이 트리거 되고 이에 대한 버전이라는 이름의 새 배포 버전이 생성된다.

## Rollout Command

- 다음 명령 큐브 제어 롤아웃 상태를 실행하여 롤아웃 상태를 볼 수 있다.
```
kubectl rollout status deployment/myapp-deployment
```
![image](https://user-images.githubusercontent.com/81672260/169448640-9d3959dc-856c-484b-8c86-f79da846d3f6.png)

- 배포의 개정과 기록을 보여주는 명령문

```
kubectl rollout history deployment/myapp-deployment
```

## Deployment Startegy
1. 새 버전으로 업그레이드 하는 한 가지의 방법은 모두 삭제 후 새로운 버전 생성. 
문제점 : 이전 버전이 출시된 후 기간동안 다운되고 최신 버전이 업데이트 되기 전에 애플리케이션이 다운되어 사용자가 사용할 수 없다.

2. 한번에 모든 것을 파괴하지 않고 이전 버전을 하나씩 제거하고 올린다. app이 다운되지 않고 원활히 업그레이드 가능.

![image](https://user-images.githubusercontent.com/81672260/169448918-dbdf80f4-46f8-4282-a840-d168b4ff7422.png)

## Recreate vs RollingUpdate

![image](https://user-images.githubusercontent.com/81672260/169449388-72ef3739-3410-41dd-8e12-c6b91ac32912.png)

- Recreate 전략은 복제본이 먼저 0으로 축소된 다음 새 복제본이 축소된다.
- RollingUpdate 전략을 사용하는 경우 이전 복제본 세트가 한 번에 하나씩 축소되었다.

## Rollback
- 업그레이드에 사용한 새 버전의 빌드에 문제가 있을때 업데이트를 롤백한다.
- 배포 이전으로 롤백하여 변경 사항을 취소할 수 있다.
```
kubectl rollout undo deployment/myapp-deployment
```
![image](https://user-images.githubusercontent.com/81672260/169449958-56b56e77-a458-4baf-915b-aba90b21e43d.png)

## Summarize Commands

![image](https://user-images.githubusercontent.com/81672260/169450152-56a055b9-bf14-4ea1-beb2-665f37939954.png)

## 예제

### 1.Let us try that. Upgrade the application by setting the image on the deployment to kodekloud/webapp-color:v2
- Deployment Name: frontend
- Deployment Image: kodekloud/webapp-color:v2

```
kubectl edit deployments.apps frontend
```

![image](https://user-images.githubusercontent.com/81672260/169458341-da05ac98-d401-4124-9ad8-f7a22e136163.png)

### 2.Change the deployment strategy to Recreate Delete and re-create the deployment if necessary. Only update the strategy type for the existing deployment.

- Deployment Name: frontend

- Deployment Image: kodekloud/webapp-color:v2

- Strategy: Recreate

```
kubectl describe deployments.app frontend
```
![image](https://user-images.githubusercontent.com/81672260/169459131-f3d86381-b7d3-4fe1-8c21-c904e331c625.png)
