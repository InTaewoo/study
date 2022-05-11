## PODs to Nodes
- 노드 어피니티 기능의 주요 목적은 파드가 특정 노드에서 호스팅되도록 하는 것이다.

## Node Affinity Type

### 필수적인 노드 어피니티를 사용해 파드 스케줄하기
- 이 매니페스트는 `disktype:ssd` 라는 `requiredDuringSchedulingIgnoredDuringExecution` 노드 어피니티를 가진 파드를 설명한다.  파드가
