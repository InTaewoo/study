## Persistent Volumes Claims
![image](https://user-images.githubusercontent.com/81672260/172314866-73dfd77a-5497-475b-a289-dc60d7718068.png)
- 영구 볼륨 클레임이 생성되면 Kubernetes는 영구 볼륨을 클레임 기반 클레임에 바인딩한다.

![image](https://user-images.githubusercontent.com/81672260/172317363-ab4b62c4-b606-4d72-bbe9-74c899481ab0.png)

- 특정 볼륨을 특별히 사용하려면 labels과 Selector을 사용하여 오른쪽에 바인딩할 수 있다.
- 다른 모든 기준이 일치하는 경우 더 작은 클레임이 더 큰 볼륨에 바인딩될 수 있다.

### Create Persistent Volume Claim

![image](https://user-images.githubusercontent.com/81672260/172318637-5966c709-aaa9-41ad-ac05-5696d2290640.png)

pvc-definition.yaml
1. v1에 대한 API버전과 영구 볼륨 클레임에 종류가 있는 빈 템플릿으로 시작.
2. `metadata`에선 이름을 `myclaim`으로 명명한다.
3. `spec`에선 `accessModes`를 추가하고 `ReadWriteOnce`를 입력한다.
4. `resources`는 500Mi를 요청한다.

```
kubectl create -f pvc-definition.yaml
kubectl get persistentvolumeclaim
````

### PVC VS PV 

![image](https://user-images.githubusercontent.com/81672260/172319213-20126dac-1f3a-4689-b7b5-d0fbb4c70a00.png)

- 클레임이 생성되면 kubernetes는 이전에 생성된 볼륨을 확인한다. accessModes가 일치.
- pvc 용량은 500MI pv용량은 1Gi
- `kubectl create -f pvc-definition.yaml`을 실행하면 pvc가 pv에 바인딩된다.

### View PVC

![image](https://user-images.githubusercontent.com/81672260/172319627-f0fc9370-e980-4e6c-99ef-17a6620159b5.png)

`kubectl get persistentvolumeclaim`
- 불륨 가져오기 명령을 다시 실행하면 영구 볼륨 클레임이 영구 볼륨에 바인딩된다.

### Delete PVC

![image](https://user-images.githubusercontent.com/81672260/172320002-e3cfbc5e-fa99-4da0-ba95-cb7300cded4b.png)

`kubectl delete persistentvolumeclaim myclaim`
pvc는 삭제되지만 pv는 유지된다.

`persistentVolumeReclaimPolicy: Recycle` : 이 경우 데이터 볼륨의 데이터는 다른 클레임에서 사용할 수 있도록 스크러빙된다.


## 문제 예시
### 1. Configure a volume to store these logs at /var/log/webapp on the host.
Use the spec provided below.

- Name: webapp

- Image Name: kodekloud/event-simulator

- Volume HostPath: /var/log/webapp

- Volume Mount: /log

```
kubectl get po
kubectl edit po webapp
kubectl replace --force -f /tmp/kubectl-edit-2563353141.yaml
```
![image](https://user-images.githubusercontent.com/81672260/172509265-cb9537ac-7ff6-47f3-a9bf-9650d609009c.png)
![image](https://user-images.githubusercontent.com/81672260/172509370-7e23a0f5-9556-42ae-b19f-ef3123cda547.png)

### 2. Create a Persistent Volume with the given specification.

- Volume Name: pv-log

- Storage: 100Mi

- Access Modes: ReadWriteMany

- Host Path: /pv/log

- Reclaim Policy: Retain

코드는 [공식홈페이지](https://kubernetes.io/docs/concepts/storage/persistent-volumes/)에서 가져온다

```
vi pv-log.yaml
kubectl apply -f pv-log.yaml
```

![image](https://user-images.githubusercontent.com/81672260/172509831-99ca0202-3ea8-4287-a7f4-cb430791e3c9.png)

### 3. Let us claim some of that storage for our application. Create a Persistent Volume Claim with the given specification.

- Volume Name: claim-log-1

- Storage Request: 50Mi

- Access Modes: ReadWriteOnce

```
vi claim-log-1
kubectl apply -f claim-log-1
```
![image](https://user-images.githubusercontent.com/81672260/172510435-dc44d004-e8d1-4185-a6a8-fa415495437e.png)

### 4.What is the state of the Persistent Volume Claim?
`kubectl get pvc` 
= pending

### 5. What is the state of the Persistent Volume?
`kubectl get pv`
= Available

### 6. Why is the claim not bound to the available Persistent Volume?
= AccessMode가 다르기 때문에 bound되지 않았다.

### 7.Update the Access Mode on the claim to bind it to the PV.
Delete and recreate the claim-log-1.
pvc claim-log-1을 지우고 AccessMode를 같게 변경

![image](https://user-images.githubusercontent.com/81672260/172510973-69b9008e-f374-4f12-be20-031f375615f3.png)

- accesMode에서 ReadWriteOnce를 ReadWriteMany로 수정

