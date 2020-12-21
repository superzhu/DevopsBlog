# kubelet
1. kubelet重点参数：
   1. **--cgroups-per-qos**：默认 true，启用新的 cgroup 层次结构，启用 QoS 和 Pod 级别的 **cgroups kubepods**.
2.  **Resource requests** are important at schedule time, and **resource limits** are important at run time.
3.  One of my goals here is to show **how resource limits** are implemented in the system, as **kubernetes delegates to the container runtime** (docker/containerd in this case), and the **container runtime delegates to the linux kernel**. 
4.  CNI plug-ins are divided into three implementation modes: Overlay, Routing, and Underlay.



## References
1. [Adding support for QoS cgroup Hierarchy and Pod level resource management in Kubelet #27204](https://github.com/kubernetes/kubernetes/issues/27204)
2. [Understanding resource limits in kubernetes: memory 2018](https://medium.com/@betz.mark/understanding-resource-limits-in-kubernetes-memory-6b41e9a955f9)
3. [Kubernetes Doc : Configure Quality of Service for Pods](https://kubernetes.io/docs/tasks/configure-pod-container/quality-service-pod/) 
4. [Getting Started with Kubernetes | Kubernetes CNIs and CNI Plug-ins](https://alibaba-cloud.medium.com/getting-started-with-kubernetes-kubernetes-cnis-and-cni-plug-ins-10c33e44ac88)
5. [How a Kubernetes Pod Gets an IP Address](https://ronaknathani.com/blog/2020/08/how-a-kubernetes-pod-gets-an-ip-address/)