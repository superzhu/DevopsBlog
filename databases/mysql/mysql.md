# MySQL Configuration

1. Set MySQL binlog retention time:
    ```shell
    service mysqld stop
    service mysql status
    # /etc/my.conf
    expire_log_days=2
   
    service mysqld start
    ```
2. It always a good practice to verify whether the process to enable binary logs
   succeeded or not. This can be done using the following command:
   ```mysql
    mysql> show variables like '%bin%';
   ```
3. Enabling Binary Logging for MySQL:
   ```makefile
   log-bin=mysql-bin.log
   ```
4. ff
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