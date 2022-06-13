## 에제

### 1.In this practice test we will install weave-net POD networking solution to the cluster. Let us first inspect the setup.

We have deployed an application called app in the default namespace. What is the state of the pod?

```
kubectl get po -n default
```

### 2.Inspect why the POD is not running.

```
kubectl describe po app
```
![image](https://user-images.githubusercontent.com/81672260/173266687-8121279a-5830-4cc0-afb9-1659dde9e58a.png)

답 : network connection refused

### 3. Deploy weave-net networking solution to the cluster.클러스터 네트워크 솔루션 배포

Replace the default IP address and subnet of weave-net to the 10.50.0.0/16. Please check the official weave installation and configuration guide which is available at the top right panel.

```
kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')&env.IPALLOC_RANGE=10.50.0.0/16"
```

[weave 설치 링크](https://www.weave.works/docs/net/latest/kubernetes/kube-addon/#-installation)
