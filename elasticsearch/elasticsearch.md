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


# References
1. [Ten tips for debugging Docker containers](https://medium.com/@betz.mark/ten-tips-for-debugging-docker-containers-cde4da841a1d)