# Spark Scheduler

1. Support for running Spark on Kubernetes was added with version 2.3(2018), and Spark-on-k8s adoption has been accelerating ever since.
2. <span style="color:blue">**YARN pain points**</span>:
   1. **Management is difficult** : Clusters are complicated and have to use more components than are required for a job or model(使用比作业或模型所需的更多的组件). This also requires hard-to find experts.
   2. Complicated OSS(open source software) software stack : Version and dependency management is hard. Have to understand how to tune multiple components for efficiency.
   3. Isolation is hard: I have to think about my jobs to size clusters, and isolating jobs requires additional steps.
3. ff


## References
1. [Running Apache Spark on Kubernetes: Best Practices and Pitfalls](https://databricks.com/session_na20/running-apache-spark-on-kubernetes-best-practices-and-pitfalls)
2. [The Pros and Cons of Running Apache Spark on Kubernetes](https://towardsdatascience.com/the-pros-and-cons-of-running-apache-spark-on-kubernetes-13b0e1b17093)
3. [Use remote storage for persisting shuffle data](https://issues.apache.org/jira/browse/SPARK-25299)