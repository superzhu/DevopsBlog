# Spark Scheduler

1. <span style="color:blue">**YARN pain points**</span>:
   1. **Management is difficult** : Clusters are complicated and have to use more components than are required for a job or model(使用比作业或模型所需的更多的组件). This also requires hard-to find experts.
   2. Complicated OSS(open source software) software stack : Version and dependency management is hard. Have to understand how to tune multiple components for efficiency.
   3. Isolation is hard: I have to think about my jobs to size clusters, and isolating jobs requires additional steps.
2. ff