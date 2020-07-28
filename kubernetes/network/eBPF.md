# eBPF

1. XDP or Express Data Path 
2. condensed in-depth introduction to eBPF : eBPF简明深入介绍
3. eBPF is a register-based Virtual Machine using a custom 64 bit RISC instruction set capable of running Just-in-Time native-compiled "BPF programs" inside the Linux kernel with access to a subset of kernel functions and memory : eBPF是基于寄存器的虚拟机，它使用自定义的64位RISC指令集，该指令集能够在Linux内核中运行即时本机编译的“ BPF程序”，并可以访问一部分内核功能和内存
4. The most familiar application of BPF powers is related to **filter expressions used in tcpdump tool**. Under the hood, the expressions gets compiled and transparently translated to BPF bytecode. This bytecode is then loaded into the kernel and applied on the raw network packet flow, thus effectively passing to user space only those packets that meet filtering criteria.
5. In-kernel verifier will refuse to load any eBPF program if **invalid pointer dereferences** are detected or maximum stack size limit is reached --- 如果检测到**无效的指针解引用**或达到最大堆栈大小限制，内核验证器将拒绝加载任何eBPF程序


## References
1. [**An eBPF overview, part 1: Introduction**](https://www.collabora.com/news-and-blog/blog/2019/04/05/an-ebpf-overview-part-1-introduction/#:~:text=eBPF%20is%20a%20register%2Dbased,of%20kernel%20functions%20and%20memory.&text=Starting%20with%20kernel%20v3.) Important
2. [eBPF and XDP for Processing Packets at Bare-metal Speed 2019](https://sematext.com/blog/ebpf-and-xdp-for-processing-packets-at-bare-metal-speed/) gobpf