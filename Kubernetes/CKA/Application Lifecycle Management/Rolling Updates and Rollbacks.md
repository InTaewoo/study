## Rollout and Versioning

- 배포를 처음 생성하면 롤아웃, 새 롤아웃이 트리거 되고 새 배포가 생성된다.

![image](https://user-images.githubusercontent.com/81672260/169448439-f4a53d19-32cc-4fbe-baa5-29d49a1b9ff1.png)

- 새 버전, 새 롤 아웃이 트리거 되고 이에 대한 버전이라는 이름의 새 배포 버전이 생성된다.

## Rollout Command

- 다음 명령 큐브 제어 롤아웃 상태를 실행하여 롤아웃 상태를 볼 수 있다.
```
kubectl rollout status deployment/myapp-deployment
```
![image](https://user-images.githubusercontent.com/81672260/169448640-9d3959dc-856c-484b-8c86-f79da846d3f6.png)
