# Linux namespaces

1. **namespace associations**:
   1. Each container has its own **mnt, uts and pid** namespace
   2. All of the processes on the system share the **cgroup namespace** (need to dig more into this)
   3. The **pause container** and application container share the **net and ipc** namespace.
2. **what even is a container?** Is a process that shares all but one namespace still a container? ¯\_(ツ)_/¯ Usually **containers come with the notion of isolation**, achieved through namespaces - the smaller the number of namespaces and resources that a process shares, the more isolated the process is and that’s all that really matters.
3. Now, any network communication has to go via some network device and **a device can exist in exactly one network namespace at any given time** so communication between any two processes in different namespaces must go via at least two network devices - one in each network namespace.
4. Network child namespace related operations:
   ```bash
   # 1. Create a new network namespace: blue
      sudo ip netns add blue
      (sudo ip netns delete blue)

   # 2. Create a veth pair (veth0 <=> veth1)
      sudo ip link add veth0 type veth peer name veth1

   #  3. Move the veth1 end to the blue namespace
       sudo ip link set veth1 netns blue

   #  4. To make the veth pair functional, we need to give them both IP addresses and bring the interfaces up. We will do this in their respective network namespace.
       sudo ip netns exec blue ip addr add 10.1.1.1/24 dev veth1
       (ip addr delete 10.1.1.1/24 dev veth1)
       
       sudo ip netns exec blue ip link set dev veth1 up
   #  5. bring the interfaces lo up
       sudo ip netns exec blue ip link set dev lo up
       (ip link set dev lo down)
   #  6. Assigns the IP address to the interface
        sudo ip addr add 192.168.1.176/24 dev veth0
        (sudo ip addr delete 192.168.1.176/24 dev veth0)
   #  7. Run a shell inside a child network namespace: blue
       sudo io netns exec blue bash

   # 8. To find out what interface is on the other end, we use ethtool
    ip netns exec blue ethtool -S eth0
   ```
5. **Common control groups** : you could see **systemd-cgls and systemd-cgtop** commands show how cgroup working on the underline host server.
   1. CPU
   2. Memory
   3. Network Bandwidth
   4. Disk
   5. Priority
6. **Namespace** gives the isolation for the container with the underline host where **Cgroup** gives the ability to allocate things to those containers


## References
1. [Making sense Of Linux namespaces](https://prefetch.net/blog/2018/02/22/making-sense-of-linux-namespaces/)
2. [A deep dive into Linux namespaces, part 4 2019](http://ifeanyi.co/posts/linux-namespaces-part-4/)
3. [Linux namespace in Go series 2016](https://medium.com/@teddyking/linux-namespaces-850489d3ccf) important