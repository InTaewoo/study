## 스태틱(static) 파드 생성하기
- 스태틱 파드는 API 서버 없이 특정 노드에 있는 kubelet 데몬에 의해 직접 관리된다. 컨트롤 플레인에 의해 관리되는 파드(ex Deplyment)와는 다르게,
kubelet 이 각각의 스태틱 파드를 감시한다. (만약 실패할 경우 다시 구동)
- 스태틱 파드는 항상 특정 노드에 있는 하나의 kubelet에 매여 있다.
- Kubelet 은 각각의 스태틱 파드에 대하여 쿠버네티스 API 서버에서 미러 파드(mirror pod)를 생성하려고 자동으로 시도한다.
- 즉, 노드에서 구동되는 파드는 API 서버에 의해서 볼 수 있지만, API 서버에서 제어될 수는 없다.

## 스태틱 파드 생성하기

1. 스태틱 파드를 실행할 노드를 선택한다. 이 예제에서는 `my-model`이다.
2.  /etc/kubelet.d 와 같은 디렉터리를 선택하고 웹 서버 파드의 정의를 해당 위치에, 예를 들어 /etc/kubelet.d/static-web.yaml 에 배치한다.

```
mkdir /etc/kubelet.d/
cat <<EOF  > /etc/kubelet.d/static-web.yaml

apiVersion: v1
kind: Pod
metadata:
  name: static-web
  labels:
    role: myrole
spec:
  containers:
    - name: web
      image: nginx
      ports:
        - name: web
          containerPort: 80
          protocol: TCP
EOF
```

3. 노드에서 kubelet 실행 시에 --pod-manifest-path=/etc/kubelet.d/ 와 같이 인자를 제공하여 해당 디렉터리를 사용하도록 구성한다. Fedora 의 경우 이 줄을 포함하기 위하여 /etc/kubernetes/kubelet 파일을 다음과 같이 수정한다.

```
KUBELET_ARGS="--cluster-dns=10.254.0.10 --cluster-domain=kube.local --pod-manifest-path=/etc/kubelet.d/"
```
혹은 kubelet 구성 파일에 `staticPodPath: <the directory>`를 추가한다.

4. kubelet을 재시작한다.
```
systemctl restart kubelet
```

## 예제

### 1. How many static pods exist in this cluster in all namespaces?

```
kubectl get po -A
kubectl get po kube-apiserver-controlplane -n kube-system -o yaml : yaml 파일로 열어서 kind를 확인
```

![image](https://user-images.githubusercontent.com/81672260/168933913-f57cd0f8-d186-4331-8807-3547d82149bc.png)

- 파드 이름 중 -controlplane 이 들어가는 파드가 static pod 이다.
- 자세히 확인해 보려면 하나씩 파드를 열어본다.

### 2. What is the path of the directory holding the static pod definition files?
```
cat /var/lib/kubelet/config.yaml
```
![image](https://user-images.githubusercontent.com/81672260/168935323-8a891795-a617-4a06-a0b4-2a81db20cb65.png)

staticPodPath: /etc/kubernetes/manifests가 있다

### 3.How many pod definition files are present in the manifests folder?

```
cd /etc/kubernetes/manifests
ls
```

### 4.Create a static pod named static-busybox that uses the busybox image and the command sleep 1000

```
cd /etc/kubernetes/manifests/ 경로로 이동

kubectl run static-busybox --image=busybox --dry-run=client -o yaml --command -- sleep 1000 > static-busybox.yaml  : command 명령문은 항상 마지막에 실행
kubectl get po
```
![image](https://user-images.githubusercontent.com/81672260/168959964-695c6d4c-5e77-4f9c-b560-1ffaeec4a77c.png)

![image](https://user-images.githubusercontent.com/81672260/168959928-77777bef-f621-453f-ada4-00bcfb2e20dd.png)

### 5. We just created a new static pod named static-greenbox. Find it and delete it.

```
kubectl get po 
kubectl delete po static-greenbox-node01 -> 삭제 불가능, 매니테스트 경로에 가서 yaml 파일 삭제을 해야 함.
```
![image](https://user-images.githubusercontent.com/81672260/168963915-763ad638-9866-4aa0-8141-af0e453a524e.png)

- yaml 파일 찾기

```
cat /var/lib/kubelet/config.yaml
```
![image](https://user-images.githubusercontent.com/81672260/168964068-b32f8cc1-19a6-4764-8fa6-2812d9216d03.png)

![image](https://user-images.githubusercontent.com/81672260/168964108-06c01d0e-1f82-4e13-8366-3b20687fa1ed.png)
하지만 경로에 들어가보니 `static-greenbox` yaml파일이 없음. -> 노드에 접속하여 확인

```
kubectl get no -o wide
ssh 10.6.187.9
cat /var/lib/kubelet/config.yaml
cd /etc/just-to-mess-with-you
ls
rm greenbox.yaml
kubectl get po
```

![image](https://user-images.githubusercontent.com/81672260/168964249-6cc75688-d71b-4186-979c-8249ec8f7fdd.png)

![image](https://user-images.githubusercontent.com/81672260/168964360-f555790d-7042-41cb-b39e-f32c7aaaa44b.png)

![image](https://user-images.githubusercontent.com/81672260/168964613-68445e76-3bd7-4a2f-ba89-9e071714eeae.png)

삭제된 걸 확인
