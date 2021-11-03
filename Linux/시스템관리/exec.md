# exec
주어진 명령어를 실행하는데 새로운 프로세스를 생성하지 않고, 쉘 프로세스를 대체함.

➜  macbook ✗ ssh root@masternode
[root@masternode ~]# echo "aa"
aa
[root@masternode ~]# exec echo "aa"
aa
➜  macbook ✗

## 사용예제

$ exec echo "aa"
aa

$ exec java -cp '/etc/hadoop/conf' org.apache.hadoop.hdfs.server.datanode.SecureDataNodeStarter
