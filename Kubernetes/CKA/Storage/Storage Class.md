## Storage Class

## 예제

### What is the Provisioner used for the storage class called portworx-io-priority-high?

```
kubectl get sc
```
![image](https://user-images.githubusercontent.com/81672260/172530850-60b60448-3720-4e03-ad64-8882aa690141.png)


### Let's fix that. Create a new PersistentVolumeClaim by the name of local-pvc that should bind to the volume local-pv.

Inspect the pv local-pv for the specs.

- PVC: local-pvc

- Correct Access Mode?

- Correct StorageClass Used?

- PVC requests volume size = 500Mi?

```
vi local-pvc.yaml
kubectl apply -f local-pvc.yaml
```
![image](https://user-images.githubusercontent.com/81672260/172531556-96b48935-7c22-409f-b87c-7e0ff00a736f.png)


