# CoreDNS Concepts
1. **域和域名** : 域名不区分大小. 由最顶层到下层,可以分成:根域、顶级域、二级域、子域.
2. 区（Zone）：区是DNS 名称空间的一部分,其包含了一组存储在DNS 服务器上的资源记录.使用区的概念,DNS 服务器回答关于自己区中主机的查询,每个区都有自己的**授权服务器**. A **zone** is a domain minus the subdomains that have been delegated elsewhere. What if there’s no delegation within a domain? In that case, **the domain and the zone** contain the same nodes. For example, if there’s no further delegation below **cs.berkeley.edu**, the domain cs.berkeley.edu and the zone cs.berkeley.edu are effectively the same
3. plug-in for configuring a primary DNS server that reads **zone data** from a file : 用于配置从文件读取**区数据**的主DNS服务器的插件
4. **Forwarders** are often used to provide the ability to resolve domain names in the internet’s namespace to DNS servers without direct connectivity to the internet: the “internal” DNS servers are configured to use a DNS server with internet connectivity as a **forwarder**.
5. **DNS root hints file**
6. [DNS Negative caching的恰当理解](https://www.xieyidian.com/803) : 简单来说，当客户端尝试通过DNS解析某个域名但解析失败后，客户端依然会在自己的缓存中记录相关的信息，但这里记录的并非解析结果，而是”Negative caching”。这样当客户端尝试再次访问不存在的域名时，因为本地的DNS缓存中已经有了相关的Negative caching记录，因此客户端不会频繁尝试通过DNS进行解析。
7. To specify a **server block** that will apply to all queries, use the **root as the label** :
    ```bash
    . {
        # directives go here
      }
    ```
8. 起始授权机构(SOA, Start Of Authority)的资源记录，描述了域名的管理员、电子邮件地址，和一些时间参数
9. Dig DNS records
  ```bash
  # type A record
  dig @172.16.0.10 -t a node-exporter.monitoring.svc.cluster.local

  # type SRV record
  dig @172.16.0.10 -t srv  _https._tcp.node-exporter.monitoring.svc.cluster.local

  # type PTR record: dig -x IP_ADDRESS
  dig @172.16.0.10 -x 172.16.110.17

  # local coredns
  coredns -conf /etc/coredns/Corefile
  dig @192.168.1.117 -p 153 www.baidu.com
  dig @192.168.1.117 -p 153 dellops.bizconf.cn
  ```
10. stub domains and federation : 存根域和联盟; The **STUBDOMAINS variable** is used to populate **additional server stanzas (server block)** when you want to resolve specific domains using name servers --- 当您要使用名称服务器解析特定域时，将STUBDOMAINS变量用于填充其他服务器节。
11. CoreDNS health check :
  ```bash
  # controlled by health plugin. It opens an HTTP server on port 8080,which will respond to an HTTP request for /health.
  curl http://10.200.102.75:8080/health

  # ready plugin
  curl http://10.200.102.75:8181/ready
  ```
12. Run **dnstools**
    ```bash
    helm upgrade coredns ./coredns --debug --install --namespace=kube-system --dry-run
    kubectl run -it --rm --restart=Never --image=infoblox/dnstools:latest dnstools

    # tools: host, nslookup, traceroute, ping
    dig @192.168.1.1 -t a alpha-zoom.bizconf.cn
    ```
13. Kubernetes pods: dnspolicy/dnsconfig
14. Ubuntu 18.04 dns-related configurations
    ```bash
    # 1 /etc/systemd/resolved.conf

    # 2 /run/systemd/resolve/resolv.conf

    # 3 ln -sf /run/systemd/resolve/resolv.conf /etc/resolv.conf

    systemd-resolve --status

    systemctl status systemd-resolved
    ```
15. **How to get tcpdump for container inside Kubernetes**?
```bash
# find the kube node of the running pod, appear next to hostIP, and note containerID hash
kubectl get pod mypod -o json
# -> save hostIP
# -> save containerID

# connect to the node and find the pods unique network interface index inside it's container
docker exec containerID /bin/sh -c 'cat /sys/class/net/eth0/iflink'
# -> returns index

# locate the interface of the node
ip link |grep ^index:
# -> returns interface

# then GO tcpdump !
tcpdump -i interface

tcpdump -i interface port 53

tcpdump –i 1 –v –c2 –w capture.out
```
16. How can I list all kubernetes DNS records?

17. Get logs of coredns pods?
```bash
kubectl logs --namespace=kube-system -l k8s-app=kube-dns

kubectl get endpoints kube-dns --namespace=kube-system
```

18. Adjust the number of CoreDNS pods (cluster-proportional-autoscaler)
```bash
kubectl scale --replicas={target} deployment/coredns -n kube-system

The equation of linear control mode as below (cluster-proportional-autoscaler):

replicas = max( ceil( cores * 1/coresPerReplica ) , ceil( nodes * 1/nodesPerReplica ) )
replicas = min(replicas, max)
replicas = max(replicas, min)
```

# CoreDNS Performance
1. DNS自身的性能（qps）和DNS解析的延迟。
2. 

## References
1. [Run Your Own Home DNS on coredns](https://blog.idempotent.ca/2018/04/18/run-your-own-home-dns-on-coredns/)
2. [Running CoreDNS as a DNS Server in a Container](https://dev.to/robbmanes/running-coredns-as-a-dns-server-in-a-container-1d0)
3. [RUNNING COREDNS FOR LAB NAME RESOLUTION](https://www.definit.co.uk/2020/01/running-coredns-for-lab-name-resolution/)
4. [How to Set Up a Local DNS Resolver on Ubuntu 18.04, 16.04 with BIND9](https://www.linuxbabe.com/ubuntu/set-up-local-dns-resolver-ubuntu-18-04-16-04-bind9)
5. [详解 DNS 与 CoreDNS 的实现原理](https://draveness.me/dns-coredns/)
6. [使用CoreDNS作为你的内网DNS服务器](https://www.iamle.com/archives/2679.html)
7. [coredns搭建三级域名解析服务](https://www.opposhore.com/blog/subdomain_coredns/)
8. [使用CoreDNS搭建无污染DNS](https://laod.cn/dns/coredns-dns.html)
9. [使用 CoreDNS 来应对 DNS 污染](https://fuckcloudnative.io/posts/install-coredns-on-macos/)
10. [DNS服务器搭建与配置 bind](https://cshihong.github.io/2018/10/15/DNS%E6%9C%8D%E5%8A%A1%E5%99%A8%E6%90%AD%E5%BB%BA%E4%B8%8E%E9%85%8D%E7%BD%AE/)
11. [36 张图详解 DNS ：网络世界的导航](https://mp.weixin.qq.com/s/9wRVEO2-jmdBFTtb7Q7dtQ)


## CoreDNS adding custom DNS record
1. [Customizing DNS Service](https://kubernetes.io/docs/tasks/administer-cluster/dns-custom-nameservers/)
2. [Custom DNS Entries For Kubernetes](https://coredns.io/2017/05/08/custom-dns-entries-for-kubernetes/)
3. [How Queries Are Processed in CoreDNS](https://coredns.io/2017/06/08/how-queries-are-processed-in-coredns/)
4. [Kuberneres doc: DNS for Services and Pods](https://kubernetes.io/docs/concepts/services-networking/dns-pod-service/)
5. [从dig命令理解DNS](https://blog.csdn.net/a583929112/article/details/66499771) Great
6. [How to configure a Linux host to resolve and access Kubernetes services by name](https://carlos-algms.medium.com/how-to-configure-a-linux-host-to-resolve-and-access-kubernetes-services-by-name-e1741e1247bd)

## Container tcpdump
1. [How to get tcpdump for containers inside Kubernetes pods](https://community.pivotal.io/s/article/How-to-get-tcpdump-for-containers-inside-Kubernetes-pods?language=en_US)


## Coredns known issue
1. [Kubernetes pods /etc/resolv.conf ndots:5 option and why it may negatively affect your application performances](https://pracucci.com/kubernetes-dns-resolution-ndots-options-and-why-it-may-affect-application-performances.html)
2. [Racy conntrack and DNS lookup timeouts](https://www.weave.works/blog/racy-conntrack-and-dns-lookup-timeouts)
3. [Optimize DNS resolution for an ACK cluster](https://partners-intl.aliyun.com/help/doc-detail/172339.htm)
4. [Autoscale the DNS Service in a CLuster](https://kubernetes.io/docs/tasks/administer-cluster/dns-horizontal-autoscaling/)
