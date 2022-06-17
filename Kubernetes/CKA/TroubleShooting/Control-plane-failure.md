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
