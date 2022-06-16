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

2. 
