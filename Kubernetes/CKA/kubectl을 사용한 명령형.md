## 정의 파일 생성
정의 파일을 사용하여 대부분 선언적 방식으로 작업하는 동안 명령형 명령은 일회성 작업을 빠르게 완료하고 정의 템플릿을 쉽게 생성하는 데 도움이 될 수 있습니다. 
이렇게 하면 시험 중에 상당한 시간을 절약할 수 있습니다.시작하기 전에 아래 명령으로 작업하는 동안 유용할 수 있는 두 가지 옵션을 숙지하십시오.

`--dry-run `: 기본적으로 명령이 실행되는 즉시 리소스가 생성된다. 단순히 명령을 테스트하려면 `--dry-run=client`옵션을 사용해라. 이것은 리소스를 생성하지 않고 대신
리소스를 생성할 수 있는지 여부와 명령이 올바른지 여부를 알려준다.

`-o yaml` :  자원 정의를 YAML형식으로 화면에 출력한다. 위의 두 가지를 조합하여 리소스 정의 파일을 빠르게 생성하면 처음부터 파일을 만드는 대신 필요에 따라 리소를 수정하고
생성할 수 있다.

## Nginx pod 생성
`kubectl run nginx --image=nginx`

## POD 매니페스트 YAML파일을 생성한다.
`kubectl run nginx --image=nginx --dry-run=client -o yaml`

## Deployment 만들기
`kubectl create deployment --image=nginx nginx`

### Deployment YAML파일 생성
`kubectl create deployment --image=nginx nginx`

## 4개의 replicas를 가진 Deployment생성 
`kubectl create deployment nginx --image=nginx --replicas=4`
`kubectl scale deployment nginx --replicas=4`

## YAML파일을 저장하는 방법
`kubectl create deployment nginx --image=nginx --dry-run-client -o yaml > nginx-deploymeny.yaml

## 서비스
- 클러스터 IP유형의 redis-service라는 이름을 가진 서비스를 생성하여 포트 6379에서 포트 redis를 노출
`kubectl expose pod redis --port=6379 --name redis-service --dry-run=client -o yaml`
`kubectl create serivce clusterip redis --tcp=6379:6379 --dry-run=client -o yaml`

이렇게 하면 pod 레이블을 selector로 사용하지 않고 대신 selector를 app=redis로 가정한다.

## 노드의 포트 30080에서 파드 nginx의 포트 80을 노출하기 위해 NodePort유형의 nginx라는 서비스를 생성.
`kubectl expose pod nginx --type=NodePort --port=80 --name=nginx-service --dry-run=client -o yaml`

이렇게 하면 자동으로 파드의 레이블을 selector로 사용하지만 노드 포트를 지정할 수 없다. 서비스를 생성하기 전 수동으로 노드 포트를 추가해야 한다.

`kubectl create service nodeport nginx --tcp:80:80 --node-port=30080 --dry-run=client -o yaml`
이렇게 하면 파드 레이블을 selector로 사용하지 않는다.

위의 두 명령에는 고유한 문제가 있다. 하나는 selector을 수락하지 않지만 다른 하나는 NodePort를 수락하지 않는다.
`kubectl expose`로 사용하는게 훨씬 유리하다. 노드 포트를 지정해야 하는 경우 동일한 명령을 사용하여 정의 파일을 생
성하고
서비스를 생성하기 전에 노드 포트를 수동으로 입력한다.
