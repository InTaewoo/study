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
