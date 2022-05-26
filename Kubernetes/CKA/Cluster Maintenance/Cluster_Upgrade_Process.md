## Version

![image](https://user-images.githubusercontent.com/81672260/170191288-25c10aa9-8e1f-4883-946d-f81e3fffd954.png)

- ETCD 클러스트와 CoreDNS는 구성 요소가 다르기 때문에 버전이 달라도 상관없다.

![image](https://user-images.githubusercontent.com/81672260/170191496-936c0823-bff2-497b-b445-6502ecb07f5c.png)

- 다른 구성 요소 중 어느 것도 kube-apiserver보다 높은 버전이면 안된다.
- Controller-manager, kube-scheduler는 한 버전 더 낮을 수 있다.


예시)
![image](https://user-images.githubusercontent.com/81672260/170191769-2bc167c2-7325-4f73-8d02-67500353a84d.png)

필요한 경우 구성 요소별로 업그레이들할 수 있다.

- 쿠버네티스는 최신 3개의 버전만 지원한다.
- ex) V1.12일 경우 v1.12, v1,11, v1,10 만 지원
- v1.13이 출시될 경우 업그레이드를 해줘야 한다.


## [버전 업그레이드 방법](https://v1-20.docs.kubernetes.io/docs/tasks/administer-cluster/kubeadm/kubeadm-upgrade/)

![image](https://user-images.githubusercontent.com/81672260/170192340-b0150260-469f-4fd8-b066-fd1827a79b9c.png)

- 한번에 업그레이하는 것이 아니라 1.10에서 1.11로, 1.11에서 1.12로 1.12에서 1.13으로 한다.
- 업그레이드 프로세스는 클러스터 설정 방법에 따라 다르다.
- 마스터노드 업그레이드 후 워커 노드 업그레이드


## kubeadm - upgrade

### 마스터 노드 업그레이드

```

kubecadm upgrade plan
apt-get upgrade -y kubeadm=1.12.0-00
kubeadm upgrade apply v1.12.0
systemctl restart kubelet
```

### 워커 노드 업그레이드

![image](https://user-images.githubusercontent.com/81672260/170194244-f00cf705-f5c2-4e71-9eb6-5f49a93ab456.png)


```
kubectl drain node-1  : 첫 번째 워커 노드에서 다른 워커 노드로 이동해야 한다.
apt-get upgrade -y kubeadm=1.12.0-00  : 마스터 노드와 같이 워커 노드에서 패키지를 업그레이드
apt-get upgrade -y kubelet=1.12.0-00 
kubeadm upgrade node config --kubelet-version v1.12.0 : 새 kubelet 버전에 대한 노드 구성을 업그레이드
systemctl restart kubelet  : kubelet 재 시작
kubectl uncordon node-1
```

## 예제1 - 마스터노드 업그레이드

### 0. 노드 비우기 (SchdeulingDisabled 상태로 변경)

```
kubectl drain controlplane --ignore-daemonsets
```


### 1. 운영체제 확인

```
cat /etc/*release*
```

### 2. 업그레이드할 버전 결정 (찾기)
```
apt update
apt-cache madison kubeadm
# find the latest 1.20 version in the list
# it should look like 1.20.x-00, where x is the latest patch
```
### 3. 컨트롤 플레인(마스터) 노드 업그레이드

```
apt-get --version 
# replace x in 1.20.x-00 with the latest patch version
apt-mark unhold kubeadm && \
apt-get update && apt-get install -y kubeadm=1.20.x-00 && \
apt-mark hold kubeadm
-
# apt-get 버전이 1.1 이상이면 이 방법으로
apt-get update && \
apt-get install -y --allow-change-held-packages kubeadm=1.20.x-00

x = 설치할 버전에 따라 변경

kubeadm version   -- 버전 확인

kubeadm upgrade plan -- 업그레이드 계획 확인

# replace x with the patch version you picked for this upgrade   -- 업그레이드할 버전을 선택하고 적절한 명령을 실행합니다
sudo kubeadm upgrade apply v1.20.x

```

### 4. kubelet 및 kubectl 업그레이드 

```
    # 1.20.x-00의 x를 최신 패치 버전으로 교체
    apt-mark unhold kubelet kubectl && \
    apt-get 업데이트 && apt-get 설치 -y kubelet=1.20.x-00 kubectl=1.20.x-00 && \
    apt-mark 홀드 kubelet kubectl
    -
    # apt-get 버전 1.1부터 다음 방법을 사용할 수도 있습니다.
    
    apt-get update && \
    apt-get install -y --allow-change-held-packages kubelet=1.20.x-00 kubectl=1.20.x-00
```

### 5. 재시작 및 업그레이드 됐는지 확인

```
sudo systemctl daemon-reload   -- 재시작
sudo systemctl restart kubelet
```

![image](https://user-images.githubusercontent.com/81672260/170398826-4c80bd8c-e57e-472b-a2b8-b36712586687.png)


## 6. Mark the controlplane node as "Schedulable" again
```
kubectl uncordon controlplane
```

## 예제2 - 워커 노드 업그레이드

### 0. 노드 비우기 (SchdeulingDisabled 상태로 변경)

```
kubectl get no
kubectl drain node01 --ignore-daemonsets
```

### 1. ssh로 워커 노드에 접속
```
kubectl get no -o wide
ssh 10.62.28.9
```
### 2. 업그레이드

```
# replace x in 1.20.x-00 with the latest patch version
apt-mark unhold kubeadm && \
apt-get update && apt-get install -y kubeadm=1.20.x-00 && \
apt-mark hold kubeadm
-
# since apt-get version 1.1 you can also use the following method
apt-get update && \
apt-get install -y --allow-change-held-packages kubeadm=1.20.x-00
```
### 3. "kubeadm 업그레이드" 호출

```
sudo kubeadm upgrade node
```


### 4. kubelet 및 kubectl 업그레이드 

```
# replace x in 1.20.x-00 with the latest patch version
apt-mark unhold kubelet kubectl && \
apt-get update && apt-get install -y kubelet=1.20.x-00 kubectl=1.20.x-00 && \
apt-mark hold kubelet kubectl
-
# since apt-get version 1.1 you can also use the following method
apt-get update && \
apt-get install -y --allow-change-held-packages kubelet=1.20.x-00 kubectl=1.20.x-00
```


### 5. kubelet 다시 시작

```
sudo systemctl daemon-reload
sudo systemctl restart kubelet
```

### 6. 업그레이드 확인
```
exit
kubectl get no
```


![image](https://user-images.githubusercontent.com/81672260/170401070-b8894f63-8d75-455a-b7f6-ce707a36d0e9.png)

### 7. Remove the restriction and mark the worker node as schedulable again.

```
kubectl uncordon node01
```


