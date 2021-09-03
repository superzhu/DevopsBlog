# MySQL Configuration

1. Set MySQL binlog retention time:
    ```shell
    service mysqld stop
    service mysql status
    # /etc/my.conf
    expire_logs_days=10
   
    service mysqld start
    ```
2. It always a good practice to verify whether the process to enable binary logs
   succeeded or not. This can be done using the following command:
   ```mysql
    mysql> show variables like '%bin%';
   ```
3. ***Enabling Binary Logging for MySQL***:
   ```makefile
   server-id=master-01
   
   # Bin Log Setup
   log-bin=bin.log
   log-bin-index=bin-log.index
   max_binlog_size=100M
   expire_logs_days=10
   binlog-format = 'ROW'
   ```
4. Verify that binary logging is enabled by running the following query:
   ```makefile
   mysql > show variables like '%log_bin%';
   ```
5. ff
---
# MySQL SQL Checks
1. How to check MySQL database and table sizes
   ```mysql
   # To check the sizes of all of your databases, at the mysql> prompt, 
   # type the following command
   
   SELECT table_schema AS "Database", 
   ROUND(SUM(data_length + index_length) / 1024 / 1024, 2) AS "Size (MB)"
   FROM information_schema.TABLES
   GROUP BY table_schema;
   
   
   # To check the sizes of all of the tables in a specific databases, at the
   # mysql> prompt, type the following command. Replace ***database_name***
   # with the name of the database that you want to check:
   SELECT table_name AS "Table",
   ROUND(((data_length + index_length) / 1024 / 1024), 2) AS "Size (MB)"
   FROM information_schema.TABLES
   WHERE table_schema = "database_name"
   ORDER BY (data_length + index_length) DESC;
   ```
2. ff

---
# MySQL Concepts
1. Organizations practice various methods to ensure that data is available for  
   ***replication & recovery***. MySQL BinLogs play a significant role in carrying
   out these processes.
2. dd

---
## References
1. [Using MySQL BinLogs: A Detailed Guide](https://hevodata.com/learn/using-mysql-binlog/)
2. [How to enable binary logging for MySQL?](https://jinyuwang.weebly.com/for-mysql/how-to-enable-binary-logging-for-mysql)
3. [How to find the directory storing MySQL binary log](https://jinyuwang.weebly.com/for-mysql/how-to-find-the-directory-storing-mysql-binary-log)