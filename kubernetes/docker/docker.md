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
2. [Kubernetes 1.20 版本开始将弃用 Docker，是时候拥抱 Containerd 和 Podman 了！](https://mp.weixin.qq.com/s?__biz=MzI3MTI2NzkxMA==&mid=2247492565&idx=1&sn=af40e01fec2bca6ed27ff5638ca5aaa3&chksm=eac6c2fcddb14beadd787ef38c268e44ef12b9ea9904e51a288cc06b8ebebc548852be15893c&scene=126&sessionid=1606977135&key=f956749ad0bcda7eaa904a50528a209271c99c07f857cab05b94f2abb4c7b53ed57b75c594faacd75c1586996d82c1480aa0b7470b9cfceec99548153638faf97538000e36cc3a4a2bcfb4c76c485cce54c9a27d4192407eaa1eb39944846bed18223ebffc7a36d6b1633c88b93653ad286fd6056b990ff5bfcab49029d1ec5a&ascene=1&uin=MTgyNzM2NTQxOA%3D%3D&devicetype=Windows+10+x64&version=6300002f&lang=zh_CN&exportkey=A95CQ2xrNFxCdCDevdz2l4w%3D&pass_ticket=JKTKIIJEmP2dDcDLtfpmHXnfsCGBjDiGeOOjxQH9cIcBdWkNWDzRHBq87aSCQiWK&wx_header=0)  Kubelete 创建容器步骤 
3. [Kubernetes 弃用 Docker 来龙去脉](https://mp.weixin.qq.com/s?__biz=Mzg3ODAzMTMyNQ==&mid=2247488052&idx=1&sn=6296c9a054dbca0c7d815709003a2bb4&chksm=cf18aa86f86f23902d27f9cf7c0f951fb7d60dba391947df97d393a3a9f0095361c75aa7e576&scene=126&sessionid=1607336285&key=ffd0917630368dac8a3e3a553ac2563c6c2f13e726b4527985e6cacd05f65c04f7fe89f8bb3fd3b1dc5be86feedebc899c186776332d2a65462ae0998fb491dcd90b40bd381adecb27d944e3e866f0ed3229037ff2070ad58b9629ecc7f099259dd78dc7b9cc095ef1da2a944a7294cc3cdfd90100879f76b619237e0e327e66&ascene=1&uin=MTgyNzM2NTQxOA%3D%3D&devicetype=Windows+10+x64&version=6300002f&lang=zh_CN&exportkey=A5NzUH3TJOS30fesRpRdpgo%3D&pass_ticket=cKSdRyN5yl2UC3tTq3WNR5u1B2Y4ArwDnEtOoJrmirAyKRYjvo9BwygSs4XHGNR2&wx_header=0)