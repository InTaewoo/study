# crontab 
정기적으로 지정한 시간에 실행하고 싶은 명령어를 등록. 스크립트를 등록해도 된다.
## 크론탭을 등록
$ crontab -e

## 등록된 크론탭을 확인
$ crontab -l

## 크론탭 주기

### 입력 형태 
분 시 일 월 요일 명령어

### 매 50분에 time.sh 실행 
50 * * * * /mnt/usr/time.sh

### 매일 1시에 log 로 끝나는 파일을 찾아서 find.log 파일로 저장 
0 1 * * * find -name '*.log' ./ >> /test/log/fin.log 

### 5분 마다 program.sh 실행
*/5 * * * * /home/user/program.sh

### 4-10 시 사이에 1시간마다 program.sh 실행
0 4-10/1 * * * /home/user/program.sh

### 매일 1시, 3시에 program.sh 를 실행하고 로그를 저장
### 크론탭에 입력할 때 %는 오류가 발생하기 때문에 역슬래쉬(\)로 감싸 주어야 함 
0 1,3 * * /home/user/program.sh >> /home/user/logs/`date -u +\%Y\%m\%d.\%H\%M.log` 2>&1
