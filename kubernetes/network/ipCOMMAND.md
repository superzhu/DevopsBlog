# IP cheat sheet

## ip route
1. [ip address scope parameter](https://serverfault.com/questions/63014/ip-address-scope-parameter)
2.  the scope is "the scope of the area where this address is valid"
    1.  global
    2.  site
    3.  link
    4.  host: A host address is something that will only exist within the host machine itself. For instance 127.0.0.1 is a host address commonly assigned to the loopback interface. The loopback interface has no external connectivity and so it's scope is confined to within that of the host machine
3.  怎样理解“ip route show”的输出信息？
   ```bash
   # 10.8.0.0/24 via 10.8.0.2 dev tun0
   输入包目的地址是“10.8.0.0/24网段”的，将其通过“dev tun0”设备转发到“10.8.0.2”网关

   # 10.8.0.2 dev tun0 proto kernel scope link src 10.8.0.1
   目的IP 10.8.0.2设备tun0，内核自动创建，直连，源IP 10.8.0.1
   ```
4.  "**proto**" meaning in Linux routing table?
```bash
    1. cat /etc/iproute2/rt_protos
    2. man ip-route
    3. proto dhcp: The routing protocol identifier. DHCP means the routes will be determined dynamically.
    4. proto bird: Calico BIRD is a BGP routing daemon which runs on every host. Calico makes uses of BGP to propagate routes between hosts. 
```
5.  ff


## References
1. [How to Use the ip Command on Linux](https://www.howtogeek.com/657911/how-to-use-the-ip-command-on-linux/#:~:text=proto%20kernel%3A%20The%20route%20created%20by%20the%20kernel,100%3A%20This%20low%20metric%20indicates%20a%20preferred%20route.) ip fields explanation
2. [Appendix D. IP Route Management](http://linux-ip.net/html/tools-ip-route.html)


## ip netns

1. The ip netns list command displays only namespaces that have been named, by virtue of a corresponding file in **/var/run/netns/**. Network namespaces can be created without names, though, and are referenced by a file descriptor