# WSL 2 installation is incomplete, 윈도우10 도커 설치시 리눅스 커널 업데이트, Docker Linux Kernel Update on Windows 10

![image](https://user-images.githubusercontent.com/81672260/144531005-a7ecc8c7-f5c8-41cd-b06d-1bd6080cbe6b.png)

1. powershell을 관리자 권한으로 실행
![image](https://user-images.githubusercontent.com/81672260/144531076-3ae9cceb-b213-4c29-b11a-7184af2b1acd.png)

2. 리눅스 서브시스템 활성 명령어 입력

```
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
```

![image](https://user-images.githubusercontent.com/81672260/144531203-e9389ec4-f4aa-47f5-9022-a4dd1099d53e.png)


3. 가상 머신 플랫폼 기능 활성화 명령어 입력
