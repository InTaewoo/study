## 예제

### 1. Create a multi-container pod with 2 containers.
Use the spec given below.
If the pod goes into the crashloopbackoff then add the command sleep 1000 in the lemon container.


- Name: yellow
- Container 1 Name: lemon
- Container 1 Image: busybox
 Container 2 Name: gold
- Container 2 Image: redis
