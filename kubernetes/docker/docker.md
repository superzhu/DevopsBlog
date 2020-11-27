# Docker
1. **Veth Pair**虚拟设备.Veth Pair设备的特点是：它被创建出来后，总是以两张虚拟网卡（Veth Peer）的形式出现。并且，其中一个网卡发出的数据包，可以直接出现在另一张“网卡”上，哪怕这两张网卡在不同的Network Namespace中。
2. docker OCI (Open Container Initiative)
3. **Containerd is used by Docker, Kubernetes CRI**
4. dockerd ---> containerd ---> containerd-shim ---> runC
   1.  **dockerd** : Dockerd is the thing that helps you work with volumes, networking or even orchestration. And of course it can launch containers or manage images as well, but containerd is listening on linux socket and this is just translated to calls to its GRPC API
   2.  **Containerd** is a daemon that acts as API facade for various container runtimes and OS. When using containerd, you no longer work with syscalls, instead you work with higher-level entities like snapshot and container
   3.   **containerd-shim**. This is the parent process of every container started
   4.   **runc**
5. **cri-containerd** plugin is hosted inside **containerd**.


## Docker network
1. [Docker容器网络-基础篇](https://mp.weixin.qq.com/s?__biz=MzAxNTcyNzAyOQ==&mid=2650963085&idx=1&sn=d40fc75d67b5888b14d280c167cd2d6b&chksm=80097c57b77ef54137b62e90f4a997d44eca106098cebd2f16f91397eb3a5d9f98cc89daa7be&scene=126&sessionid=1600748965&key=929ff6ea9407a2ec52fb3128fd530550f1b9c476e92bd5f076fcb285cd6e44374029e90ba638ede879c97813908f3091ca21f18822739b3444cfc6a0099a6d6709f3d1f0a94cb6ba149feaadfca87d1a4aa99369df2a03ea20ee8e3eb7976f54ead4e58d0d5b53b06ea8668ecb81ce848ba6f294156cd78d396f0ef2c8565cfd&ascene=1&uin=MTgyNzM2NTQxOA%3D%3D&devicetype=Windows+10+x64&version=62090529&lang=zh_CN&exportkey=AwQkavelYXrwgE682PtapB8%3D&pass_ticket=zuxHvj1QZ%2BRGyVUqXGw1ejsCiLpZxieQVu6URszm8AEqorEKZUpgQQ6uo%2FaBj7PI&wx_header=0)
2. [**Container Runtime Series blog**](https://www.ianlewis.org/en/container-runtimes-part-1-introduction-container-r)  Great
3. [Welcome To The Container Jungle: Docker vs. containerd vs. Nabla vs. Kata vs. Firecracker and more!](https://www.inovex.de/blog/containers-docker-containerd-nabla-kata-firecracker/)


## High-level runtime: containerd
1. [Manually Loading Container Images with containerD](https://blog.scottlowe.org/2020/01/25/manually-loading-container-images-with-containerd/)