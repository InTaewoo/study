## ConfigMaps

![image](https://user-images.githubusercontent.com/81672260/169731244-02b85370-1f0f-4b94-aa26-055805aada3f.png)
- 파드 정의 파일이 많으면 환경 데이터를 관리하기 어려워진다.
- 파드 정의 파일에서 정보를 가져와 Config를 사용하여 중앙에서 관리할 수 있다.
- ConfigMaps는 Kubernetes에서 키 값 쌍의 형태로 구성 데이터를 전달하는 데 사용된다.



![image](https://user-images.githubusercontent.com/81672260/169731373-fe583033-d575-441f-bbd8-ac6b5d051dda.png)
- 포드가 생성되면 ConfigMap을 파드에 삽입한다.
- 내부에서 호스팅 되는 애플리케이션의 환경 변수로 사용할 수 있는 키 값 쌍 파드의 컨테이너이다.

## Create ConfigMaps

1. 명령적 방식 - ConfigMaps 정의 파일을 사용하지 않고 Config를 사용하여 새성

```
kubectl create configmap <config-name> --from-literal=<key>=<value>   : configmap 생성 틀

kubectl create configmap app-config --from-literal=APP_COLOR=blue --from-literal=APP_MOD=prod  : configmap 생성 예시

kubectl create configmap app-config --from-file=app_config.properties

```

