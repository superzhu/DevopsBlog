# Kubernetes 管理组件的metrics

1. ETCD metrics
```bash
curl --cacert /etc/kubernetes/pki/etcd/ca.crt \
  --cert /etc/kubernetes/pki/etcd/healthcheck-client.crt \
  --key /etc/kubernetes/pki/etcd/healthcheck-client.key \
  https://10.220.8.17:2379/metrics
```
2. kube-apiserver metrics
   ```bash
   kubectl get --raw /metrics

   curl --cacert /etc/kubernetes/pki/ca.crt \
   --cert /etc/kubernetes/pki/admin.crt \
   --key /etc/kubernetes/pki/admin.key https://10.220.8.17:6443/metrics
   ```
3. kube-controller-manager metrics
   ```bash
   curl  http://10.220.8.17:10252/metrics
   ```
4. kube-scheduler metrics
   ```bash
   curl  http://10.220.8.17:10251/metrics
   ```
5. kubelet metrics
   ```bash
   curl -k --cacert /etc/kubernetes/pki/ca.crt \
   --cert /etc/kubernetes/pki/admin.crt \
   --key /etc/kubernetes/pki/admin.key https://10.220.8.17:10250/metrics
   ```
6. kube-proxy metrics
    ```bash
    curl http://10.220.8.17:10249/metrics
    ```
7. Node metrics
   ```bash
   curl --cacert /etc/kubernetes/pki/ca.crt --cert /etc/kubernetes/pki/admin.crt \
   --key /etc/kubernetes/pki/admin.key \
   https://10.220.8.17:6443/api/v1/nodes/kube-node1/proxy/metrics
   ```
8. cAdvisor metrics
    ```bash
    curl --cacert /etc/kubernetes/pki/ca.crt --cert /etc/kubernetes/pki/admin.crt \
   --key /etc/kubernetes/pki/admin.key \
   https://10.220.8.17:6443/api/v1/nodes/kube-node1/proxy/metrics/cadvisor

    kubectl get --raw "/api/v1/nodes/kube-master1/proxy/metrics/cadvisor"
    ```
9. ff