# kubectl subcommands

1. The service account that you use to install and configure the data collector must have access to Kubernetes resources. To determine whether the data collector has access to resources, you can use this service account to run the following commands on the Kubernetes master node:
```bash
    kubectl auth can-i list nodes --all-namespaces --as system:serviceaccount:namespace:service_account_name
```
2. ff