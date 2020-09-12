# Kubernetes Client-go library

1. 一个**限速周期**是指从执行AddRateLimited方法到执行完Forget方法之间的时间。如果该元素被Forget方法处理完，则清空排队数。
2. cient-go 是从 k8s 代码中抽出来的一个客户端工具，Informer 是 client-go 中的核心工具包，已经被 kubernetes 中众多组件所使用。所谓 Informer，其实就是一个带有本地缓存和索引机制的、可以注册 EventHandler 的 client，本地缓存被称为 Store，索引被称为 Index。使用 informer 的目的是为了减轻 apiserver 数据交互的压力而抽象出来的一个 cache 层, 客户端对 apiserver 数据的 "读取" 和 "监听" 操作都通过本地 informer 进行。Informer 实例的Lister()方法可以直接查找缓存在本地内存中的数据。



## client-go
1. [kubernetes sample controller github](https://github.com/kubernetes/sample-controller)
2. [Writing custom Kubernetes controller 2018](https://medium.com/@cloudark/kubernetes-custom-controllers-b6c7d0668fdf)
3. [How to Create a Kubernetes Custom Controller Using client-go](https://itnext.io/how-to-create-a-kubernetes-custom-controller-using-client-go-f36a7a7536cc)
4. [Kubernetes Controller Manager 工作原理](https://juejin.im/post/6844904021271003150)
5. [A deep dive into Kubernetes controllers](https://engineering.bitnami.com/articles/a-deep-dive-into-kubernetes-controllers.html)
6. [Kubernetes client-go 库介绍和源码解析](https://github.com/opsnull/kubernetes-dev-docs/tree/master/client-go)

## workqueue
1. [深入浅出 kubernetes 之 WorkQueue 详解](https://xie.infoq.cn/article/63258ead84821bc3e276de1f7)
2. [k8s训练营indexer](https://www.qikqiak.com/k8strain/k8s-code/client-go/indexer/)


## Informer
1. [kubernetes 中 informer 的使用](https://cloud.tencent.com/developer/article/1553566) Greate