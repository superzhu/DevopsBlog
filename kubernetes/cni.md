# CNI(Container Network Interface)

## Linux Network
1. Open vSwitch(OVS) : OVS 是第三方开源的 Bridge，功能比 Linux Bridge 要更强大，对于同样的实验，我们用 OVS 来看看是什么效果。（vs Linux Bridge）
2. eBPF : eBPF 是 Linux 内核近几年最为引人注目的特性之一，通过一个内核内置的字节码虚拟机，完成**数据包过滤、调用栈跟踪、耗时统计、热点分析**等高级功能
3. VXLAN (Virtual eXtensible Local Area Network) : VXLAN（虚拟可扩展局域网）
4. a pair of virtual ethernet devices (**veth pair**); The VETH (virtual Ethernet) device is a **local Ethernet tunnel**. Devices are created in pairs
5. A **Linux bridge** behaves like a network switch. It forwards packets between interfaces that are connected to it --- **Linux网桥**的行为类似于网络交换机。 它在与其连接的接口之间转发数据包
6. 处于同一网段（在同一个二层网络中）
7. Network tunneling means hiding protocol (VXLAN) within another protocol (TCP/IP) : 网络隧道意味着将协议（VXLAN）隐藏在另一个协议（TCP / IP）中


### Linux Network References
1. [边缘计算中kubernetes网络能大一统吗？](https://www.it610.com/article/1280832903722319872.htm)
2. [Linux 虚拟网络设备 veth-pair 详解，看这一篇就够了](https://www.cnblogs.com/bakari/p/10613710.html) 公众号「Linux云计算网络
3. **[Why is the kernel community replacing iptables with BPF?](https://cilium.io/blog/2018/04/17/why-is-the-kernel-community-replacing-iptables/)**
4. [Introduction to Linux interfaces for virtual networking](https://developers.redhat.com/blog/2018/10/22/introduction-to-linux-interfaces-for-virtual-networking/)
5. [深入理解 Linux eBPF：一个完整阅读清单](https://blog.csdn.net/21cnbao/article/details/95585483)


## Docker Network

1. docker networking namespace not visible in ip netns list?
```bash
    # To get the PID of a docker container, you can run:
    docker inspect --format '{{.State.Pid}}' <container_name_or_Id>

    # To get a command inside the network namespace of a container:
    nsenter -t <contanier_pid> -n <command>

    nsenter -t 2871 -n ip addr  show

    ls -l /proc/{pid}/ns
```
2. Grab docker process id based on specified pattern
```bash
    docker inspect $(docker ps -a | awk '/calico-node/ { print $1}') --format '{{ .State.Pid }}'
```
3. ff

### Docker Network References
1. [Docker的四种网络模式](https://blog.csdn.net/huanongying123/article/details/73556634)

## Kubernetes Network

1. Vmware Antrea
2. The **Kubelet** in each node will tell the container runtime what Network plugin to use. The Container Network Interface (CNI) sits in the middle between the container runtime and the network implementation. Only the **CNI-plugin configures the network**.


### Kubernetes network references
1. [99% 的人都不知道的 Kubernetes 网络疑难杂症排查方法](https://juejin.im/post/5d53a12d518825026b36bf33) kube-ipvs0 --dummy interface
2. [Kubernetes network plugins 2019](https://medium.com/@ahmetensar/kubernetes-network-plugins-abfd7a1d7cac)
3. [kubernetes network plugins](https://kubernetes.io/docs/concepts/extend-kubernetes/compute-storage-net/network-plugins/#network-plugin-requirements)
4. [Kubernetes Networking: How to Write Your Own CNI Plug-in with Bash](https://www.altoros.com/blog/kubernetes-networking-writing-your-own-simple-cni-plug-in-with-bash/)