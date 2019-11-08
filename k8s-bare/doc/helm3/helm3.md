# helm3 commands
1. The namespace has to be pre created as Helm v3 will not create it for you.
2. simulate an upgrade
   ```bash
   helm upgrade rabbitmq ./rabbitmq --debug --install --namespace develop --dry-run 
   ```
3. Install a release
  ```bash
    helm upgrade mydemo ./demo --debug --install --namespace develop
  ```
3. List all releases
  ```bash
    helm list -n develop
  ```
4. Check Kubernetes manifest semantics:
  ```bash
  helm lint ./cmdemo
  ```
5. Uninstall one helm release
  ```bash
  helm uninstall cmdemo --namespace develop
  ```
6. ff


## nginx-ingress 
1. Its URL: https://hub.kubeapps.com/charts/stable/nginx-ingress

## RabbitMQ

## Helm Chart for Project Calico
1. https://github.com/mrzobot/calico-helm-chart/blob/master/values.yaml
2. https://hub.kubeapps.com/charts/ibm-charts/ibm-calico-bgp-peer/1.1.0


## Helm Repositories
  1. [Hub helm](https://hub.helm.sh/)
  2. [Kubernetes helm配置国内镜像源](https://www.cnblogs.com/a120608yby/p/10683502.html)
  3. [Helm chart仓库官方仓库不能使用解决方法](https://www.cnblogs.com/heaven-xi/p/11207528.html)
  4. [kubeapps helm chart](https://hub.kubeapps.com/charts)


## Helm3 Blog
1. [Helm v3 Beta Features](https://rimusz.net/helm_v3_beta)