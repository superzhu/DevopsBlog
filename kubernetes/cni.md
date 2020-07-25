# CNI(Container Network Interface)

## Linux Network
1. Open vSwitch(OVS) : OVS 是第三方开源的 Bridge，功能比 Linux Bridge 要更强大，对于同样的实验，我们用 OVS 来看看是什么效果。（vs Linux Bridge）
2. eBPF
3. a pair of virtual ethernet devices (**veth pair**)


### Linux Network References
1. [边缘计算中kubernetes网络能大一统吗？](https://www.it610.com/article/1280832903722319872.htm)
2. [Linux 虚拟网络设备 veth-pair 详解，看这一篇就够了](https://www.cnblogs.com/bakari/p/10613710.html) 公众号「Linux云计算网络


## Docker Network

1. docker networking namespace not visible in ip netns list?
```bash
    # To get the PID of a docker container, you can run:
    docker inspect --format '{{.State.Pid}}' <container_name_or_Id>

    # To get a command inside the network namespace of a container:
    nsenter -t <contanier_pid> -n <command>

    nsenter -t 2871 -n ip addr  show
```
2. dd

### Docker Network References
1. [Docker的四种网络模式](https://blog.csdn.net/huanongying123/article/details/73556634)

## Kubernetes Network

1. Vmware Antrea


### Kubernetes network references
1. [99% 的人都不知道的 Kubernetes 网络疑难杂症排查方法](https://juejin.im/post/5d53a12d518825026b36bf33) kube-ipvs0 --dummy interface