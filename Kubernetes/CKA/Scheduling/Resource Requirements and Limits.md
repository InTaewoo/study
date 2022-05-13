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

- 
