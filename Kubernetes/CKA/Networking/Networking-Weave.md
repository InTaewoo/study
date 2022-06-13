### 1. What is the Networking Solution used by this cluster?

```
ls /etc/cni/net.d/
```
![image](https://user-images.githubusercontent.com/81672260/173279804-dfb4c9bf-3b59-4310-b020-9838b50ce7c0.png)

### 2.What is the default gateway configured on the PODs scheduled on node01?
Try scheduling a pod on node01 and check ip route output

```
kubectl run busybox --image=busybox --dry-run=client -o yaml -- sleep 1000 > busybox.yaml
kubect create -f busybox.yaml
kubectl exec busybox -- route -n
kubectl exec busybox -- ip route
```
![image](https://user-images.githubusercontent.com/81672260/173282445-041f5716-3c62-486c-89d1-18ff67aec532.png)
