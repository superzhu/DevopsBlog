# Kubernetes Client-go library

1. 一个**限速周期**是指从执行AddRateLimited方法到执行完Forget方法之间的时间。如果该元素被Forget方法处理完，则清空排队数。
2. cient-go 是从 k8s 代码中抽出来的一个客户端工具，Informer 是 client-go 中的核心工具包，已经被 kubernetes 中众多组件所使用。所谓 Informer，其实就是一个带有本地缓存和索引机制的、可以注册 EventHandler 的 client，本地缓存被称为 Store，索引被称为 Index。使用 informer 的目的是为了减轻 apiserver 数据交互的压力而抽象出来的一个 cache 层, 客户端对 apiserver 数据的 "读取" 和 "监听" 操作都通过本地 informer 进行。Informer 实例的Lister()方法可以直接查找缓存在本地内存中的数据。
3. Reflector 通过 ListAndWatch 把数据传入 DeltaFIFO 后，经过 DeltaFIFO 的 Pop 函数将资源对象存入到了本地的一个存储 Indexer 中，而这个底层真正的存储其实就是上面的 ThreadSafeStore
4. Indexer 中几个非常重要的概念：**Indices、Index、Indexers 及 IndexFunc** 索引、索引器（索引分类）、索引键、对象键 :
    1.  type IndexFunc func(obj interface{}) ([]string, error),  用于计算一个对象的索引键集合
    2.  type Index map[string]sets.String, 索引键与对象键集合的映射
    3.  type Indexers map[string]IndexFunc, 索引器名称（或者索引分类）与 IndexFunc 的映射，相当于存储索引的各种分类
    4.  type Indices map[string]Index,   **索引器名称(indexName)** 与 Index 索引的映射
5. Informers 是这个事件接口和带索引查找功能的内存缓存的组合，这样也是目前最常用的用法。Informers 第一次被调用的时候会首先在客户端调用 List 来获取全量的对象集合，然后通过 Watch 来获取增量的对象更新缓存。
6. EventRecorder：事件（Event）生产者，也称为事件记录器Kubernetes系统组件通过EventRecorder记录关键性事件。
    1.  EventBroadcaster：事件（Event）消费者，也称为事件广播器。EventBroadcaster消费EventRecorder记录的事件并将其分发给目前所有已连接的broadcasterWatcher。分发过程有两种机制，分别是非阻塞（Non-Blocking）分发机制和阻塞（Blocking）分发机制。
    2.  broadcasterWatcher：观察者（Watcher）管理，用于定义事件的处理方式，例如上报事件至Kubernetes API Server。
7. You can think of **custom resources** as the data, and **controllers** as the logic behind the data. Working together, they are a significant component to extending Kubernetes.
8. What is the difference between re-list and resync?
   1. re-list re-fetches current items from the apiserver and adds them to the store, 
      resulting in Add events for new items, Delete events for removed items, and Update
      events for all existing items
   2. resync sends Update events for all items currently in the store
9. ff



## client-go
1. [kubernetes sample controller github](https://github.com/kubernetes/sample-controller)
2. [Writing custom Kubernetes controller 2018](https://medium.com/@cloudark/kubernetes-custom-controllers-b6c7d0668fdf)
3. [How to Create a Kubernetes Custom Controller Using client-go 2019](https://itnext.io/how-to-create-a-kubernetes-custom-controller-using-client-go-f36a7a7536cc)
4. [Kubernetes Controller Manager 工作原理](https://juejin.im/post/6844904021271003150)
5. [A deep dive into Kubernetes controllers 2018](https://engineering.bitnami.com/articles/a-deep-dive-into-kubernetes-controllers.html)
6. [Kubernetes client-go 库介绍和源码解析](https://github.com/opsnull/kubernetes-dev-docs/tree/master/client-go)

## workqueue
1. [深入浅出 kubernetes 之 WorkQueue 详解](https://xie.infoq.cn/article/63258ead84821bc3e276de1f7)
2. [k8s训练营indexer](https://www.qikqiak.com/k8strain/k8s-code/client-go/indexer/)


## Informer
1. [kubernetes 中 informer 的使用](https://cloud.tencent.com/developer/article/1553566) Great
2. [Extending Kubernetes - Create Controllers for Core and Custom Resources](https://trstringer.com/extending-k8s-custom-controllers/)


## Kubernetes Events
1. [Kubernetes(K8s)Events介绍（上）](https://www.kubernetes.org.cn/1031.html)
2. [Client-go之tools（EventBroadcaster](https://blog.csdn.net/weixin_45413603/article/details/108204904)
3. [Kubernetes Event 事件源码解析](http://www.penguincj.com/post/cloud/k8s/201908-k8s-event/)  blockQueue 解释/设计思想
4. [kubelet 源码分析： 事件处理](https://cizixs.com/2017/06/22/kubelet-source-code-analysis-part4-event/)