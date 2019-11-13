# CoreDNS

1. Check if the DNS pod is running
```bash
    kubectl get pods --namespace=kube-system -l k8s-app=kube-dns
```
2. Check health of DNS pod
```bash
    curl http://192.168.9.75:8080/health
```
3.  Metrics of CoreDNS 
```bash
    curl http://192.168.9.75:9153/metrics
```
4.  infoblox/dnstools container image contains DNS-specific utilities such as host, dig and dnsperf, as well as general networking tools including curl and tcpdump. To run a dnstools pod, use the following:
```bash
     kubectl run --restart=Never -it --image infoblox/dnstools dnstools
```
5.  ff


## nslookup
```bash
    # Querying the A record
    nslookup -type=a metrics-server.kube-system 172.16.0.10
```