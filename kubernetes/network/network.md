# Network Concepts

1. **East-West – East-West refers to traffic** flows that occur between devices within a datacenter. During convergence for example, routers exchange table information to ensure they have the same information about the internetwork in which they operate. Another example are switches, which can exchange spanning-tree information to prevent network loops.
2. **North | South – North- South refers to traffic** flows into and out of the datacenter. Traffic entering the datacenter through perimeter network devices is said to be southbound. Traffic exiting via the perimeter network devices is said to be northbound.
3. **Switches** receive frames on one port and forward the frames out the port **where the destination device can be found.** (交换机在一个端口上接收帧，然后将帧转发到可以找到目标设备的端口。)
4. Unix domain socket : Unix domain socket 又叫 IPC(inter-process communication 进程间通信) socket，用于实现同一主机上的进程间通信。socket 原本是为网络通讯设计的，但后来在 socket 的框架上发展出一种 IPC 机制，就是 UNIX domain socket。虽然网络 socket 也可用于同一台主机的进程间通讯(通过 loopback 地址 127.0.0.1)，但是 UNIX domain socket 用于 IPC 更有效率：不需要经过网络协议栈，不需要打包拆包、计算校验和、维护序号和应答等，只是将应用层数据从一个进程拷贝到另一个进程。这是因为，IPC 机制本质上是可靠的通讯，而网络协议是为不可靠的通讯设计的。
    ```bash
    # List active Unix domain socket
    netstat -l -p

    ss -a --unix -p
    ```
5. One way to think about **sockets is that they open up a communication channel** where both sides can read and write. There are two main domains of sockets: **Unix domain sockets**, which allow processes on the same computer to communicate (IPC), and **Internet domain sockets**, which allow processes to communicate over a network.
6. ff


## References
1. [east-west traffic](https://searchnetworking.techtarget.com/definition/east-west-traffic)
2. [Tip of the Day: Demystifying Software Defined Networking Terms – The Cloud Compass: SDN Data Flows](https://blogs.technet.microsoft.com/tip_of_the_day/2016/06/29/tip-of-the-day-demystifying-software-defined-networking-terms-the-cloud-compass-sdn-data-flows/)
3. [一文讲懂什么是vlan、三层交换机、网关、DNS、子网掩码、MAC地址](https://mp.weixin.qq.com/s?__biz=MzAxNTcyNzAyOQ==&mid=2650962162&idx=1&sn=b1f2e8ea0ef20d93727b2d963dbaac0b&chksm=80097828b77ef13e2e29653b062ff59606981dfa48e0b5738786f26fca3acd586afe754d1f2e&scene=126&sessionid=1595496352&key=21e9f95ec34ef562d10efb31b24f6e00e68c119dafc8fcc1eaea05775e53e0315510edbc94a6f4ff961ae616543e76118ce248c117c03539499bc8dcf0e4d52bfe50aa54ccf37737f0456c0da55466ba&ascene=1&uin=MTgyNzM2NTQxOA%3D%3D&devicetype=Windows+10+x64&version=62090529&lang=zh_CN&exportkey=A5TbMuEOJ6dMQrhGC8F6Dc8%3D&pass_ticket=Z2mMKM1ytUq4iz3rawCJV%2B5wZplO0Qd%2B7ey3sZ3uATqp4bYzUonTaxSdepNDeGt1)
4. [**Netfilter packet flow**](https://upload.wikimedia.org/wikipedia/commons/3/37/Netfilter-packet-flow.svg)
5. [网络基本功系列](https://itbook.xuxinkai.cn/read/network-basic/1.md) Great


## Kubernetes
1. [What is the konnectivity service for Kubernetes?](https://github.com/kubernetes/enhancements/blob/master/keps/sig-api-machinery/20190226-network-proxy.md) design doc