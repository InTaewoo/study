## 예제
### 1 How many DaemonSets are created in the cluster in all namespaces?

```
kubectl get daemonset.apps --all-namespaces
```

### 2. On how many nodes are the pods scheduled by the DaemonSet kube-proxy

```
kubectl get ds kube-proxy --namespace=kube-proxy
```
