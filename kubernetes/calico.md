# Project Calico

1. **How to trace packet flow?**
   1. Create a kubernetes cluster with calico network plugin.
   2. Create 2 pods in the same node or different nodes.
   3. Go inside one of the pod and curl the ip of the other pod.
   4. At the same time, collect the tcpdump data on all the interfaces (pod's eth0, caliXXX interfaces and the tunl0 interface).
2. tcpdump -i eth0 -n -s0 -e
3. 看完 calico 的报文流程，大致也能分析出 calico 做的事情：
   1. 分配和管理 IP
   2. 配置上容器的 veth pair 和容器内默认路由
   3. 根据集群网络情况实时更新节点上路由表
4. Essentially, the Bird process talks to the BGP neighbor and imports all the advertised prefixes into its internal routes list. It also talks with the kernel and "exports to the kernel" all the routes it knows—that is, all the ones learned over BGP. That way, it feeds the kernel routing table from the BGP.
5. 查看calico node状态：
```bash
kubectl exec -it pods/calico-node-njfnr -n kube-system -- sh

ps aux
```
6. ff


## Calico References
1. [pod to pod communication in same node does not follow expected route](https://github.com/projectcalico/calico/issues/2160) Great
2. [An Introduction to Calico: Container Networking at Scale 2019](https://www.exoscale.com/syslog/calico-introduction/) Great
3. [Kubernetes Networking with Calico 2019](https://www.tigera.io/blog/kubernetes-networking-with-calico/)
4. [**docker 容器网络方案：calico 网络模型**](https://cizixs.com/2017/10/19/docker-calico-network/) 非常重要