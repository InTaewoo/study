## Control-plane-failure - 컨트롤 플레인 오류

### 1. The cluster is broken. We tried deploying an application but it's not working. Troubleshoot and fix the issue.
Start looking at the deployments.

![image](https://user-images.githubusercontent.com/81672260/174231678-9ddec2be-58b6-466a-ae9b-4bab00514a99.png)

Deployment가 작동을 안하여 파드를 확인해 보니 준비 상태가 아니였다.
마스터 노드에 있는 kube-scheduler-controlplane에 오류가 생김.

```
kubectl describe po kube-scheduler-controlplane -n kube-system

```
![image](https://user-images.githubusercontent.com/81672260/174231871-71b94521-9a57-4d60-9128-8a938a788ea0.png)

```
cat /etc/kubernetes/manifests/kube-scheduler.yaml
에 확인을 해보니 kube-schuler 오타 표기
```

![image](https://user-images.githubusercontent.com/81672260/174232103-e73ccc85-2bbb-486c-9dfa-8f0c3f163fd7.png)

### 2. Scale the deployment app to 2 pods.

![image](https://user-images.githubusercontent.com/81672260/174232806-775a71ae-b960-4628-b5b7-8e2c2abfdfb4.png)

app의 파드를 2개로 늘리기
```
kubectl scale deployment app --replicas=2
```

![image](https://user-images.githubusercontent.com/81672260/174232969-9d3f2f37-fcba-48cb-9d8e-897c10d711be.png)
파드가 2개로 늘어났지만 작동을 안함

### 3. Even though the deployment was scaled to 2, the number of PODs does not seem to increase. Investigate and fix the issue.
Inspect the component responsible for managing deployments and replicasets.

![image](https://user-images.githubusercontent.com/81672260/174233931-3b71daa8-5297-4be0-b16f-15fafc70ae37.png)

`kube-controller-manager-controlplane`가 작동을 안함.

```
kubectl describe po kube-controller-manager-controlplane -n kube-system
```
해당 파드의 이벤트를 확인해 보니 문제는 없어보임.

![image](https://user-images.githubusercontent.com/81672260/174234372-01e5c8d8-a01d-4d8d-9bc2-63394181c570.png)

```
kubectl logs kube-controller-manager-controlplane -n kube-system
를 통해 로그 확인 결과 파일이나 폴더에 문제가 발생함.
```
![image](https://user-images.githubusercontent.com/81672260/174234200-3ae81950-c647-4d1e-aaf3-5e9cbb4323f9.png)

```
kubectl logs kube-controller-manager-controlplane -n kube-system
```

![image](https://user-images.githubusercontent.com/81672260/174240907-f0c02dca-7dbc-450b-bdbb-a87cd1e0dc4f.png)
에서 -XXXX 삭제




