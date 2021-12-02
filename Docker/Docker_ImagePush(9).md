# 12 도커 이미지 푸시

## 12.1 도커 이미지 태그 변경 후 푸시
회원가입이 되어있어야 한다.
https://hub.docker.com/

```
docker login
docker tag echo_test oilehot0910/echo_test
docker images
docker push oilehot0910/echo_test
```



https://hub.docker.com/ 에 접속하여 내 레파지토리에 도커가 잘 등록됐는지 확인해본다.
![image](https://user-images.githubusercontent.com/81672260/144340536-b301b87e-fef5-4ce7-af83-bc01792e22af.png)

```
sudo docker rmi `docker images -q` -f
sudo docker run -t -p 12345:12345 --name et --rm oilehot0910/echo_test
```

모든 이미지 삭제 후 다시 oilehot0910/echo_test 실행하여 잘 다운로드돼 실행되는지 테스트한다.

![image](https://user-images.githubusercontent.com/81672260/144340880-a65e7114-6dcd-4d55-b1e5-91b0d18c97de.png)

![image](https://user-images.githubusercontent.com/81672260/144340912-cc41d204-7e05-4fac-ac25-475cff9cfefc.png)

## 12.2 도커 이미지 히스토리 확인
다음 명령을 사용하면 도커 이미지가 어떤 히스토리를 가졌는지 확인할 수 있다. 제일 상단에 앞서 우리가 dockerfile을 빌드해서 추가한 정보가 있다.

```
docker history oilehot0910/echo_test
```
