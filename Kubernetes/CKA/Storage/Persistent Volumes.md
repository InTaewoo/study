## Persistent Volumes
- 어떤 스토리지 솔루션을 사용하든 파드를 배포하는 사용자는 모든 스토리지 솔루션에서 해당 솔루션을 구성해야 한다.
- 변경될 때 마다 자신의 환경에서 pod 정의 파일을 만든다.

![image](https://user-images.githubusercontent.com/81672260/172309938-df21955f-b7e1-4caf-8adf-1e5586d71d30.png)
- Persistent Volumes(영구 볼륨)은 관리자가 사용하도록 구성한 스토리지 볼륨의 클러스터 전체 풀 이다.

## Create Persistent Volume

![image](https://user-images.githubusercontent.com/81672260/172310159-a8902390-2710-4b38-97f2-492e5a5eb18e.png)

- 기본 템플릿으로 시작하여 API 버전을 업데이트해 클라이언트를 영구 볼륨으로 설정.
- `metadata` 이름을 `pv-vol1`로 지정.
- `accessModes`를 지정하여 읽기 전용 모드 또는 읽기 쓰기 모드 등에서 호스트에 마운트되어야 한다.
- `capacity`를 추가해 용량을 지정한다.
- `hostPath`를 추가해 스토리지를 사용하는 호스트 경로 옵션을 지정한다.
