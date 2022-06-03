## 네트워크 정책

### 네트워크 보안
- 각 노드에는 IP주소가 있고 서비스뿐만 아니라 각 파드에도 IP주소가 있다.


![image](https://user-images.githubusercontent.com/81672260/171804048-c9c4626b-7dff-441c-a047-8e5f61940620.png)

![image](https://user-images.githubusercontent.com/81672260/171804071-4d895104-53d7-420d-838e-e31822a457ab.png)


### Selectors
- Allow Ingress Traffic From API 
- 파드에 레이블을 지정하고 네트워크 정책의 파드 선택기 필드에 동일한 레이블을 사용한다.


우리의 경우 DB-Pod에 대한 인그레스 트래픽만을 허용하기를 원할때 Ingress를 추가한다.

![image](https://user-images.githubusercontent.com/81672260/171804332-67ae014b-de20-4d23-979c-fbc61c23ac8b.png)
