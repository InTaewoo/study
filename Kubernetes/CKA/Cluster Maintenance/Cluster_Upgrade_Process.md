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


## 버전 업그레이드 방법

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




