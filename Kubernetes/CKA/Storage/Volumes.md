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
