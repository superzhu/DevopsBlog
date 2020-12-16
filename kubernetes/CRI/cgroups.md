# cgroups

1. How do I check cgroup v2 is installed on my machine?
    ```bash
    grep cgroup /proc/filesystems

    ```
2. cgroup是linux内核中用于实现资源使用限制和统计的模块; **systemd 提供了 cgroups 的使用和管理接口**; cgroups 提供了四大功能：
   1. 资源限制：cgroups 可以对**任务需要的资源总额进行限制**。比如设定任务运行时使用的内存上限，一旦超出就发 OOM。
   2. 优先级分配：通过分配的 CPU 时间片数量和磁盘 IO 带宽，实际上就等同于控制了任务运行的优先级。
   3. 资源统计：**cgoups 可以统计系统的资源使用量**，比如 CPU 使用时长、内存用量等。这个功能非常适合当前云端产品按使用量计费的方式。
   4. 任务控制：cgroups 可以对任务执行挂起、恢复等操作
3. Recursively show control group contents :
    ```bash
    systemd-cgls

    # chrony, an NTP client/server
    systemctl status chrony


    systemd-cgls -u containerd.service

    # 类似于 top 命令，systemd-cgtop 命令显示 cgoups 的实时资源消耗情况:
    systemd-cgtop
    ```
4. ff



## Cgroup References
1. [kubernetes kubelet组件中cgroup的层层"戒备" 2019](https://www.cnblogs.com/gaorong/p/11716907.html)
2. [Cgroups 与 Systemd](https://www.cnblogs.com/sparkdev/p/9523194.html)
3. [kubelet cgroup 资源预留源码分析](https://blog.csdn.net/zhonglinzhang/article/details/92840192)


# systemd automounting
1. Udev is the device manager for the Linux kernel. Udev dynamically creates or removes device node files at boot time in the /dev directory for all types of devices. Udev is now part of systemd as you can see by viewing the “udev” file names included with the systemd RPM package.
2. The **Udev daemon, systemd-udevd**, receives device uevents directly from the kernel whenever a device is added or removed from the system. For every event, systemd-udevd executes matching instructions specified in Udev rules.



## References
1. [Beginners Guide to Udev in Linux](https://www.thegeekdiary.com/beginners-guide-to-udev-in-linux/)