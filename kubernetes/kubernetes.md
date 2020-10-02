# Kubernetes Develop

<p>Kubernetes development-related documents</p>

1. book kubebuilder <https://book.kubebuilder.io/introduction.html>
2. controller runtime/zap/g++ => c++ compiler gcc => c compiler
3. Host-Reachable Services (Cilium)
4. Controller Manager 就是集群内部的管理控制中心，由负责不同资源的多个 Controller 构成，共同负责集群内的 Node、Pod 等所有资源的管理
5. vmware open source ingress controller: contour
6. [kubernetes conntract example](https://www.digitalocean.com/community/tutorials/how-to-inspect-kubernetes-networking)
7. Kubernetes also makes extensive use of **IPTABLES and NAT** to intercept traffic going to a logical/virtual address and route it to the appropriate physical destination.
8. Now, **kube-proxy is just a controller**, like many other controllers in Kubernetes, that watches the api server for endpoints changes and updates the **iptables rules accordingly**. [An illustrated guide to Kubernetes Networking Part 3](https://itnext.io/an-illustrated-guide-to-kubernetes-networking-part-3-f35957784c8e)
9. perform generic operations on arbitrary Kubernetes API objects : 可以对任意Kubernetes API对象执行通用操作
10. Understanding how the Kubernetes scheduler makes scheduling decisions is critical in order to ensure consistent performance and optimal resource utilization --- 为了确保一致的性能和最佳的资源利用率，了解Kubernetes调度程序如何制定调度决策至关重要。

## Development Environment Setup
1. [Kubernetes 开发指南](https://developer.ibm.com/zh/articles/os-kubernetes-developer-guide/)
2. [细述kubernetes开发流程](https://www.cnblogs.com/linuxprobe-sarah/p/10860273.html)
3. [Setup guide for Kubernetes developers 2020](https://developer.ibm.com/components/kubernetes/articles/setup-guide-for-kubernetes-developers/)
4. [云原生实践-kubernetes源码本地IDE编译调试](https://www.daimajiaoliu.com/daima/4edeaa21e900400)
5. [Debugging Kubernetes (using GoLand IDE)](https://xmudrii.com/posts/debugging-kubernetes/)
6. [The process of developing and contributing code to the Kubernetes project](https://github.com/kubernetes/community/tree/master/contributors/devel#readme) 重要
7. [kubernetes github workflow](https://github.com/kubernetes/community/blob/master/contributors/guide/github-workflow.md)
8. [Makefile教程（绝对经典，所有问题看这一篇足够了）](https://blog.csdn.net/weixin_38391755/article/details/80380786)

## OpenAPI Specification
1. [OpenAPI Specification](https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md)
2. [OpenAPI v3.1 and JSON Schema 2019-09](https://apisyouwonthate.com/blog/openapi-v31-and-json-schema-2019-09)


## kubernetes core components
1. [Kubernetes Controller Manager 工作原理](http://dockone.io/article/9557)
2. [详解 Kubernetes Deployment 的实现原理 2019](https://draveness.me/kubernetes-deployment/)
3. [图解 Kubernetes Deployment Controller 工作原理与流程](https://juejin.im/post/5df8e971f265da3393098741#heading-1)
4. [A deep dive into Kubernetes controllers](https://engineering.bitnami.com/articles/a-deep-dive-into-kubernetes-controllers.html)
5. [Understanding Kubernetes Kube-Proxy](https://cloud.tencent.com/developer/article/1501772)
6. [**Cracking kubernetes kube-proxy**](https://arthurchiao.art/blog/cracking-k8s-node-proxy/)
7. [[Kubernetes] Kubernetes核心原理（四）之kubelet](https://www.huweihuang.com/article/kubernetes/core-principle/kubernetes-core-principle-kubelet/)
8. [详解 Kubernetes Pod 的实现原理](https://www.infoq.cn/article/fmTSPqdyx0AFjMsrmNvG?utm_source=related_read_bottom&utm_medium=article)
9. [kubelet 架构浅析](https://zhuanlan.zhihu.com/p/111241825)
10. [进击的Kubernetes调度系统：Kubernetes scheduling framework](https://zhuanlan.zhihu.com/p/158069604)
11. [Beyond Kube-scheduler, a Need for a K8s Cluster Balancer](https://medium.com/sparsecode/beyond-kube-scheduler-a-need-for-a-k8s-cluster-balancer-89cdfb242e09)

## kubernetes networks
1. [kubernetes networking links github](https://github.com/nleiva/kubernetes-networking-links)

## kubecon

## [Kubernetes Cloud Controller Manager](https://zhuanlan.zhihu.com/p/186965991)
1. 在OpenStack顶部运行Kubernetes的关键组件之一是Cloud Controller Manager。这是将两个平台粘合在一起的部件之一。对于那些使用托管Kubernetes服务的人来说，在某个地方的公共云（或私有云）中，已经为您解决了这一问题。
2. A Pod Object is bound to a Node Object if the Pod's .Spec.NodeName equals the Node's .Name


## Kubernetes Hierarchical Namespace Controller
1. [Rethinking Kubernetes Namespaces with the Hierarchical Namespace Controller -Part 1](https://medium.com/sainsburys-engineering/rethinking-kubernetes-namespaces-with-the-hierarchical-namespace-controller-part-1-9f3a32eecaa2)