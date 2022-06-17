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




