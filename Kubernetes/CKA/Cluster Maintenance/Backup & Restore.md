## 예제
### 1. The master node in our cluster is planned for a regular maintenance reboot tonight. While we do not anticipate anything to go wrong, we are required to take the necessary backups. Take a snapshot of the ETCD database using the built-in snapshot functionality.
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
