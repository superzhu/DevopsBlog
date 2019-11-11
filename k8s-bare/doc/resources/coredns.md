# CoreDNS

1. Check if the DNS pod is running
```bash
    kubectl get pods --namespace=kube-system -l k8s-app=kube-dns
```
2. ff