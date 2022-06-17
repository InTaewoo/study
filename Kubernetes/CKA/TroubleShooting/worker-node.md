## Worker node 문제 해결

### 1. Fix the broken cluster

![image](https://user-images.githubusercontent.com/81672260/174248708-805edbfb-1ee8-4ecb-a315-c09c3dd94a21.png)

```

ssh node01
systemctl status kubelet
```
![image](https://user-images.githubusercontent.com/81672260/174249071-928c8177-7a02-462e-91f0-ecf29bf9b082.png)

node01에 상태를 확인해 보니 실행중이 아닌 상태.

```
systemctl start kubelet
```

### 2. The cluster is broken again. Investigate and fix the issue.

```
ssh node01
systemctl status kubelet
systemctl start kubelet 
해도 작동이 안됨.
```

로그확인
```
journalctl -u kubelet.service
```
![image](https://user-images.githubusercontent.com/81672260/174251872-263fce07-d0b1-4bd2-8f44-83aea58c2316.png)

ca파일에 문제 발견

```
vi /var/lib/kubelet/config.yaml
```

![image](https://user-images.githubusercontent.com/81672260/174253260-7ee95bba-3c99-4215-8760-b4b0c5bfddf4.png)

clientCAFile:을 ca.crt 로 수정

```
systemctl start kubelet
```




