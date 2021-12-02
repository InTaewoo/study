# 14 워드프레스 도커 이미지 만들기 프로젝트

도커에서 제공하는 워드프레스와 MySQL은 따로 떨어진 형태로 존재한다. 여기서는 하나의 컨테이너에서 워드프레스와 MySQL을 동작시킬 수 있도록 만들어본다. 일단 가장 먼저 할 일은 PHP와 DB가 공존하는 환경을 찾는 것이다. 다양한 솔루션들이 있는데 그중에 XAMPP는 도커로 이미 만들어져있어 유용하게 사용할 수 있다. xampp는 apache, MariaDB, php가 설치돼 있다. 여기에 워드프레스만 올리면 바로 컨테이너를 만들 수 있다.


이 사이트의 컨테이너를 불러온 뒤 워드프레스 설치 과정을 진행하도록 한다. 컨테이너에서 SSH와 다앙한 포트를 지원하지만 우리는 80포트만 사용할 예정이다.

```
docker run --name WP -p 80:80 -d tomsik68/xampp
```

![image](https://user-images.githubusercontent.com/81672260/144363835-dab427b8-0439-4e94-8a03-8ef44fd8437b.png)

https://ko.wordpress.org/download/
wordpress 홈페이지 가서 tar.gz파일을 다운받는다.

```
wget https://ko.wordpress.org/latest-ko_KR.tar.gz
tar -xf latest-ko_KR.tar.gz
```

컨테이너 내의 웹 파일 정리

```
sudo docker exec -it WP bash
chown daemon. /opt/lampp/htdocs 
cd /opt/lampp/htdocs/
mkdir backup
mv * ./backup/
exit
```

워드프레스 파일을 컨테이너에  복사하고 웹 루트 디렉토리에 배치

```
sudo docker cp wordpress WP:/opt/lampp/htdocs
sudo docker exec -it WP bash
mv /opt/lampp/htdocs/wordpress/* /opt/lampp/htdocs/
exit
sudo docker restart WP
```

![image](https://user-images.githubusercontent.com/81672260/144367653-a47fb863-e593-4ef9-a9ae-69f01a82cfed.png)
