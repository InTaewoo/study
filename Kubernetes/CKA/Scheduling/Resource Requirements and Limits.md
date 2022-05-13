## 네임스페이스에 대한 기본 메모리 요청 및 제한 구성
- 기본 메모리 요청과 기본 메모리 제한을 지정

```
apiVersion: v1
kind: LimitRange
metadata:
  name: mem-limit-range
spec:
  limits:
  - default:
      memory: 512Mi
    defaultRequest:
      memory: 256Mi
    type: Container
```
이제 default-mem-example 네임스페이스에 파드를 생성하고 해당 파드 내의 컨테이너가 메모리 요청 및 메모리 제한에 대해 자체 값을 지정하지 않으면제어 평면 기본값 적용: 256MiB의 메모리 요청 및 512MiB의 메모리 제한.

다음은 하나의 컨테이너가 있는 Pod에 대한 예시 매니페스트입니다. 컨테이너는 메모리 요청 및 제한을 지정하지 않습니다.

```
apiVersion: v1
kind: Pod
metadata:
  name: default-mem-demo
spec:
  containers:
  - name: default-mem-demo-ctr
    image: nginx
```

----
```
containers:
- image: nginx
  imagePullPolicy: Always
  name: default-mem-demo-ctr
  resources:
    limits:
      memory: 512Mi
    requests:
      memory: 256Mi
 ```
- 출력은 Pod의 컨테이너에 256MiB의 메모리 요청과 512MiB의 메모리 제한이 있음을 보여준다.
Limit Range에서 지정한 기본값이다.


## POD 및 Deployment Edit에 대한 참고 사항

### edit 및 pod
아래 이외의 기존 POD사양은 편집할 수 없다.
- spec.containers[*].image
- spec.initContainers[*].image
- spec.activeDeadlineSeconds
- 사양 허용

## 문제

### 1. A pod called rabbit is deployed. Identify the CPU requirements set on the Pod. in the current(default) namespace
```
kubectl describe po rabbit
```
![image](https://user-images.githubusercontent.com/81672260/168232201-0674e1fc-8aa3-4784-8208-c0ef4de40cef.png)

### 2. Another pod called elephant has been deployed in the default namespace. It fails to get to a running state. Inspect this pod and identify the Reason why it is not running.

```
kubectl describe po elephant
```
![image](https://user-images.githubusercontent.com/81672260/168232704-eaa488d9-cd89-4c60-b2c5-8bb07025f850.png)

* OOMKilled = 메모리 부족으로 pod limit를 늘려야한다.

### 3.The elephant pod runs a process that consume 15Mi of memory. Increase the limit of the elephant pod to 20Mi. Delete and recreate the pod if required. Do not modify anything other than the required fields.

- Pod Name: elephant

- Image Name: polinux/stress

- Memory Limit: 20Mi

```
kubectl edit po elephant
```
에서 Limit를 20MI로 늘려서 저장하면 오류 발생.

![image](https://user-images.githubusercontent.com/81672260/168233506-4a27d8d9-990a-487c-b94d-a5c3e34ef15f.png)
이 경로에 복사본이 저장되어있음.

```
cat /tmp/kubectl-edit-147100387.yaml : 아까 수정한 내용이랑 같은 복사본
kubectl replace --force /tmp/kubectl-edit-147100387.yaml : 전에 사용중인 elephant pod를 지우고 새로운 elephant pod로 대체
```


![image](https://user-images.githubusercontent.com/81672260/168234094-202ad126-4564-4673-b5d5-a2f496f17348.png)
