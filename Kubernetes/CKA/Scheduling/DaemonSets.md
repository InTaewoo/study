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

* 쿠버네티스 [공식 문서](https://kubernetes.io/ko/docs/concepts/workloads/controllers/daemonset/) 참고하여 yaml 수정
```
apiVersion: apps/v1
kind: DaemonSet
metadata:
  name: fluentd-elasticsearch
  namespace: kube-system
  labels:
    k8s-app: fluentd-logging
spec:
  selector:
    matchLabels:
      name: fluentd-elasticsearch
  template:
    metadata:
      labels:
        name: fluentd-elasticsearch
    spec:
      tolerations:
      # this toleration is to have the daemonset runnable on master nodes
      # remove it if your masters can't run pods
      - key: node-role.kubernetes.io/master
        operator: Exists
        effect: NoSchedule
      containers:
      - name: fluentd-elasticsearch
        image: quay.io/fluentd_elasticsearch/fluentd:v2.5.2
        resources:
          limits:
            memory: 200Mi
          requests:
            cpu: 100m
            memory: 200Mi
        volumeMounts:
        - name: varlog
          mountPath: /var/log
        - name: varlibdockercontainers
          mountPath: /var/lib/docker/containers
          readOnly: true
      terminationGracePeriodSeconds: 30
      volumes:
      - name: varlog
        hostPath:
          path: /var/log
      - name: varlibdockercontainers
        hostPath:
          path: /var/lib/docker/containers
```
