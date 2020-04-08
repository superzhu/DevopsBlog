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
5. Check resources in a specific namesapce
   ```bash
    kubectl api-resources --verbs=list --namespaced -o name | xargs -n 1 kubectl get --show-kind --ignore-not-found -n kube-system
   ```
6. List all containers in a pod
   ```bash
   kubectl get pods/prometheus-k8s-0 -n monitoring -o jsonpath='{.spec.containers[*].name}'
   ```
7. Print logs from all containers matching label
   ```bash
   kubectl logs -l app=nginx
   ```
8. Print the logs that are newer than a duration.
   ```bash
   kubectl logs nginx-78f5d695bd-czm8z --since=1h
   ```
9. List pods labels:
   ```bash
   kubectl get pods --show-labels -n develop
   ```
10. ff



## References
1. [Understanding Kubernetes API - Part 3 : Deployments API](http://blog.madhukaraphatak.com/understanding-k8s-api-part-3/)
2. [kubectl commands cheatsheet](https://medium.com/faun/kubectl-commands-cheatsheet-43ce8f13adfb)
3. [pod平滑迁移](https://www.cnblogs.com/Dev0ps/p/11088810.html)