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
8. The new **istioctl** installation commands use a custom resource to configure the installation. 
    ```bash
    # Install Istio using charts in the local file system
    istioctl install --charts istio160/manifests --set profile=default

    # uninstall istio
    istioctl manifest generate --charts istio160/manifests --set profile=default | kubectl delete -f -
    ```
9. ff



## Istio Reference
1. [How to Manage Microservices on Kubernetes With Istio medium](https://medium.com/better-programming/how-to-manage-microservices-on-kubernetes-with-istio-c25e97a60a59)


## Istio Operator --- Installation
1. [Introducing the Istio Operator](https://istio.io/blog/2019/introducing-istio-operator/)