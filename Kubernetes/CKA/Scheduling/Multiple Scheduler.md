## 예제

### 1. What is the name of the POD that deploys the default kubernetes scheduler in this environment?

```
kubectl get po -A
```
![image](https://user-images.githubusercontent.com/81672260/168991720-9eb59abf-7776-41b9-b158-0bfec0ce27ba.png)

### 2. What is the image used to deploy the kubernetes scheduler? Inspect the kubernetes scheduler pod and identify the image

```
kubectl describe po kube-scheduler-controlplane -n kube-system
```

![image](https://user-images.githubusercontent.com/81672260/168992183-a3421ac6-a21b-4c6e-a63b-f3321b0ac76d.png)

### 3.Let's create a configmap that the new scheduler will employ using the concept of ConfigMap as a volume. Create a configmap with name my-scheduler-config using the content of file /root/my-scheduler-config.yaml

```
kubectl create configmap my-scheduler-config -n kube-system --from-file /root/my-scheduler-config.yaml
```

### 4.Deploy an additional scheduler to the cluster following the given specification. Use the manifest file provided at /root/my-scheduler.yaml. Use the same image as used by the default kubernetes scheduler.
- Name: my-scheduler
- Status: Running
- Correct image used?

```
vi my-scheduler.yaml
kubectl get po -A
kubectl describe po kube-scheduler-controlplane -n kube-system
vi my-scheduler.yaml
kubectl apply -f my-scheduler.yaml
```

![image](https://user-images.githubusercontent.com/81672260/168994192-e5310392-330b-4060-9082-e49fa268038a.png)

![image](https://user-images.githubusercontent.com/81672260/168995847-9a3a343a-5f55-45f6-b104-f6e555ac2ffc.png)

![image](https://user-images.githubusercontent.com/81672260/168996018-10492d6c-317c-477c-861e-dcdd30f79f3b.png) image를복사

![image](https://user-images.githubusercontent.com/81672260/168996209-e5a36169-0177-4237-bc25-2f620c0d740b.png) image 붙여넣기

![image](https://user-images.githubusercontent.com/81672260/168996574-ffd6cafb-8f43-4c52-aa22-6c569779a659.png)


## 5.A POD definition file is given. Use it to create a POD with the new custom scheduler. File is located at /root/nginx-pod.yaml

- Uses custom scheduler

- Status: Running

* 커스텀 스케줄러를 사용하여 nginx-pod를 정의

```
vi /root/nginx-pod.yaml -> 스케줄러 이름을 추가해줘야 한다
kubectl apply -f nginx-pod.yaml 
kubectl get po -A
```

![image](https://user-images.githubusercontent.com/81672260/168998097-17c28060-6f04-48e0-b2a7-53be30e8f300.png)
다음과 같이 `schedulerName: my-scheduler`을 추가해준다


![image](https://user-images.githubusercontent.com/81672260/168998566-c60af27c-11a8-4e19-b42c-8f467892f9eb.png)



