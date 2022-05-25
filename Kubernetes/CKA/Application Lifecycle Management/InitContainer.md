# 초기화 컨테이너

## 초기화 컨테이너 이해하기
파드는 앱들을 실행하는 다수의 컨테이너를 포함할 수 있고, 또한 앱 컨테이너 실행 전에 동작되는 하나 이상의 초기화 컨테이너도 포함할 수 있다.

- 초기화 칸테이너는 항상 완료를 목표로 실행ㅎ된다.
- 각 초기화 컨테이너는 다음 초기화 컨테이너가 시작되기 전까지 성공적으로 완료되어야 한다.

만약 파드의 초기화 컨테이너가 실패하면, kubelet은 초기화 컨테이너가 성공할 때까지 반복적으로 재시작한다. 그러나, 만약 파드의 restartPolicy 를 절대 하지 않음(Never)으로 
설정하고, 해당 파드를 시작하는 동안 초기화 컨테이너가 실패하면, 쿠버네티스는 전체 파드를 실패한 것으로 처리한다.

## 사용 중인 초기화 컨테이너
쿠버네티스 1.5에 대한 다음의 yaml 파일은 두 개의 초기화 컨테이너를 포함한 간단한 파드에 대한 개요를 보여준다. 
첫 번째는 myservice 를 기다리고 두 번째는 mydb 를 기다린다. 두 컨테이너들이 완료되면, 파드가 시작될 것이다.

```
apiVersion: v1
kind: Pod
metadata:
  name: myapp-pod
  labels:
    app: myapp
spec:
  containers:
  - name: myapp-container
    image: busybox:1.28
    command: ['sh', '-c', 'echo The app is running! && sleep 3600']
  initContainers:
  - name: init-myservice
    image: busybox:1.28
    command: ['sh', '-c', "until nslookup myservice.$(cat /var/run/secrets/kubernetes.io/serviceaccount/namespace).svc.cluster.local; do echo waiting for myservice; sleep 2; done"]
  - name: init-mydb
    image: busybox:1.28
    command: ['sh', '-c', "until nslookup mydb.$(cat /var/run/secrets/kubernetes.io/serviceaccount/namespace).svc.cluster.local; do echo waiting for mydb; sleep 2; done"]
  ```
  
  
## 예제

### 1. Identify the pod that has an initContainer configured.
```
kubectl describe po
```
![image](https://user-images.githubusercontent.com/81672260/170159780-e09d8a49-8008-4e62-a8bc-e6e8a3589d6b.png)

답 : blue

### 2. What is the image used by the initContainer on the blue pod?

```
k describe po blue
```
![image](https://user-images.githubusercontent.com/81672260/170159915-570f724a-2891-400b-bf8d-597a1bdbeaf5.png)

답 : busybox

  
### 3. How long after the creation of the POD will the application come up and be available to users?

```
k describe po purple
```

![image](https://user-images.githubusercontent.com/81672260/170160166-2486bd8b-a4eb-4b7e-a40b-d7d889802cf1.png)

답 : 600초 + 1200초 = 30Minutes

### 4.Update the pod red to use an initContainer that uses the busybox image and sleeps for 20 seconds
Delete and re-create the pod if necessary. But make sure no other configurations change.
CheckCompleteIncomplete

- Pod: red
- initContainer Configured Correctly

```
kubectl edit po red
kubectl replace --force -f /tmp/kubectl-edit-2173215379.yaml
kubectl get po
```

### 5. A new application orange is deployed. There is something wrong with it. Identify and fix the issue.
Once fixed, wait for the application to run before checking solution.

```
k get po orange
k edit po orange
kubectl replace --force -f /tmp/kubectl-edit-1597896501.yaml
```

![image](https://user-images.githubusercontent.com/81672260/170162756-a3aefd3a-6c66-4f4f-9cc9-dc649a7cd918.png)

