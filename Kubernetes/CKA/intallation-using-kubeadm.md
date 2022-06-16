## kubeadm을 사용하여 설치

### 1. Install the kubeadm and kubelet packages on the controlplane and node01.
Use the exact version of 1.23.0-00 for both.

[쿠버네티스 공식 사이트](https://kubernetes.io/ko/docs/setup/production-environment/tools/kubeadm/install-kubeadm/)


1. iptables가 브리지된 트래픽을 보게 하기

```
cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf
br_netfilter
EOF

cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
sudo sysctl --system
```

2. apt 패키지 색인을 업데이트하고, 쿠버네티스 apt 리포지터리를 사용하는 데 필요한 패키지를 설치한다.
```
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl
```


3. 구글 클라우드의 공개 사이닝 키를 다운로드 한다. 
```
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
```

4. 쿠버네티스 apt 리포지터리를 추가한다.
```
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
```

5. apt 패키지 색인을 업데이트하고, kubelet, kubeadm, kubectl을 설치하고 해당 버전을 고정한다.

```
sudo apt-get update
sudo apt-get install -y kubelet=1.23.0-00 kubeadm=1.23.0-00 kubectl=1.23.0-00
sudo apt-mark hold kubelet kubeadm kubectl
```

6. node01에서도 같은 방식으로 진행.

```
ssh node01
```


### 2. Initialize Control Plane Node (Master Node). Use the following options 마스터 노드 생성하기


1. apiserver-advertise-address - Use the IP address allocated to eth0 on the controlplane node

2. apiserver-cert-extra-sans - Set it to controlplane

3. pod-network-cidr - Set to 10.244.0.0/16
Once done, set up the default kubeconfig file and wait for node to be part of the cluster.


```
ip a   --> enth0의 IP확인
kubeadm init --apiserver-advertise-address 10.4.218.3 --apiserver-cert-extra-sans controlplane --pod-network-cidr 10.244.0.0/16

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

kubectl get no
```

![image](https://user-images.githubusercontent.com/81672260/173991184-3d324c92-6d97-47fd-bc19-4eb6ada31e17.png)

![image](https://user-images.githubusercontent.com/81672260/173991531-34bd79c3-8ede-49f3-a420-d42831949bba.png)

### 3. Join node01 to the cluster using the join token
토큰을 통해 node01 생성

```
kubeadm token create -h   : kubeadm을 통해 토큰 생성하는 방법
kubeadm token create --print-join-command : 마스터노드에서 토큰 생성
ssh node01   :  node01로 접속
kubeadm join 10.4.218.3:6443 --token ttlgj7.r4w7skca483j7qp9 --discovery-token-ca-cert-hash sha256:db8fce2444be9247a78446dd2d08f088dfabbfd73ce6dbb64e87bcade47ea5f4  : 생성한 토큰 붙여넣기

exit
kubectl get no

```


![image](https://user-images.githubusercontent.com/81672260/173992118-10306ccc-b5e5-4f57-838d-160041a8e5e0.png)
![image](https://user-images.githubusercontent.com/81672260/173992484-e828b4b4-f7eb-46bb-b0ba-8aa5960fe3a4.png)
![image](https://user-images.githubusercontent.com/81672260/173992575-f221e24f-2a1b-48b6-81c7-63cd2ad2ab68.png)

### 4. Install a Network Plugin. As a default, we will go with flannel
Refer to the official documentation for the procedure.
네트워크 플러그인 flannel 생성

[Install addon](https://kubernetes.io/ko/docs/concepts/cluster-administration/addons/)

```
kubectl apply -f https://raw.githubusercontent.com/flannel-io/flannel/master/Documentation/kube-flannel.yml
kubectl get po -n kube-system
```

![image](https://user-images.githubusercontent.com/81672260/173992981-33d8c4b2-257d-4a90-af24-8e2c26b416ac.png)




