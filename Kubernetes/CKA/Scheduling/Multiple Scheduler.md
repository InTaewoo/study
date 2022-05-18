## 예제

### 1. What is the name of the POD that deploys the default kubernetes scheduler in this environment?

```
kubectl get po -A
```
![image](https://user-images.githubusercontent.com/81672260/168991720-9eb59abf-7776-41b9-b158-0bfec0ce27ba.png)

## 2. What is the image used to deploy the kubernetes scheduler? Inspect the kubernetes scheduler pod and identify the image

```
kubectl describe po kube-scheduler-controlplane -n kube-system
```

![image](https://user-images.githubusercontent.com/81672260/168991908-f0a989f2-3168-4e47-ac21-6be76ee68ad5.png)
