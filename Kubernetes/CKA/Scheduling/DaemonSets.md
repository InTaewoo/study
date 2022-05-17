## 예제
### 1 How many DaemonSets are created in the cluster in all namespaces?

```
kubectl get daemonset.apps --all-namespaces
```

### 2. On how many nodes are the pods scheduled by the DaemonSet kube-proxy

```
kubectl get ds kube-proxy --namespace=kube-proxy
```

## 3. Deploy a DaemonSet for FluentD Logging. Use the given specifications.

```
kubectl create deployment elasticsearch -n=kube-system --image=k8s.gcr.io/fluentd-elasticsearch:1.20 --dry-run=client -o yaml > elasticsearch.yaml
vi elasticsearch.yaml
```
![image](https://user-images.githubusercontent.com/81672260/168709361-af605c4e-801a-487b-96ff-fdc45b954a25.png)

에서

Deployment -> Daemonset, replicas=1 , strategy: {} ,  status: {} 삭제


![image](https://user-images.githubusercontent.com/81672260/168710334-1ce085fa-d5cd-4d28-bf9f-d2006e0932f0.png)

