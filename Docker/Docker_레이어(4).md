# 6-1 레이어의 개념
![image](https://user-images.githubusercontent.com/81672260/143999749-760876ce-8346-47a5-9460-b5f6ade161b9.png)
왼쪽 : 이미지 A를 지운다 해도 이미지 B에서 레이어 A,B,C를 사용하고 있기 때문에 지워지지 않음
오른쪽 : 이미 존재하는 레이어 A,B는 새로 다운로드 받을 필요가 없음

# 6-2 도커 이미지 정보 확인

```
docker pull nginx
docker inspect nginx
```

# 6.3 도커 이미지 저장소 위치 확인
``` docker info
sudo -i
cd /var/lib/docker/overlay2
```

# 6-4 레이어 저장소 확인
```
root@server1-VirtualBox:/var/lib/docker/overlay2# ls
0cc29ea5605872d9c8291673064e85b07160203fbf04b34eeeed899731361960 # 레이어 변경 사항 저장
615767e7221dbc99b8e441e35a88df5d74c911f2674ceaa28001388535e95be2 # 레이어 변경 사항 저장
9f3bb671f38d7f61f661af369d420cdedb195e4d623bdb6ba8e3b045f72e8d69 # 레이어 변경 사항 저장
l # 원본 레이어 저장
```

# 6.5 도커 용량 확인하기

```
du -sh /var/lib/docker/ #도커가 설치된 환경 용량 확인
2.0G	/var/lib/docker/

du -sh /var/lib/docker/image/ # 도커 이미지에 대한 정보 저장 디렉토리
2.7M	/var/lib/docker/image/

du -sh /var/lib/docker/overlay2/ # 도커 이미지의 파일 시스템이 사용되는 실제 디렉토리
2.0G	/var/lib/docker/overlay2/

du -sh /var/lib/docker/containers/ # 도커 컨테이너 정보 저장 디렉토리
136K	/var/lib/docker/containers/
```
