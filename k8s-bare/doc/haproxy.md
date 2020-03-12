# HaProxy配置

## Check HaProxy status:
```bash
   netstat -lnpt|grep haproxy

   systemctl status haproxy.service
   
   ss -lnt | grep -E "8443|8006"
```

## Check Keepalived status:
```bash
  systemctl status keepalived.service 

  ip address
```

## HaProxy blog
- [Creating High Available Baremetal Kubernetes Cluster with Haproxy](https://medium.com/@kvaps/creating-high-available-baremetal-kubernetes-cluster-with-kubeadm-and-keepalived-simplest-guide-71766d5e25ae?source=post_page-----62c344283076----------------------)
- [How To Use HAProxy to Set Up HTTP Load Balancing on an Ubuntu VPS](https://www.digitalocean.com/community/tutorials/how-to-use-haproxy-to-set-up-http-load-balancing-on-an-ubuntu-vps#configure-logging-for-haproxy)
- [HAPROXY LOGGING AND MONITORING](https://hydrasky.com/linux/haproxy-logging-and-monitoring/)
- [How To Install HAProxy 2.0 On EC2 Ubuntu 18.04](https://geraldalinio.com/security/haproxy/install-haproxy-2-0-on-ec2-ubuntu-18-04/)