## 에제

### 1. What is the Internal IP address of the controlplane node in this cluster?

```
kubect get no -o wide
```

답 : 10.50.177.12

![image](https://user-images.githubusercontent.com/81672260/173262641-56ef9db6-5145-48fc-b82d-287b4386f0e2.png)


### 2. What is the network interface configured for cluster connectivity on the controlplane node?
node-to-node communication

```
kubectl get no -o wide
ip a
10.50.177.12에 연결되어 있는 node 선택
```
답 : eth0

![image](https://user-images.githubusercontent.com/81672260/173262734-4a685729-8303-4ac8-a2dd-05566bac46fb.png)


### 3.What is the MAC address of the interface on the controlplane node?
```
kubectl get no -o wide
ip a
10.50.177.12에 연결되어 있는 MAC address 선택
```
답 : 02:42:0a:32:b1:0c

### 4. What is the IP address assigned to node01?

```
kubectl get no -o wide
```

답 : 10.50.177.3

### 5.What is the MAC address assigned to node01?

`arp node01`
![image](https://user-images.githubusercontent.com/81672260/173262850-b2da826d-30c7-402d-ad1f-cba5d80e38e1.png)


답:02:42:0a:32:b1:0d

### 6. What is the state of the interface docker0?
`ip link`
![image](https://user-images.githubusercontent.com/81672260/173263011-e8921ef9-27fa-4aae-8827-660458fdaead.png)

### 7. If you were to ping google from the controlplane node, which route does it take?
What is the IP address of the Default Gateway?

` ip route show default`
![image](https://user-images.githubusercontent.com/81672260/173263182-f294ef59-99f6-46dd-a304-aca14dd33c70.png)

답 : 172.25.0.1


### 8. What is the port the kube-scheduler is listening on in the controlplane node?

` netstat -nplt | grep kube-scheduler`
![image](https://user-images.githubusercontent.com/81672260/173263306-4f37a5be-7f4f-44a3-a92f-9ac73206b17f.png)

답 : 10259

### 9.

