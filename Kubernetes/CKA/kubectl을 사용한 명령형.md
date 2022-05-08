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

