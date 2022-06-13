## 에제

### 1. What is the Internal IP address of the controlplane node in this cluster?

```
kubect get no -o wide
```

답 : 10.50.177.12

### 2. What is the network interface configured for cluster connectivity on the controlplane node?
node-to-node communication

```
kubectl get no -o wide
ip a
10.50.177.12에 연결되어 있는 node 선택
```
답 : eth0

### 3.What is the MAC address of the interface on the controlplane node?
```
kubectl get no -o wide
ip a
10.50.177.12에 연결되어 있는 MAC address 선택
```
답 : 02:42:0a:32:b1:0c



