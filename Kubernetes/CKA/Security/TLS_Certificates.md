## TLS

- 사용자가 웹 서버에 엑세스 하려고 할때 TLS 인증서는 사용자와 서버 사이는 암호화되고 서버는 그것을 말하는 사람이다.
- User와 Password를 그대로 전송하면 해킹의 위험이 있기때문에 암호화 키를 사용하여 데이터를 전송해야한다.
- 따라서 키 사본도 서버가 읽을 수 있도록 전송해야한다.

![image](https://user-images.githubusercontent.com/81672260/170898875-61f2956e-76da-4441-866b-f1eaa8766be4.png)

## ASYMMETRIC ENCRYPTION - SSH
- 비밀번호를 사용하면 안전할 수 있기 때문에 키-쌍을 사용하기로 결정하고 공개 및 개인 키 쌍을 생성한다.

```
ssh-keygen
id_rea(개인키) ,  id_rsa.pub(공개키)
```


## Certificate(공개키)
- *.crt, *.pem


![image](https://user-images.githubusercontent.com/81672260/170902731-d07c0cb8-1e02-4fa2-b540-a007f446a343.png)

## 인증서 생성

1. Generate keys (일반 키 생성) `openssl genrsa -out ca.key 2048` 
인증서를 생성하기 위해 생성된 키와 함께 개방형 SSL 명령을 사용한다.

2. Certificate Signing Request(인증서 서명 요청) : ca.scr  `openssl req -new -key ca.key -subj "/CN=KUBERNETES-CA" -out ca.scr`

3. Sign Certificates(인증서 서명) : ca.crt `openssl x509 -req -in ca.scr -signkey ca.key -out ca.crt`


