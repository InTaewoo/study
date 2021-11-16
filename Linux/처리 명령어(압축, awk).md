# 압축 (gzip, gunzip, zcat)
- gzip은 압축할때, gunzip은 압축을 해제할때
- 

| 옵션             | 내용             |
|:---:|:---:|
|-r|디렉토리를 압축|
|-d|압축을 해제. gunzip과 같은 동작|
|-l|압축 정보를 표시|
|-c|gzip파일을 읽어서 표준 출력으로 출력|

## tar
- 여러개의 파일을 모아서 하나의 파일(tar형식)으로 만들어줌


| 옵션             | 내용             |
|:---:|:---:|
|-c|파일 묶음을 생성|
|-x|파일 묶음을 해제|
|-z|파일을 gzip압축하면서 묶음을 생성|
|-v|처리 상황을 출력|
|-t|파일 묶음에 들어있는 파일 목록을 출력|

# awk
- 입력을 주어진 분리자로 분리하여 명령을 처리

| 옵션             | 내용             |
|:---:|:---:|
|F|문자열을 분리할 기준이 되는 분리문자 입력|
|v|파라미터 전달|


# 내장함수
| 함수             | 설명             |
|:---:|:---:|
|sub|지정한 문자열을 치환|
|gsub|문자열 일괄 치환|
|index|주어진 문자열과 일치하는 문자의 인덱스를 반환|
|length|문자열의 길이를 반환|
|substr|시작위치에서 주어진 길이만큼의 문자열 반환|
|split|문자열을 분리하여 배열로 반환|
|print|문자열 출력|
|printf|지정한 포맷에 따라 함수 출력|
|system|명령 실행|


### print
- 출력

```
$ echo "Hello World" | awk '{ print $0 }'
Hello World

$ echo "Hello World" | awk '{ print $1 }'
Hello

$ echo "Hello World" | awk '{ print $2 }'
World

$ echo "Hello,World" | awk -F "," '{ print $2 }'
World
```

### sub
- 치환

```
echo "i have a water." | awk -F " " '{ sub("a", "b", $4); print $4 }'
wbter.
```

### gsub
- 문자열 일괄 치환

```
$ echo "i have a water." | awk -F " " '{ gsub("a", "b"); print $1" "$2" "$3" "$4 }'
i hbve b wbter.
```

### index
- 문자열의 길이 반환


```
echo "i have a water." | awk -F " " '{ print index($4, "a") }'
2
```

### length
- 문자열 길이 반환

```
echo "i have a water." | awk -F " " '{ print length($4) }'
6
```

### substr
- 시작위치에서 주어진 개수만큼 반환

```
$ echo "1234567890" | awk -F " " '{ print substr($1, 3, 2) }'
34
```

### split
-문자열을 분리하여 배열로 반환

```
$ echo "A/B/C/D/E/F/G" | awk -F " " '{ print split($1, array, "/");print array[1];print array[3]; }'
7
A
C
```

### printf
- 지정한 포맷에 따라 함수 출력

```
echo | awk '{ printf("%.1f + %.2f = %.3f\n", 40.1, 20.2, 40.1 + 20.2); }'
40.1 + 20.20 = 60.300
```

# system
- 명령실행

```
echo "Hello World" | awk '{ system("echo "$1) }'
Hello
```

