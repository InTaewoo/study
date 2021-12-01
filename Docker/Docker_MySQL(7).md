# 9 환경 변수를 사용해 MySQL 서비스 구축하기

## 9.1 dockerhub에서 mysql 검색
![image](https://user-images.githubusercontent.com/81672260/144157801-f3c15473-7b4b-4ca1-af99-4b42ad4fa84f.png)

# 9.2 환경 변수 사용해 데이터 전달하기

```
docker run -d --name nx -e env_name=test1234 nginx
```
![image](https://user-images.githubusercontent.com/81672260/144158456-127f7f73-332b-4d49-ae10-3e9e796d80d0.png)

![image](https://user-images.githubusercontent.com/81672260/144158598-2b66306b-8409-4bae-8550-0cb431b93ee1.png)
- bash 열기

```
printenv 환경변수에 대한 내용을 볼수있음
```
![image](https://user-images.githubusercontent.com/81672260/144158682-c728afc5-174d-4634-9b51-d032a1ff8273.png)
