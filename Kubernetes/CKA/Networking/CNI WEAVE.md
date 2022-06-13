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
