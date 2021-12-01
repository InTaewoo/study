# 9 환경 변수를 사용해 MySQL 서비스 구축하기

## 9.1 dockerhub에서 mysql 검색
https://hub.docker.com/_/mysql
![image](https://user-images.githubusercontent.com/81672260/144157801-f3c15473-7b4b-4ca1-af99-4b42ad4fa84f.png)

![image](https://user-images.githubusercontent.com/81672260/144160344-dfc20ff1-06b3-4ccb-a2b2-33b196e23c09.png)



# 9.2 환경 변수 사용해 데이터 전달하기

```
docker run -d --name nx -e env_name=test1234 nginx
```
![image](https://user-images.githubusercontent.com/81672260/144158456-127f7f73-332b-4d49-ae10-3e9e796d80d0.png)

![image](https://user-images.githubusercontent.com/81672260/144158598-2b66306b-8409-4bae-8550-0cb431b93ee1.png)
- bash 열기

![image](https://user-images.githubusercontent.com/81672260/144158682-c728afc5-174d-4634-9b51-d032a1ff8273.png)

```
printenv 환경변수에 대한 내용을 볼수있음
printenv env_name
echo $env_name
```
![image](https://user-images.githubusercontent.com/81672260/144158990-004d5b91-bb26-4d91-b1c1-2855131e9d22.png)

# 9.3 MySQL 서비스 구축하기
![image](https://user-images.githubusercontent.com/81672260/144159711-a98fa81b-3dbd-4306-adc8-7c2079e2c14d.png)

```
docker run --name ms -e MYSQL_ROOT_PASSWORD='xodn8050!!' -d mysql mysql 비밀번호 설정
docker exec -it ms mysql -u root -p mysql 접속하기
```

![image](https://user-images.githubusercontent.com/81672260/144168300-d88b4bd8-d523-4aae-b372-29ec8a3285d1.png)
