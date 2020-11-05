# ETCD concepts

1. Finding revision counts:
   ```bash
      etcd_v3 get revisiontestkey -w json

      etcd_v3 compaction 30949860

      etcd_v3 defrag

      tcdctl get --prefix --rev=3 foo # access the versions of keys at revision 3
   ```
2. ETCD lease (租约) ：是ETCD的重要特性，用于实现key定时删除功能。与Redis的定时删除功能基本一致




## References
1. [How to keep your etcd lean and mean](https://www.compose.com/articles/how-to-keep-your-etcd-lean-and-mean/)
2. [etcd op-guide maintenance](https://github.com/etcd-io/etcd/blob/master/Documentation/op-guide/maintenance.md)
3. [彻底搞懂 etcd 系列文章（九）：etcd compact 和 watch API](https://juejin.im/post/6874884171068604430)