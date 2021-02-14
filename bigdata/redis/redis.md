# Redis
1. Redis的优点
   1. 非常丰富的数据结构；
   2. Redis提供了事务的功能，可以保证一串 命令的原子性，中间不会被任何操作打断；
   3. 数据存在内存中，读写非常的高速，可以达到10w/s的频率;读写性能优异
   4.  持久化
   5. 发布订阅
   6. 分布式
2. Redis应用场景
   1. 分布式和持久化有效应对海量数据和高并发;把访频率高且不会经常变动的数据缓存到内存中
   2. 微博、数据分析、实时数据搜集、实时通讯等
   3. 排行榜，如果使用传统的关系型数据库来做这个事儿，非常的麻烦，而利用Redis的SortSet数据结构能够非常方便搞定
   4. 计算器/限速器，利用Redis中原子性的自增操作，我们可以统计类似用户点赞数、用户访问数等
   5. 好友关系，利用集合的一些命令，比如求交集、并集、差集等。可以方便搞定一些共同好友、共同爱好之类的功能;“共同好友列表”：社交类应用中，获取两个人或多个人的共同好友，两个人或多个人共同关注的微博这样类似的功能 (set)
   6. 简单消息队列，除了Redis自身的发布/订阅模式，我们也可以利用List来实现一个队列机制，比如：到货通知、邮件发送之类的需求，不需要高可靠，但是会带来非常大的DB压力，完全可以用List来完成异步解耦
3. Redis不适合场景
   1. 就是数据量太大、数据访问频率非常低的业务都不适合使用Redis，数据太大会增加成本，访问频率太低，保存在内存中纯属浪费资源
4. 如果现在做一个秒杀，那么，Redis应该如何结合进行使用?
   1. 提前预热数据，放入Redis
   2. 商品列表放入Redis List
   3. 商品的详情数据 Redis hash保存，设置过期时间
   4. 商品的库存数据Redis sorted set保存
   5. 用户的地址信息Redis set保存
   6. 订单产生扣库存通过Redis制造分布式锁，库存同步扣除
   7. 订单产生后发货的数据，产生Redis list，通过消息队列处理
   8. 秒杀结束后，再把Redis数据和数据库进行同步
5. Data Type: redis list
   1. 消息队列：redis 的 list 数据类型对于大部分使用者来说，是实现队列服务的最经济，最简单的方式。Remember the latest updates posted by users into a social network.
   2. 任务池：可以利用Lists的PUSH操作，将任务存在Lists中，然后工作线程再用POP操作将任务取出进行执行，其实也有点类似消息队列
   3.  “最新内容”：因为 list 结构的数据查询两端附近的数据性能非常好，所以适合一些需要获取最新数据的场景，比如新闻类应用的 “最近新闻”。
6.  Data Type: zset(sorted set：有序集合)
    1.  每个元素都会关联一个double类型的分数，redis正是通过分数来为集合中的成员进行从小到大的排序。
    2.  根据好友的“亲密度”排序显示好友列表。
    3.  直播间里，粉丝打赏金额排序
7. Data Type: Bitmaps
   1. Bitmaps are not an actual data type, but a set of bit-oriented operations defined on the String type. Since strings are binary safe blobs and their maximum length is 512 MB, they are suitable to set up to 2^32 (40多亿  4 billion )different bits
   2. 用户在线状态
   3. 统计活跃用户
8. Data Type: Streams
9. Redis also supports Bitmaps(Bit arrays) and HyperLogLogs which are actually data types based on the String base type, but having their own semantics; Streams


## Interview
1. [2020 年最新版 68 道Redis面试题](https://zhuanlan.zhihu.com/p/112944545)
2. [基于Redis实现分布式锁之前，这些坑你一定得知道](https://zhuanlan.zhihu.com/p/142758586)
3. [Redis 6.0 新特性-多线程连环 13 问！](https://mp.weixin.qq.com/s?__biz=MzU0OTk3ODQ3Ng==&mid=2247487835&idx=1&sn=6c08ba5b50c0ce2d49fb702692614575&chksm=fba6f958ccd1704eccba2ce81cd8cce059e7bdad36636efed69be7d51f08aeb7ff76b78ae356&scene=126&sessionid=1591057891&key=3d5c045e78d5674e80d5aa4cc4ab4716d4811ea7903b6bdff02237a9a70554c7bf8a01edc494f69ce6dd2cb5d05d453f37cfce0f55c305c183af89e3de111253f73d19ca8d2d47c36621bab7bece48bf&ascene=1&uin=MTgyNzM2NTQxOA%3D%3D&devicetype=Windows+10+x64&version=6209007b&lang=zh_CN&exportkey=A92tH0wCIAhPLkMpYRuPPPI%3D&pass_ticket=yQqWnsKveu2wN%2F8d4b68ic%2F4GtP8Yg0aUZOhmtEdQN5skodpFvxX0UE%2FmED0CH5X)
4. [我用Redis干掉了一摞简历](https://mp.weixin.qq.com/s?__biz=MzI5OTM3MjMyNA==&mid=2247490259&idx=1&sn=bcacb77ebb1e837c1834968a23255ab7&chksm=ec96c098dbe1498efb3bf8ec36d5ae140f3853ca0da24caff2d611287bde04fa963b062d7f62&scene=126&sessionid=1596502932&key=feb849ed6c1e82227e9dd2277bbf7b1515474ef5185516fb4b9873c8b7fc0fce4a01a4b866e377181015933feeaab350acda4afc5e938abf5342e54565949171bb906cd92c75fe412848076f40a7af6f&ascene=1&uin=MTgyNzM2NTQxOA%3D%3D&devicetype=Windows+10+x64&version=62090529&lang=zh_CN&exportkey=A%2FYnJ1tEfS0aOg8fffWHU8s%3D&pass_ticket=ntETQsP1RhNUojtR4zjNCYWrP9RwMLovz6uzVU3WmnLUd%2BKVfyWskswNgEV43%2F0s)
5. [关于缓存穿透、缓存雪崩、热点数据失效问题的解决方案](https://mp.weixin.qq.com/s?__biz=MzU0OTk3ODQ3Ng==&mid=2247489559&idx=1&sn=80ae90db83d6b19819284f0d342e210f&chksm=fba6f014ccd17902e07dd7b567cd05ef95500dfd4ac499d4be218913494fe30afc05d9ea4814&scene=126&sessionid=1601287836&key=d86db7ce269b2818d1071d5a1a82a25eef151ef7fd0eb091342e5f7b2d1eeaca83838c4f94acfde20965b44e050107fe724b2d5ab69b85ffdbdfd2bab4ee244789d7fd4b8ad0eb843b55dedbdd3e4efc88b554853141334c6137b269e1780adb0aebeb6244f8a5c14b225a27ab1dbf67d1157d98dd25e9d4bc4bb40aa48828c4&ascene=1&uin=MTgyNzM2NTQxOA%3D%3D&devicetype=Windows+10+x64&version=62090529&lang=zh_CN&exportkey=A%2BWZEvsGgU243JoLW5faxcA%3D&pass_ticket=%2Fb2Hl4wxg3fQt0e%2FYwsabCDvP8KiJ5VndSZLtqJga3Rjq1S3KP83tRRVXpebnJYg&wx_header=0)
6. [Redis 的 8 大应用场景](https://segmentfault.com/a/1190000016188385)
7. [Redis 五种数据类型及应用场景](https://blog.csdn.net/mxw2552261/article/details/104980691)
8. [Redis 中 BitMap 的使用场景](https://www.cnblogs.com/54chensongxia/p/13794391.html
9. [Redis HyperLogLog介绍及应用](https://juejin.im/post/6844904114573279245)
10. [Redis 如何存储上亿级别的用户状态？](https://blog.csdn.net/youanyyou/article/details/112417327)
11. [redis 系列之——高可用](https://xie.infoq.cn/article/6c3500c66c3cdee3d72b88780)
12. [Redis大KEY定位及优化](https://www.jianshu.com/p/616becc9f8e3)
13. [学会这几个技巧，让Redis大key问题远离你](https://www.yisu.com/zixun/2059.html)

## Cache Solution
1. [并发系统-缓存方案](https://zhuanlan.zhihu.com/p/151423217)
2. [缓存与数据库一致性系列-序言](https://blog.kido.site/2018/11/24/db-and-cache-preface/)

## Redis deployment
1. [Production Checklist for Redis on Kubernetes](https://medium.com/swlh/production-checklist-for-redis-on-kubernetes-60173d5a5325)