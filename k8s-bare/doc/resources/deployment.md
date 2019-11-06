# Deployments API

1. List all pods in a namespace
```bash
curl http://127.0.0.1:8080/api/v1/namespaces/develop/pods
```
2. List all deployments in a Kubernetes cluster
```bash
curl http://127.0.0.1:8080/apis/apps/v1/deployments
```
3. List all deployments in a specific namespace
```bash
curl http://127.0.0.1:8080/apis/apps/v1/namespaces/develop/deployments
```
4. Get Details about Single Deployment
```bash
curl --request GET   --url http://localhost:8080/apis/apps/v1/namespaces/kube-system/deployments/coredns

curl http://127.0.0.1:8080/apis/apps/v1/namespaces/develop/deployments/imcore
```



## References
1. [Understanding Kubernetes API - Part 3 : Deployments API](http://blog.madhukaraphatak.com/understanding-k8s-api-part-3/)
2. [kubectl commands cheatsheet](https://medium.com/faun/kubectl-commands-cheatsheet-43ce8f13adfb)