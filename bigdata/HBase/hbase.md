# HBase

1. 数据类型单一：Hbase中的数据都是字符串，没有类型。
2. Hbase的表在物理存储上，是按照列族来分割的，不同列族的数据一定存储在不同的文件中
3. Cell: Data is stored in cells. The data is dumped into cells which are specifically identified by rowkey and column qualifiers. (数据被转储到由行键和列限定符明确标识的单元格中); **由{rowkey，column Family：column Qualifier，time stamp}唯一确定的单元**。cell中的数据是没有类型的，全部是字节码形式(byte[])存储
4. A **region** contains all the rows between the start key and the end key assigned to that region. HBase tables can be divided into a number of regions in such a way that all the columns of a column family is stored in one region. Each region contains the rows in a sorted order.
5. Region虽然是分布式存储的最小单元，但并不是存储的最小单元。Region由一个或者多个Store组成，每个列族 (Column Family) 创建一个 Store 实例；每个Strore又由一个memStore和0至多个StoreFile组成，每个 StoreFile 都会对应一个 HFile，HFile 就是实际的存储文件；memStore存储在内存中，StoreFile存储在HDFS上。**MemStore是一个写缓存(In Memory Sorted Buffer)，所有数据会先写入WAL日志，后写入MemStore中，由MemStore根据一定的算法将数据Flush到地层HDFS文件中(HFile)**
![HBase Region](hbasephysical.gif)
5. HBase适用场景
   1. 写密集型应用，每天写入量巨大，而相对读数量较小的应用，比如IM的历史消息，游戏的日志等等; **主要适用于海量明细数据（十亿、百亿）的随机实时查询**，如日志明细、交易清单、轨迹行为
   2. 不需要复杂查询条件来查询数据的应用，HBase只支持基于rowkey的查询，对于HBase来说，单条记录或者小范围的查询是可以接受的，大范围的查询由于分布式的原因，可能在性能上有点影响，而对于像SQL的join等查询，HBase无法支持。
   3. 对性能和可靠性要求非常高的应用，由于HBase本身没有单点故障，可用性非常高。
6. HBase优点：
   1. 列可以动态增加，并且列为空就不存储数据,节省存储空间
   2. HBase自动切分数据，使得数据存储自动具有水平scalability
   3. HBase可以提供高并发读写操作的支持
   4. RegionServer 自动故障转移
7. HBase缺点：
   1. 查询条件单一,不能支持条件查询，只支持按照Row key来查询.
   2. 不适合于大范围扫描查询
   3. 不支持事务
   4. 不直接支持 SQL 的语句查询
   5.  表设计要求较高 : HBase是一个基于rowkey的分布式系统，所以在表的设计上，rowkey的选择比较重要，一个好的rowkey需要避免产生热点数据
8. **基本组件: HMaster** : HMaster没有单点问题，HBase中可以启动多个HMaster，通过Zookeeper的Master Election机制保证总有一个Master在运行。主要负责Table和Region的管理工作：
   1. 管理用户对表的增删改查操作
   2. 管理HRegionServer，实现其负载均衡
   3. 管理和分配HRegion，比如在HRegion split时分配新的HRegion；在HRegionServer退出时迁移其内的HRegion到其他HRegionServer上
   4. 管控集群, 监控所有RegionServer的状态
   5. 权限控制（ACL）
9.  **HBase与二级索引**
    1.  基于HBase的Coprocessor的方案（典型代表phoenix）
    2.  云厂商自研的二级索引（阿里云目前有自研增强版二级索引）
    3.  基于搜索平台的索引方案（如solr、ES等）。
10. ff


## References
1. [HBase总结](https://andr-robot.github.io/HBase%E6%80%BB%E7%BB%93/) Great
2. [面试头条：HBASE 存储设计](https://cloud.tencent.com/developer/article/1643498)
3. [HBase二级索引解决方案](https://juejin.im/post/6844904159431360519)
4. [用Elasticsearch实现HBase二级索引](https://priesttomb.github.io/%E6%8A%80%E6%9C%AF/2020/01/08/hbase-secondary-index-using-elasticsearch/)
5. [HBase高可用原理与实践](https://sq.163yun.com/blog/article/173155879264116736)
6. [HBase优化实战](https://sq.163yun.com/blog/article/170708590806372352)