Packaged Softwares:
1 etcd / etcdctl         v3.4.7
2 kubernetes             v1.18.2
   A) kube-apiserver
   B) kube-controller-manager
   C) kube-proxy
   D) kube-scheduler
   E) kubeadm
   F) kubectl
   G) kubelet
3 helm                    v3.2.0
4 cni-plugins-amd64-v0.7.6.tgz 
5 calicoctl               v3.13.3

Docker images:
1 coredns 1.6.9
    docker pull coredns/coredns:1.6.9
2 metrics-serve v0.3.6
    docker pull zhangguanzhang/gcr.io.google_containers.metrics-server-amd64:v0.3.6
3 calico 3.13.3
    docker pull calico/node:v3.13.3
    docker pull calico/cni:v3.13.3
    docker pull calico/pod2daemon-flexvol:v3.13.3
    docker pull calico/kube-controllers:v3.13.3
4 Ingress Controllers:NGINX: 0.30.0
    docker pull bitnami/nginx-ingress-controller:0.30.0-debian-10-r17
    docker pull bitnami/nginx:1.16.1-debian-10-r46
5 dashboard: v2.0.0-rc7
   docker pull kubernetesui/metrics-scraper:v1.0.3
   docker pull kubernetesui/dashboard:v2.0.0-rc5
  
  docker pull mirrorgooglecontainers/kubernetes-dashboard-amd64:v1.10.1
  docker tag mirrorgooglecontainers/kubernetes-dashboard-amd64:v1.10.1  k8s.gcr.io/kubernetes-dashboard-amd64:v1.10.1
  docker rmi mirrorgooglecontainers/kubernetes-dashboard-amd64:v1.10.1

  Helm commands:
  A> Namespace: customer-ops
    1. helm upgrade hare ./hare --debug --install --namespace=customer-ops  -f ./hare/values-customer-ops.yaml

    2.  helm upgrade tenantmgr ./tenantmgr --debug --install --namespace=customer-ops  -f ./tenantmgr/values-customer-ops.yaml

    3. helm upgrade epswmgr ./epswmgr --debug --install --namespace=customer-ops  -f ./epswmgr/values-customer-ops.yaml

    4. helm upgrade opsgui ./opsgui --debug --install --namespace=customer-ops  -f ./opsgui/values-customer-ops.yaml

  B> Namespace: customer-prod
    1. helm upgrade rabbitmq ./rabbitmq --debug --install --namespace=customer-prod  -f ./rabbitmq/values-customer-prod.yaml

    2. helm upgrade redis ./redis --debug --install --namespace=customer-prod  -f ./redis/values-customer-prod.yaml

    3. helm upgrade addressbook ./addressbook --debug --install --namespace=customer-prod  -f ./addressbook/values-customer-prod.yaml

    4. helm upgrade admingui ./admingui --debug --install --namespace=customer-prod  -f ./admingui/values-customer-prod.yaml

    5. helm upgrade authmgr ./authmgr --debug --install --namespace=customer-prod  -f ./authmgr/values-customer-prod.yaml

    6. helm upgrade chatmgr ./chatmgr --debug --install --namespace=customer-prod  -f ./chatmgr/values-customer-prod.yaml

    7. helm upgrade confmgr ./confmgr --debug --install --namespace=customer-prod  -f ./confmgr/values-customer-prod.yaml

    8. helm upgrade coreadaptor ./coreadaptor --debug --install --namespace=customer-prod  -f ./coreadaptor/values-customer-prod.yaml

    9. helm upgrade gateway ./gateway --debug --install --namespace=customer-prod  -f ./gateway/values-customer-prod.yaml

    10. helm upgrade idpmgr ./idpmgr --debug --install --namespace=customer-prod  -f ./idpmgr/values-customer-prod.yaml

    11. helm upgrade storemgr ./storemgr --debug --install --namespace=customer-prod  -f ./storemgr/values-customer-prod.yaml

    12. helm upgrade transproxy ./transproxy --debug --install --namespace=customer-prod  -f ./transproxy/values-customer-prod.yaml

    13 helm upgrade uosdata ./uosdata --debug --install --namespace=customer-prod  -f ./uosdata/values-customer-prod.yaml

