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

```
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```


![image](https://user-images.githubusercontent.com/81672260/144531257-278cc19f-f214-4e5e-a48a-b1d41097f09f.png)

4. x64 머신용 최신 WSL2 Linux 커널 업데이트 패키지 다운로드, 설치
wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi
![image](https://user-images.githubusercontent.com/81672260/144531317-ccc829f1-c5c7-4585-8c7d-59c1746f19a8.png)

5. Docker Desktop - Restart 선택
6. 
7. Docker 설치 완료
