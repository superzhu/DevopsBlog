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