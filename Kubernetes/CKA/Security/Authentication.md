## Who can access?

- Files - Username and Passwords
- Files - Username and Tokens
- Certificates
- External Authentication providers - LDAP
- Service Accounts

## Auth Mechanismes
- Static Password File
- Static Token File
- Certificates
- Identity Services

kube-apiserver

![image](https://user-images.githubusercontent.com/81672260/170898061-733d7e27-ef1e-4657-bf04-8cd290d3c8a5.png)

--basic-auth-file=ser-details.csv 이 부분을 kube-apiserver.service 아래부분에 추가한다.

## 예시

detail.csv = 사용자 계정, 비밀번호

```
# User File Contents
password123,user1,u0001
password123,user2,u0002
password123,user3,u0003
password123,user4,u0004
password123,user5,u0005
```

/etc/kubernetes/manifests/kube-apiserver.yaml

```
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  name: kube-apiserver
  namespace: kube-system
spec:
  containers:
  - command:
    - kube-apiserver
    - --authorization-mode=Node,RBAC
      <content-hidden>
    - --basic-auth-file=/tmp/users/user-details.csv
```
