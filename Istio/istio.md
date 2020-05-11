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
6. While a **virtual service** matches on a rule and evaluates a destination to route the traffic to, **destination rules** define available subsets of the service to send the traffic.



## Istio Reference
1. [How to Manage Microservices on Kubernetes With Istio medium](https://medium.com/better-programming/how-to-manage-microservices-on-kubernetes-with-istio-c25e97a60a59)