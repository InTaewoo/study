## Storage Class

## 예제

### 1. What is the Provisioner used for the storage class called portworx-io-priority-high?

```
kubectl get sc
```
![image](https://user-images.githubusercontent.com/81672260/172530850-60b60448-3720-4e03-ad64-8882aa690141.png)


### 2. Let's fix that. Create a new PersistentVolumeClaim by the name of local-pvc that should bind to the volume local-pv.

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

### 3. What is the status of the newly created Persistent Volume Claim?
`kubectl get pvc`
= 현재 pending 상태

### 4.Why is the PVC in a pending state despite making a valid request to claim the volume called local-pv?

`kubectl get po` 확인해 보니 파드가 존재하지 않음.
= A pod consuming the volume is not scheduled.

### 5. Create a new pod called nginx with the image nginx:alpine. The Pod should make use of the PVC local-pvc and mount the volume at the path /var/www/html.

The PV local-pv should in a bound state.

- Pod created with the correct Image?

- Pod uses PVC called local-pvc?

- local-pv bound?

- nginx pod running?

- Volume mounted at the correct path?

`vi nginx.yaml`
name,image,claimName 입력
![image](https://user-images.githubusercontent.com/81672260/172532616-57569f21-121a-4f44-bc1e-41ecb434f59a.png)

### 6. Create a new Storage Class called delayed-volume-sc that makes use of the below specs:

- provisioner: kubernetes.io/no-provisioner
- volumeBindingMode: WaitForFirstConsume

![image](https://user-images.githubusercontent.com/81672260/172533097-0bb1c8b6-fe40-444f-9545-aabeddd7ed86.png)

yaml 구성 파일 생성하여 위와 같이 작성
