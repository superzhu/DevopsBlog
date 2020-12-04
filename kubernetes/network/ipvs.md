# LVS (Linux Virtual Server) / IPVS(IP Virtual Server)

1. LVS的结构主要分为两部分:
   1. 工作在内核空间的IPVS模块。LVS的能力实际上都是由IVPS模块实现。
   2. 工作在用户空间的ipvsadm管理工具。其作用是向用户提供一个命令接口，用于将配置的虚拟服务、真实服务等传给IPVS模块。
2. ipvs 和iptables 都是**基于netfilter的**。ipvs 会使用 iptables 进行包过滤、SNAT、masquared。
3. IP隧道（IP tunneling）是将一个IP报文封装在另一个IP报文的技术，这可以使得目标为一个IP地址的数据报文能被封装和转发到另一个IP地址。IP隧道技 术亦称为IP封装技术（IP encapsulation）。IP隧道主要用于移动主机和虚拟私有网络（Virtual Private Network），在其中隧道都是静态建立的，隧道一端有一个IP地址，另一端也有唯一的IP地址。

# ipvsadm / IPVS
1. ipvsadm related commands
    ```bash
    #  generate a virtual server:
    ipvsadm -A -t 10.131.208.21:80 -s rr

    # Add a real server with masquerading
    ipvsadm -a -t 10.131.208.21:80 -r 192.168.0.5 -w 1 -m

    # Edit the real server without specifying the -m
    ipvsadm -e -t 10.131.208.21:80 -r 192.168.0.5 -w 0 -m

    # Delete virtual service
    ipvsadm -D -t 10.131.208.21:80

    # Show stats
    ipvsadm -L -n --stats --rate
    ```
2. ipvsadm **Used to set, maintain or check the virtual server table in the Linux kernel**. Linux virtual servers can be used to build scalable network services based on clusters of two or more nodes. The active node of the cluster redirects service requests to the server host collection that will actually perform the service. Supported functions include two protocols (TCP and UDP), three packet forwarding methods (NAT, tunneling, and direct routing), and eight load balancing algorithms (weighted round robin, minimum connection, weighted minimum connection, location-based minimum connection, Location-based minimal connection with replication, target hash, and source hash).
3. ff

## ipvsadm references
1. [Building a Load Balancer with LVS - Linux Virtual Server](http://www.linux-admins.net/2013/01/building-load-balancer-with-lvs-linux.html)
2. [Ipvsadm command reference](https://www.programmersought.com/article/9104230176/)
3. [k8s集群中ipvs负载详解](https://www.jianshu.com/p/89f126b241db?utm_campaign=maleskine&utm_content=note&utm_medium=seo_notes&utm_source=recommendation)  Great
4. [Cracking kubernetes node proxy (aka kube-proxy)](https://arthurchiao.art/blog/cracking-k8s-node-proxy/#ch_6)
5. [lvs documentation](http://www.linuxvirtualserver.org/Documents.html)


# ipset
1. IP sets are a framework inside the Linux kernel, which can be administered by the **ipset utility**. Depending on the type, an IP set may store IP addresses, networks, (TCP/UDP) port numbers, MAC addresses, interface names or combinations of them in a way, which ensures lightning speed when matching an entry against a set.
2. ff


## ipset references
1. [ipset man page](https://ipset.netfilter.org/ipset.man.html)


# iptables
1. **iptables process flow**
    ![iptables process flow](images/iptables.png)
2. ff

## iptables references
1. [iptables详解及一些常用规则](https://www.jianshu.com/p/ee4ee15d3658)
2. [Packet flow in Netfilter and General Networking](https://upload.wikimedia.org/wikipedia/commons/3/37/Netfilter-packet-flow.svg)