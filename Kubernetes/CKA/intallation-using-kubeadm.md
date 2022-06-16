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
