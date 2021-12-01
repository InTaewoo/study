# 10 볼륨 마운트하여 Jupyter LAB 서비스 구축

## 10.1 docker hub에서 Jupyer notebook 검색

## 10.2 불륨 마운트 옵셕 사용해 로컬 파일 공유하기

- 명령어 형식

```
docker run -v <호스트 경로>:<컨테이너 내 경로>:<권한> # /tmp:home/user:ro
```

- 권한의 종류
  - ro : 읽기 전용
  - rw : 읽기 및 쓰기
 
 nginx로 볼륨 마운트하기
 
 ```
 sudo docker run -d -p 80:80 --rm -v /var/www:/usr/share/nginx/html:ro nginx
 echo 1234 > /var/www/index.html
 ```
![image](https://user-images.githubusercontent.com/81672260/144172954-9348f075-5847-44ac-93b5-f9340e5b01b1.png)

![image](https://user-images.githubusercontent.com/81672260/144172991-c61925dd-7c14-4f56-bb7c-5028c46ec9b6.png)

## 10.3 데이터 분석가를 위한 JupyterLAB환경 구축하기

```
mkdir ~/jupyternotebook
chmod 777 ~/jupyternotebook
cd ~/jupyternotebook
sudo docker run --rm -p 8080:8888 -e JUPYTER_ENABLE_LAB=yes -v "$PWD":/home/jovyan/work:
rw jupyter/datascience-notebook:9b06df75e445
```

![image](https://user-images.githubusercontent.com/81672260/144176608-9711a656-5043-47e7-bbf4-fc81e68869ef.png)


![image](https://user-images.githubusercontent.com/81672260/144176673-8772297b-7502-471f-a8f4-cf24027c43e1.png)

127.0.0.1:8080 으로 Jupyternotebook 접속, 토큰으로 로그인
