## ConfigMaps

![image](https://user-images.githubusercontent.com/81672260/169731244-02b85370-1f0f-4b94-aa26-055805aada3f.png)
- 파드 정의 파일이 많으면 환경 데이터를 관리하기 어려워진다.
- 파드 정의 파일에서 정보를 가져와 Config를 사용하여 중앙에서 관리할 수 있다.
- ConfigMaps는 Kubernetes에서 키 값 쌍의 형태로 구성 데이터를 전달하는 데 사용된다.



![image](https://user-images.githubusercontent.com/81672260/169731373-fe583033-d575-441f-bbd8-ac6b5d051dda.png)
- 포드가 생성되면 ConfigMap을 파드에 삽입한다.
- 내부에서 호스팅 되는 애플리케이션의 환경 변수로 사용할 수 있는 키 값 쌍 파드의 컨테이너이다.

## Create ConfigMaps

1. 명령적 방식 - ConfigMaps 정의 파일을 사용하지 않고 Config를 사용하여 생성

```
kubectl create configmap <config-name> --from-literal=<key>=<value>   : configmap 생성 틀

kubectl create configmap app-config --from-literal=APP_COLOR=blue --from-literal=APP_MOD=prod  : configmap 생성 예시

kubectl create configmap app-config --from-file=app_config.properties

kubectl create -f config-map.yaml

```

![image](https://user-images.githubusercontent.com/81672260/169744057-e743f873-4be8-456a-967b-1f78deee493a.png)

```
apiVersion: v1
kind : ConfigMap
metadata: 
  name: app-config
data:
  APP_COLOR: blue
  APP_MODE: prod
```

### View ConfigMaps

```
kubectl get cofigmaps
kubectl describe configmaps
```

2. 파드 정의 파일에 환경 변수를 삽입하여 새 속성을 추가한다.


![image](https://user-images.githubusercontent.com/81672260/169744543-ce0e1bdf-3097-4f58-8d99-90d4af4ded8a.png)

- 이전에 생성한 config-map.yaml을 파드 정의 파일에 삽입하는 방식이다.

```
envFrom:
  - configMapRef:
      name: app-config
```

![image](https://user-images.githubusercontent.com/81672260/169744821-c2d77da1-9dbb-4967-9678-567111ce583c.png)

- ENV 방식
- SINGLE ENV 방식
- VOLUME 방식

## 예제

### 1. What is the environment variable name set on the container in the pod?
```
kubectl get po
kubectl describe po webapp-color
```
![image](https://user-images.githubusercontent.com/81672260/169746266-80ed797a-f685-4f9a-82fc-aea05f2c48cf.png)

### 2. What is the value set on the environment variable APP_COLOR on the container in the pod?

```
kubectl get po
kubectl describe po webapp-color
```

### 3. Update the environment variable on the POD to display a green background
Note: Delete and recreate the POD. Only make the necessary changes. Do not modify the name of the Pod.


- Pod Name: webapp-color
- Label Name: webapp-color
- Env: APP_COLOR=green


