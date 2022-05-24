## 예제

### 1. Create a multi-container pod with 2 containers.
Use the spec given below.
If the pod goes into the crashloopbackoff then add the command sleep 1000 in the lemon container.


- Name: yellow
- Container 1 Name: lemon
- Container 1 Image: busybox
 Container 2 Name: gold
- Container 2 Image: redis

```
kubectl run yellow --image=busybox --image=redis --command sleep 1000 --dry-run=client -o yaml > yellow.yaml
vi yellow.yaml
kubectl apply -f yellow.yaml
```
![image](https://user-images.githubusercontent.com/81672260/169929260-6a8b1401-8123-49ad-8f85-412a5273be01.png)

