# containerd

1. **cri-containerd** is hosted inside **containerd**.
2. In containerd 1.1, the cri-containerd daemon is now refactored to be a containerd CRI plugin. The CRI plugin is built into containerd 1.1, and enabled by default. Unlike cri-containerd, the CRI plugin interacts with containerd through direct function calls. This new architecture makes the integration more stable and efficient, and eliminates another grpc hop in the stack. Users can now use Kubernetes with containerd 1.1 directly. The cri-containerd daemon is no longer needed.
3. Container Runtime实现了CRI gRPC Server，包括RuntimeService和ImageService。该gRPC Server需要监听本地的Unix socket，而kubelet则作为gRPC Client运行。
4. **Sandboxed Container Technologies**
5. Containerization is a more recent application of virtualization and is also known as **“operating-system-level virtualization”**.
6. **ctr vs crictl** ??
7. Containerd 作为 k8s 容器运行时，调用关系如下：
    ```bash
    kubelet --> cri plugin（在 containerd 进程中） --> containerd

     # /etc/containerd/config.toml
     containerd config default
    ```
8. kubelet parameter: runtime-cgroups when using **containerd** as container runtime:
    ```bash
    #  /sys/fs/cgroup/systemd
    --runtime-cgroups=/system.slice/containerd.service
    ```
9. ff



## References
1. [Containerd Brings More Container Runtime Options for Kubernetes 2017](https://kubernetes.io/blog/2017/11/containerd-container-runtime-options-kubernetes/)
2. [Kubernetes Containerd Integration Goes GA 2018](https://kubernetes.io/blog/2018/05/24/kubernetes-containerd-integration-goes-ga/)
3. [腾讯云: 如何选择 Containerd 和 Docker 2020](https://cloud.tencent.com/document/product/457/35747)
4. [运行时插件 CRI](https://kubernetes.feisky.xyz/extension/cri)  container-runtime-endpoint