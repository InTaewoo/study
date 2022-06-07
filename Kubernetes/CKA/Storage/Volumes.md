## Volumes

### Docker Container
- 일시적
- 데이터 처리가 필요할 때 호출되고 소멸
- 컨테이너에 의해 처리된 데이터는 볼륨에 배치되어 영구적으로 유지된다.

### Kubenetes 
- 일시적
- POD를 생성한 후 삭제하면 POD에서 처리한 데이터도 삭제
- POD에 볼륩을 연결하면 생성된 데이터는 볼륨에 저장되고 파드가 삭제된 후에도 데이터는 남아있다.

![image](https://user-images.githubusercontent.com/81672260/172306444-2e49f08a-20b8-4823-a0fc-d79d5b2bd2e6.png)
1부터 100까지 임의의 값 생성하고 기록하는 파드를 만든다.
- `/opt/number.out`에 저장되고 난수와 함께 삭제.
- 볼륨을 생성할 때 다양한 방식으로 스토리지를 구성하도록 선택할 수 있다.

![image](https://user-images.githubusercontent.com/81672260/172306816-9da1aee4-c128-4467-8637-0dc01ff69d6d.png)
- 호스트에서 경로/data를 지정한다.
- 볼륨에서 생성된 모든 파일이 내 노드의 디렉토리에 저장된다.
- 파드가 삭제되면 난수를 가진 파일이 호스트에 저장된다.

![image](https://user-images.githubusercontent.com/81672260/172307380-2dcaf19e-1450-4964-b740-0561144f16d1.png)
- AWS EBS 볼륨을 스토리지 볼륨으로 구성하기 위해 `awsElasticBlockStore` `volumeID` `fsType` 입력
