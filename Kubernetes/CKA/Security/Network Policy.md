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


## 네트워크 정책 예시


### 1. What type of traffic is this Network Policy configured to handle?
![image](https://user-images.githubusercontent.com/81672260/172271362-70040305-73a3-4c96-a6c2-338f954f2d95.png)

```
kubectl describe networkpolicies.networking.k8s.io
```

### 2. What is the impact of the rule configured on this Network Policy?









![image](https://user-images.githubusercontent.com/81672260/171804606-9cc8ae45-35fd-4359-85b8-f57105162b24.png)

```
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: test-network-policy
  namespace: default
spec:
  podSelector:
    matchLabels:
      role: db
  policyTypes:
  - Ingress
  - Egress
  ingress:
  - from:
    - ipBlock:
        cidr: 172.17.0.0/16
        except:
        - 172.17.1.0/24
    - namespaceSelector:
        matchLabels:
          project: myproject
    - podSelector:
        matchLabels:
          role: frontend
    ports:
    - protocol: TCP
      port: 6379
 ```
 
 
 ## 예시 
 
 ### Create a network policy to allow traffic from the Internal application only to the payroll-service and db-service.

Use the spec given below. You might want to enable ingress traffic to the pod to test your rules in the UI.

내부 응용프로그램만 통신이 가능한 네트워크 정책 만들기

- Policy Name: internal-policy

- Policy Type: Egress

- Egress Allow: payroll

- Payroll Port: 8080

- Egress Allow: mysql

- MySQL Port: 3306

![image](https://user-images.githubusercontent.com/81672260/171820217-42646d90-1ecd-43a2-84ff-ea09b012ac51.png)

