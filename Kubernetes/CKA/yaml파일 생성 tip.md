## Certification Tip

### Create an NGINX Pod

```
kubectl run nginx --image=nginx
```

### Generate POD Manifest YAML file (-o yaml). Don't create it(--dry-run)

```
kubectl run nginx --image=nginx --dry-run=client -o yaml
```

