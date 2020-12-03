# Network Concepts

1. **East-West – East-West refers to traffic** flows that occur between devices within a datacenter. During convergence for example, routers exchange table information to ensure they have the same information about the internetwork in which they operate. Another example are switches, which can exchange spanning-tree information to prevent network loops.
2. **North | South – North- South refers to traffic** flows into and out of the datacenter. Traffic entering the datacenter through perimeter network devices is said to be southbound. Traffic exiting via the perimeter network devices is said to be northbound.
3. **Switches** receive frames on one port and forward the frames out the port **where the destination device can be found.** (交换机在一个端口上接收帧，然后将帧转发到可以找到目标设备的端口。)


## References
1. [east-west traffic](https://searchnetworking.techtarget.com/definition/east-west-traffic)
2. [Tip of the Day: Demystifying Software Defined Networking Terms – The Cloud Compass: SDN Data Flows](https://blogs.technet.microsoft.com/tip_of_the_day/2016/06/29/tip-of-the-day-demystifying-software-defined-networking-terms-the-cloud-compass-sdn-data-flows/)
3. [一文讲懂什么是vlan、三层交换机、网关、DNS、子网掩码、MAC地址](https://mp.weixin.qq.com/s?__biz=MzAxNTcyNzAyOQ==&mid=2650962162&idx=1&sn=b1f2e8ea0ef20d93727b2d963dbaac0b&chksm=80097828b77ef13e2e29653b062ff59606981dfa48e0b5738786f26fca3acd586afe754d1f2e&scene=126&sessionid=1595496352&key=21e9f95ec34ef562d10efb31b24f6e00e68c119dafc8fcc1eaea05775e53e0315510edbc94a6f4ff961ae616543e76118ce248c117c03539499bc8dcf0e4d52bfe50aa54ccf37737f0456c0da55466ba&ascene=1&uin=MTgyNzM2NTQxOA%3D%3D&devicetype=Windows+10+x64&version=62090529&lang=zh_CN&exportkey=A5TbMuEOJ6dMQrhGC8F6Dc8%3D&pass_ticket=Z2mMKM1ytUq4iz3rawCJV%2B5wZplO0Qd%2B7ey3sZ3uATqp4bYzUonTaxSdepNDeGt1)
4. [**Netfilter packet flow**](https://upload.wikimedia.org/wikipedia/commons/3/37/Netfilter-packet-flow.svg)


## Kubernetes
1. [What is the konnectivity service for Kubernetes?](https://github.com/kubernetes/enhancements/blob/master/keps/sig-api-machinery/20190226-network-proxy.md) design doc