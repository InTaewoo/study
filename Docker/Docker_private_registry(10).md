# 13 프라이베잇 레지스트리 구현 및 사용

## private registry 만들기

```
docker run -d --name docker-registry -p 5000:5000 registry
```
![image](https://user-images.githubusercontent.com/81672260/144355588-f8756a23-1a94-4d17-a04c-f2e2c612e9d6.png)
![image](https://user-images.githubusercontent.com/81672260/144355744-f669e598-dab5-463a-aad9-92d6a574c303.png)

127.0.0.1/v2/
-> 서버가 잘 돌고있다.
