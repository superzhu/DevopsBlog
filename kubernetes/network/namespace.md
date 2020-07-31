# Linux namespaces

1. **namespace associations**:
   1. Each container has its own **mnt, uts and pid** namespace
   2. All of the processes on the system share the **cgroup namespace** (need to dig more into this)
   3. The **pause container** and application container share the **net and ipc** namespace.
2. **what even is a container?** Is a process that shares all but one namespace still a container? ¯\_(ツ)_/¯ Usually **containers come with the notion of isolation**, achieved through namespaces - the smaller the number of namespaces and resources that a process shares, the more isolated the process is and that’s all that really matters.


## References
1. [Making sense Of Linux namespaces](https://prefetch.net/blog/2018/02/22/making-sense-of-linux-namespaces/)