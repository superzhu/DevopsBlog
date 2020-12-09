# containerd

1. **cri-containerd** is hosted inside **containerd**.
2. In containerd 1.1, the cri-containerd daemon is now refactored to be a containerd CRI plugin. The CRI plugin is built into containerd 1.1, and enabled by default. Unlike cri-containerd, the CRI plugin interacts with containerd through direct function calls. This new architecture makes the integration more stable and efficient, and eliminates another grpc hop in the stack. Users can now use Kubernetes with containerd 1.1 directly. The cri-containerd daemon is no longer needed.
3. Container Runtime实现了CRI gRPC Server，包括RuntimeService和ImageService。该gRPC Server需要监听本地的Unix socket，而kubelet则作为gRPC Client运行。
4. **Sandboxed Container Technologies**
5. Containerization is a more recent application of virtualization and is also known as **“operating-system-level virtualization”**.
6. **ctr vs crictl** ??



## References
1. [Containerd Brings More Container Runtime Options for Kubernetes 2017](https://kubernetes.io/blog/2017/11/containerd-container-runtime-options-kubernetes/)
2. [Kubernetes Containerd Integration Goes GA 2018](https://kubernetes.io/blog/2018/05/24/kubernetes-containerd-integration-goes-ga/)