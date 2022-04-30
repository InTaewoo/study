## Certification Tip

### Create an NGINX Pod

```
kubectl run nginx --image=nginx
```

## yaml파일을 만드는 법

### Generate POD Manifest YAML file (-o yaml). Don't create it(--dry-run)

```
kubectl run nginx --image=nginx --dry-run=client -o yaml
```

### Create a deployment

```
kubectl create deployment --image=nginx nginx
```

### Generate Deployment YAML file (-o yaml). Don't create it(--dry-run)

```
kubectl create deployment --image=nginx nginx --dry-run=client -o yaml
```


