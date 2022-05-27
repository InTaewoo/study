## 예제
### 1. 백업 The master node in our cluster is planned for a regular maintenance reboot tonight. While we do not anticipate anything to go wrong, we are required to take the necessary backups. Take a snapshot of the ETCD database using the built-in snapshot functionality.
Store the backup file at location /opt/snapshot-pre-boot.db

- Backup ETCD to /opt/snapshot-pre-boot.db

```
kubectl describe po etcd-controlplane -n kube-system
ETCDCTL_API=3 etcdctl snapshot
export ETCDCTL_API=3
etcdctl snapshot
etcdctl snapshot save --endpoints=127.0.0.1:2379 \     : listen-clinet-urls
> --cacert=/etc/kubernetes/pki/etcd/ca.crt \    : peer-trusted-ca-file
> --cert=/etc/kubernetes/pki/etcd/server.crt \   : cert-file
> --key=/etc/kubernetes/pki/etcd/server.key \   : key-file
> /opt/snapshot-pre-boot.db   : backup loaction

ls /opt/snapshot-pre-boot.db

```

## 2. 복원 Luckily we took a backup. Restore the original state of the cluster using the backup file.

- Deployments: 2
- Services: 3

```
etcdctl snapshot restore --data-dir /var/lib/etcd-from-backup /opt/snapshot-pre-boot.db   새로운 폴더 생성 후 백업 한 경로 지정
ls /var/lib/etcd-from-backup/
vi /etc/kubernetes/manifests/etcd.yaml 
hostPath : path 경로 수정 path: /var/lib/etcd-from-backup
kubectl get po -n kube-system 
```
