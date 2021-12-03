# Image 가져오기
```
docker pull httpd
```
![image](https://user-images.githubusercontent.com/81672260/144533848-a37602f8-5a6f-444f-ac84-5f71f6ddf244.png)

![image](https://user-images.githubusercontent.com/81672260/144533856-f6609949-033b-4721-a830-2b0d981e5a87.png)

httpd Image설치 확인

# port 열어주기
![image](https://user-images.githubusercontent.com/81672260/144533929-6c4a1e14-cd44-4532-add0-5874e6606821.png)

8080포트 열어줘서 웹 접속 허용

![image](https://user-images.githubusercontent.com/81672260/144533973-bf02bde6-f209-4670-9bfb-731c2846fb49.png)guc
GUI창에서 컨테이너 생성 확인

![image](https://user-images.githubusercontent.com/81672260/144534130-0f20a6e1-066e-4bee-94c3-c83cc3a4d812.png)


# CLI창에서 확인

```
docker run --name wc3 -p 8081:80 httpd
```

![image](https://user-images.githubusercontent.com/81672260/144534439-37d03c23-8108-4321-899f-c6c05587b92a.png)
 8081포트 열어주기
 
 
 ![image](https://user-images.githubusercontent.com/81672260/144534510-36107a40-ffb2-4e3e-a9e9-3dc743b32320.png)


![image](https://user-images.githubusercontent.com/81672260/144534531-1ffb35fc-d30c-472d-a275-72d704860e8e.png)
