# Project Calico

1. **How to trace packet flow?**
   1. Create a kubernetes cluster with calico network plugin.
   2. Create 2 pods in the same node or different nodes.
   3. Go inside one of the pod and curl the ip of the other pod.
   4. At the same time, collect the tcpdump data on all the interfaces (pod's eth0, caliXXX interfaces and the tunl0 interface).
2. ff


## Calico References
1. [pod to pod communication in same node does not follow expected route](https://github.com/projectcalico/calico/issues/2160) Great
2. [An Introduction to Calico: Container Networking at Scale 2019](https://www.exoscale.com/syslog/calico-introduction/) Great
3. [Kubernetes Networking with Calico 2019](https://www.tigera.io/blog/kubernetes-networking-with-calico/)