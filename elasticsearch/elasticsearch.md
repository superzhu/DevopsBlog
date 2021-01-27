## Elasticsearch Docs
### elasticsearch 7.4 -- 2020-02-05

1. Get all Elasticsearch indices
```bash
       GET /_cat/indices?v
```
2. Get specific-pattern Elasticsearch indices
```bash
        GET _cat/indices/elastalert*?v
```
3. Delete all documents in a index
```bash
        POST elastalert_silence/_delete_by_query?conflicts=proceed
       {
         "query": {
             "match_all": {}
         }
      }
```
4. 你要让elasticsearch性能要好，最佳的情况下，**就是你的机器的内存，至少可以容纳你的总数据量的一半**.
5. ff


# References
1. [Ten tips for debugging Docker containers](https://medium.com/@betz.mark/ten-tips-for-debugging-docker-containers-cde4da841a1d)
2. [日志系统新贵Loki，确实比笨重的ELK轻](https://mp.weixin.qq.com/s?__biz=MzIxMTE0ODU5NQ==&mid=2650240058&idx=1&sn=f45eb6551de817f342ed4cf3b92ace6d&chksm=8f5a1e66b82d977000c33d7a0ed3fe41363f4e99032b87d3aac7edf232dbb4031cd5ffcf8afa&scene=126&sessionid=1592181017&key=f49733a29b17598309b8a7aaf937a04c474ead0f8973f732a020a4e499854123700a2f89f831bdcbf5d96341579f04a02842486094a0b243b82210d34f51b383d486388adec4dc316fad58c2b2ba5a13&ascene=1&uin=MTgyNzM2NTQxOA%3D%3D&devicetype=Windows+10+x64&version=6209007b&lang=zh_CN&exportkey=AzONfB4NyiUcCiSPqeFl0xE%3D&pass_ticket=9YkbcGQAYlSM%2B1RKGsdOsyDrBSdaq21IxVcLPtkvVClWNdhEz4daRNPHtxi%2Bcz2B)
3. [分布式搜索3](https://www.cnblogs.com/daiwei1981/p/9411495.html)