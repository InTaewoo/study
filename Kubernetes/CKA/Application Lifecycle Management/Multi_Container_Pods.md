## 예제

### 1. Create a multi-container pod with 2 containers.
Use the spec given below.
If the pod goes into the crashloopbackoff then add the command sleep 1000 in the lemon container.


- Name: yellow
- Container 1 Name: lemon
- Container 1 Image: busybox
 Container 2 Name: gold
- Container 2 Image: redis

```
kubectl run yellow --image=busybox --image=redis --command sleep 1000 --dry-run=client -o yaml > yellow.yaml
vi yellow.yaml
kubectl apply -f yellow.yaml
```
![image](https://user-images.githubusercontent.com/81672260/169929260-6a8b1401-8123-49ad-8f85-412a5273be01.png)

### 2.Inspect the app pod and identify the number of containers in it.
It is deployed in the elastic-stack namespace.

```
kubectl get po
kubectl describe po app -n elastic-stack
```
![image](https://user-images.githubusercontent.com/81672260/169948788-bedbef66-ae1c-4ced-ab06-b8bfc717f860.png)

컨테이너는 app 한개이다.

### 3. The application outputs logs to the file /log/app.log. View the logs and try to identify the user having issues with Login.
Inspect the log file inside the pod.

```
kubectl logs app -n elastic-stack
```

![image](https://user-images.githubusercontent.com/81672260/169949417-fc68f135-e10b-4f25-85fb-09247abd56ef.png)

로그인 관련 이슈는 USER5 이다.

### 4.Edit the pod to add a sidecar container to send logs to Elastic Search. Mount the log volume to the sidecar container.
Only add a new container. Do not modify anything else. Use the spec provided below.


- Name: app
- Container Name: sidecar
- Container Image: kodekloud/filebeat-configured
- Volume Mount: log-volume
- Mount Path: /var/log/event-simulator/
- Existing Container Name: app
- Existing Container Image: kodekloud/event-simulator

![image](https://user-images.githubusercontent.com/81672260/169949715-689b5a01-eec2-4c80-b747-98e673cf4137.png)


```
kubectl get po
kubectl edit po -n elastic-stack
kubectl replace --force -f /tmp/kubectl-edit-1517766217.yaml
```

![image](https://user-images.githubusercontent.com/81672260/169952107-1c4e4495-960d-41c2-97a7-134f2d4397e5.png)

