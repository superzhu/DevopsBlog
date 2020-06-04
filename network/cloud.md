# Native Cloud Concepts

1. **地域/区域（Region）和可用区（AZ：Available Zone）**: **地域**就是物理意义上的不同地方的机房。因为跨**地域**的机房之间的带宽无法满足内网需求，所以不同**地域**的机器之间内网是不通的。当然，随着骨干网络等物理层基础设施的发展，未来跨**地域**内网连通并非完全不可能的事情。
2. 可以将**地域**理解为不同城市的机房，将**可用区**理解为同一个城市的不同机房。当然，实际上不同**可用区**也可能是在同一个机房，**可用区**的概念严格来说是按照电力和网络设备等相互独立来设计的。同一个**地域**内的不同**可用区**之间，**内网是连通的**，但是网络的响应时间会有差异。


## References
1. [云区域（region)，可用区（AZ），跨区域数据复制（Cross-region replication）与灾备（Disaster Recovery）（部分1）](https://www.cnblogs.com/sammyliu/p/8902556.html)
2. [Region和Available Zone的区别](https://blog.csdn.net/u010305706/article/details/54406060)