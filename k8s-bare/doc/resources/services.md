# Kubernetes services and endpoints 资源

## services and endpoints 关系
1. Service和Pod 并没有直接相连。
2. Service和Pod 之间还有个Endpoint资源
3. Endpoint 就是 Pod暴露服务的IP和port的对应关系。
4. 在service的spec中的确定义了 labels selector，但是service并不会直接连接pods 上暴露的port。而是使用了Endpoint列表
5. 如果创建了一个service且不包含pod selector，则需要手动创建Endpoint资源。（如果有pod selector，Endpoint默认会自动创建的）
6. 这里其实可以创建external service。

## 查看services and endpoints 关系
```bash
  kubectl describe svc SERVICENAME -n NAMESPACE
```



# References
1. [Kubernetes Endpoint 理解](https://www.ccieliu.com/k8s/35.html)