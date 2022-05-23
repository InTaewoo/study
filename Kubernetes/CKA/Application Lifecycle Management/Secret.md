## Secret
- 암호나 키와 같은 민감한 정보를 저장하는 데 사용
![image](https://user-images.githubusercontent.com/81672260/169760289-d96cb1d4-eaff-4200-a82f-bb9b2901ea0c.png)

ex) Mysql DB 계정

- configMap과 유사

## Create Secrets
1. Secret 정의 파일을 사용하지 않고 Secret을 사용하는 선언적 방식.


```
kubectl create secret generic <secret-name> --from-literal=<key>=<value>
kubectl create secret generic app-secret --from-literal=DB_Host=mysql --from-literal=DB_Host=mysql --from-literal=DB_Host=mysql : 너무 많으면 복잡해짐
kubectl create secret generic app-secret --from-file=<path-to-file> : -from-file 옵션을 사용하여 데이터가 포함된 파일의 경로를 지정
```

2. 정의 파일 생성

![image](https://user-images.githubusercontent.com/81672260/169761059-7284a480-1768-41cc-8447-e957c9996597.png)

- 인코딩된 형식으로 데이터를 지정해야 한다.

## Encode Secrets
- 개인정보 암호화 시키기
![image](https://user-images.githubusercontent.com/81672260/169762291-5d02918b-7584-4684-8ef1-6a7682258e49.png)

```
echo -n 'mysql' | base64
echo -n 'root' | base64
echo -n 'paswrd' | base64
```

## View Secrets
```
kubectl get secrets
kubectl describe secrets
```

## Decode Secrets
- 개인 정보 암호화 해제
![image](https://user-images.githubusercontent.com/81672260/169762838-5b61e533-981e-428d-ae73-1c0e81358b73.png)


```
echo -n 'bXlzcWw' | base64
echo -n 'cm9vdA' | base64
echo -n 'cGFzdJk' | base64
```

## Secret in Pods
- 파드 정의 파일에 추가하기

![image](https://user-images.githubusercontent.com/81672260/169763233-439225d0-e560-410d-b75c-f02573e88d2d.png)

```
envFrom:
  - secretRef:
      name: app-secret  --> secret-data.yaml에서 secret의 이름
```

![image](https://user-images.githubusercontent.com/81672260/169763496-41ed2fbd-d845-4bd9-9f68-dcf18d810592.png)


