# Kubernetes and Istio
    started: 2020-05-11

1. Communication between Kubernetes containers by default is insecure and there is no easy way to enforce TLS between pods as you would end up maintaining hundreds of TLS certificates all by yourself.
2. There are **Kubernetes Ingress objects** which do provide a **reverse proxy** based on layer 7, but they don’t offer anything more.
3. The Envoy proxy interacts with the Citadel to **understand if any policies need enforcing.** It also checks if it needs to encrypt traffic through the chain and establish TLS with the back end pod.
4. **self-hosted or on-premise Kubernetes cluster**
5. Label the namespaces on which you want to **enable Istio to inject sidecar containers automatically.** Start with the default namespace:
```bash
    kubectl label namespace default istio-injection=enabled
```
6. While a **virtual service** matches on a rule and evaluates a destination to route the traffic to, **destination rules** define available subsets of the service to send the traffic. That implies that based on the destination subset selected by the virtual service, Istio would route requests to all microservices pods **labeled with the version specified by the selected subset.**
7. Istio main docker images
    | No | Pod Name | Image Name |
    | ---- | --------------- | ----------------- |
    | 1     | istiod              | istio/pilot:1.6.0  |
    | 2     | istio/proxyv2:1.6.0 | istio-ingressgateistio-egressgateway |
    | 3     | istio-tracing   | jaegertracing/all-in-one:1.16 |
    | 4     | Policy             |   istio/mixer:1.6.0                   |  
8. The new **istioctl** installation commands use a custom resource to configure the installation. 
    ```bash
    # Install Istio using charts in the local file system
    istioctl install --charts istio160/manifests --set profile=default

    istioctl install --set profile=default --set components.pilot.k8s.resources.requests.memory=512Mi

    # uninstall istio
    istioctl manifest generate --charts istio160/manifests --set profile=default | kubectl delete -f -
    ```
9. **Deploy Istio samples to specific namespace**
    ```bash
    kubectl create namespace app2
    kubectl label namespace app2 istio-injection=enabled
    kubectl apply -n app2 -f samples/httpbin/httpbin.yaml

    kubectl get virtualservices
    kubectl get destinationrules 
    kubectl get destinationrules.networking.istio.io --all-namespaces 
    kubectl get gateway
    kubectl get pods

    kubectl get peerauthentication --all-namespaces
    ```
10. 本次**1.6** 版本的发布我个人认为是惊喜不足，失望有余。Mixer 的寿终正寝让中心化的限流、黑白名单这样有用的功能也跟着陪了葬，还未看到要弥补它们的打算。而期待的 Envoy 与 WebAssembly 的强强联手也在本次更新中只字未提。



## Istio Reference
1. [How to Manage Microservices on Kubernetes With Istio medium](https://medium.com/better-programming/how-to-manage-microservices-on-kubernetes-with-istio-c25e97a60a59)
2. [Istio 1.6——迈向极简主义](https://zhuanlan.zhihu.com/p/144535273)
3. [Istio 1.8 --- Istio 中的智能 DNS 代理功能](https://zhuanlan.zhihu.com/p/309679795)


## Istio Operator --- Installation
1. [Introducing the Istio Operator](https://istio.io/blog/2019/introducing-istio-operator/)
2. [深入了解服务网格数据平面性能和调优](https://mp.weixin.qq.com/s?__biz=MzI5ODQ2MzI3NQ==&mid=2247492399&idx=1&sn=b03545e2cd1cb5645012f93ef146a049&chksm=eca7da6bdbd0537dac47c449e8aa0352665cc4413c1e4f2f5c2089551d63c9ce9700b6680eaf&scene=126&sessionid=1598666199&key=e443dc0adec41de4fa3fd1bbe34fd965bafc7279f0d30857fa21f80135c013323166ab62e27df8b2c1472c95bd71a517b89b950aa8ee88cdc4cacca965721d075ae9cbfa8a2b73c2f7de42400ce56965d8f32c40b59cbc57a70a3954a057c96a8ffb9fa946e663a78115ca597e2cfca04eacc27febb887de90cbb4cb64add5d8&ascene=1&uin=MTgyNzM2NTQxOA%3D%3D&devicetype=Windows+10+x64&version=62090529&lang=zh_CN&exportkey=AxKcGiZSoDpOlA1clOOuM9U%3D&pass_ticket=1wkdBPq9yoFrcRbFqnCManIeNaVDcECAKylPP0PPY1EVTsc11pCF9kC3YFTF8128)


# Multi-cluster deployment
1. [如何使用 Istio 进行多集群部署管理：多控制平面](https://zhuanlan.zhihu.com/p/144510796)
2. [Istio Service Mesh on Multi-Cluster Kubernetes Environment](https://medium.com/better-programming/istio-service-mesh-on-multi-cluster-kubernetes-environment-518094cdcdc4)

# Istio & iptables
1. [Demystifying Istio's Sidecar Injection Model](https://istio.io/blog/2019/data-plane-setup/)
2. [Tricking Istio into ignoring inbound packets](https://jpittis.ca/posts/tricking-istio-with-iptables.html)
3. [Understanding How Envoy Sidecar Intercept and Route Traffic in Istio Service Mesh](https://medium.com/faun/understanding-how-envoy-sidecar-intercept-and-route-traffic-in-istio-service-mesh-20fea2a78833)
4. [Reducing needed permissions in Istio](https://itnext.io/slashing-needed-permissions-in-istio-f05fe145698d)