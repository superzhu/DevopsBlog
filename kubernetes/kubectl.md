# kubectl subcommands

1. The service account that you use to install and configure the data collector must have access to Kubernetes resources. To determine whether the data collector has access to resources, you can use this service account to run the following commands on the Kubernetes master node:
```bash
    kubectl auth can-i list nodes --all-namespaces --as system:serviceaccount:namespace:service_account_name
```
2. CrossPlane : 在 CNCF 社区，知名的跨云应用管理与交付平台 Crossplane 项目也已经成为了 OAM 规范的重要采纳者和维护者。
3. OAM (**Open Application Model**) : 开源应用模型


## References
1. [解读容器的 2020：寻找云原生的下一站](https://www.infoq.cn/article/tdfhmcoobjbu2g1a0lbw)