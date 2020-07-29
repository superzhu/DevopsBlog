# cilium CNI

1. cilium真正的卖点是ebpf提供的无限可编程能力，相对于固化的iptables/ipvs而言。
2.  Cilium is broadly networking, load-balancing, and security for Kubernetes. The main goal of it is to take all the power of eBPF and then bring that to the Kubernetes world and not have the user base actually need to understand BPF.
3.  Cilium supports both VETH/IPVLAN as link devices.