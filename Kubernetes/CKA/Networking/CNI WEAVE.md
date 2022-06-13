### 1.Inspect the kubelet service and identify the network plugin configured for Kubernetes.

```
ps -aux | grep kubelet 혹은
ps -aux | grep kubelet | grep --color network-plugin=
```

### 2. What is the path configured with all binaries of CNI supported plugins?

```
/opt/cni/bin
```

### 3. Identify which of the below plugins is not available in the list of available CNI plugins on this host?

사용할 수 없는 클러스터
```
ls /opt/cni/bin
```
![image](https://user-images.githubusercontent.com/81672260/173265325-673a2d12-238a-4379-b65c-8d118d2bec72.png)

### 4. What is the CNI plugin configured to be used on this kubernetes cluster?

```
ls /etc/cni/net.d/
10-flannel.conflist
```

### 5. What binary executable file will be run by kubelet after a container and its associated namespace are created.

```
cat /etc/cni/net.d/10-flannel.conflist
```
![image](https://user-images.githubusercontent.com/81672260/173266224-d50c94c4-3c04-4bf9-a966-a9cb857c84ea.png)
