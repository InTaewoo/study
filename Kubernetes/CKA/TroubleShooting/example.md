### 트러블 슈팅 문제 해결 방법

1. Docker Running?

```
ssh node01
systemctl status docker
작동이 안될 시 : systemctl enable --now docker
```

* enable --now : 항상 사용 가능하도록 하는 명령어


2. kubelet Running?

```
ssh node01
systemctl status kubelet
작동이 안될 시 : systemctl enable --now kubelet

3. kube-prxoy Running?
