# 도커 설치하기

# 2.1 이미지 파일 다운로드
![image](https://user-images.githubusercontent.com/81672260/143968666-0d192eeb-5a16-4e7d-8d96-72c2f9d11897.png)

root계정으로 docker 설치
![image](https://user-images.githubusercontent.com/81672260/143969767-6b6e6feb-65c7-4cb9-8a74-18204c7c1322.png)

![image](https://user-images.githubusercontent.com/81672260/143971142-4b983920-9dea-42a3-8902-02d1b81dd04c.png)

![image](https://user-images.githubusercontent.com/81672260/143971549-18d6b7ee-4e99-491a-9a3f-4a92ad91b10a.png)


firefox로 127.0.0.1:8080 접속 tomcat창 확인
# 3. 내가 원하는 이미지 찾기

# 3.1 도커 레지스트리
도커 레즈스트리에는 사용자가 사용할 수 있도록 데이터베이스를 통해 Image를 제공해주고 있음. 누구나 이미지를 만들어 푸시할 수 있으며 푸시된 이미지는 다른 사람들에게 공유 가능
![image](https://user-images.githubusercontent.com/81672260/143972260-aeb88efd-6362-49cb-9d33-87251ba073c8.png)

# 3.2 도커 퍼블릭 레지스트리 검색 및 확인
https://hub.docker.com
원하는 이미지 파일 검색 가능 일반 사용자가 업로드 가능
![image](https://user-images.githubusercontent.com/81672260/143972768-db8282ac-7c77-4a74-9559-88c0b0d5201f.png)
원하는 애플리케이션을 통해 빠르게 구현이 가능하다 라는 장점이 있다

# 3.3 도커 명령어로 검색

```
sudo docker search tomcat
```

![image](https://user-images.githubusercontent.com/81672260/143973314-b43d73a7-ac96-4379-ac5d-ad6db220f9ee.png)

# 3.4 도커 이미지 다운로드

'''
sudo docker pull tomcat
''' 

pull을 이용해 원하는 이미지 다운

![image](https://user-images.githubusercontent.com/81672260/143973476-61884288-9b84-4a7c-a3f0-50f58a9edb9c.png)

# 3.5 로컬 시스템에 있는 도커 이미지 확인하기

```
sudo docker images
```

출처 : https://www.notion.so/b67ed727aea4467cbc3226bb0c8e8336
