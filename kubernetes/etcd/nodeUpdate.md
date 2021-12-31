# Master Node Replacement

1. Reset old master node:
   ```bash
     kubeadm reset --force
   ```
2. On existing master node, Get Kubernetes Cluster token:
  ```bash
  kubeadm token list
  absdef.0123456789abcdef   <forever>   <never>   authentication,signing   <none> 
 ```
3. Get kubeadm configuration: 
   ```bash
   kubeadm config view > kubeadm.yaml
   ```
4. Get the ca-cert-hash:
   ```bash
   openssl x509 -pubkey -in /opt/datavisor/kubernetes/pki/ca.crt | openssl rsa -pubin -outform der 2>/dev/null | openssl dgst -sha256 -hex | sed 's/^.* //'
   ```
5. Get certificate key:
   ```bash 
   kubeadm init phase upload-certs --upload-certs --config kubeadm.yaml
   ```
6. control plane joining the Kubernetes cluster:
   ```bash
   kubeadm join 172.27.15.208:6443 --token absdef.0123456789abcdef \
   --discovery-token-ca-cert-hash sha256:764259e5844787d4586ab9a0460788f716c735f71019b244ac4483193a479b7d \
   --control-plane \
   --certificate-key d16305b754fba66c9be9ebf2a399cf25919c5efb4c0c771813b408fb6fd7251b
   ```
7. Add ETCD Server: copy ca.crt,ca.key, etcd/ca.crt, etcd/ca.key from other nodes.
8. Generate etcd-related certificates:
   ```bash
   kubeadm init phase certs etcd-peer --cert-dir /opt/datavisor/kubernetes/pki
   kubeadm init phase certs etcd-server --cert-dir /opt/datavisor/kubernetes/pki
   
   kubeadm init phase certs etcd-healthcheck-client --cert-dir /opt/datavisor/kubernetes/pki
   kubeadm init phase certs apiserver-etcd-client --cert-dir /opt/datavisor/kubernetes/pki
   ```
9. Add new node to etcd cluster:
   ```bash
   ETCDCTL_API=3 etcdctl --endpoints 'https://172.27.42.208:2379,https://172.27.20.66:2379' \
      --cacert /opt/datavisor/kubernetes/pki/etcd/ca.crt \
      --cert /opt/datavisor/kubernetes/pki/etcd/healthcheck-client.crt  \
      --key /opt/datavisor/kubernetes/pki/etcd/healthcheck-client.key \
      member add etcd0 --peer-urls=https://172.27.15.208:2380
   ```
10. Create /etc/kubernetes/manifests/etcd.yaml
   ```yaml
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    component: etcd
    tier: control-plane
  name: etcd
  namespace: kube-system
spec:
  containers:
  - command:
    - etcd
    - --advertise-client-urls=https://172.27.15.208:2379
    - --cert-file=/opt/datavisor/kubernetes/pki/etcd/server.crt
    - --client-cert-auth=true
    - --data-dir=/opt/datavisor/etcd/data
    - --initial-advertise-peer-urls=https://172.27.15.208:2380
    - --initial-cluster=etcd0=https://172.27.15.208:2380,etcd3=https://172.27.13.249:2380,etcd2=https://172.27.42.208:2380,etcd1=https://172.27.20.66:2380
    - --initial-cluster-state=existing
    - --key-file=/opt/datavisor/kubernetes/pki/etcd/server.key
    - --listen-client-urls=https://172.27.15.208:2379
    - --listen-peer-urls=https://172.27.15.208:2380
    - --name=etcd0
    - --peer-cert-file=/opt/datavisor/kubernetes/pki/etcd/peer.crt
    - --peer-client-cert-auth=true
    - --peer-key-file=/opt/datavisor/kubernetes/pki/etcd/peer.key
    - --peer-trusted-ca-file=/opt/datavisor/kubernetes/pki/etcd/ca.crt
    - --snapshot-count=10000
    - --trusted-ca-file=/opt/datavisor/kubernetes/pki/etcd/ca.crt
    image: docker-registry.dv-api.com/library/etcd:3.3.10
    imagePullPolicy: IfNotPresent
    livenessProbe:
      exec:
        command:
        - /bin/sh
        - -ec
        - ETCDCTL_API=3 etcdctl --endpoints=https://[172.27.15.208]:2379 --cacert=/opt/datavisor/kubernetes/pki/etcd/ca.crt
          --cert=/opt/datavisor/kubernetes/pki/etcd/healthcheck-client.crt --key=/opt/datavisor/kubernetes/pki/etcd/healthcheck-client.key
          get foo
      failureThreshold: 8
      initialDelaySeconds: 15
      timeoutSeconds: 15
    name: etcd
    resources: {}
    volumeMounts:
    - mountPath: /opt/datavisor/etcd/data
      name: etcd-data
    - mountPath: /opt/datavisor/kubernetes/pki/etcd
      name: etcd-certs
  hostNetwork: true
  priorityClassName: system-cluster-critical
  volumes:
  - hostPath:
      path: /opt/datavisor/kubernetes/pki/etcd
      type: DirectoryOrCreate
    name: etcd-certs
  - hostPath:
      path: /opt/datavisor/etcd/data
      type: DirectoryOrCreate
    name: etcd-data
status: {}

   ```
11. Wait pod to start
12. Check ETCD data sync status:
   ```bash
   ETCDCTL_API=3 etcdctl --endpoints 'https://172.27.15.208:2379,https://172.27.42.208:2379,https://172.27.20.66:2379,https://172.27.13.249:2379,'  \
    --cacert /opt/datavisor/kubernetes/pki/etcd/ca.crt \
    --cert /opt/datavisor/kubernetes/pki/etcd/healthcheck-client.crt \
    --key /opt/datavisor/kubernetes/pki/etcd/healthcheck-client.key \
    -w table endpoint status
   ```
13. ff



## References
1. [Breaking down and fixing etcd cluster](https://itnext.io/breaking-down-and-fixing-etcd-cluster-d81e35b9260d)
2. [etcd op-guide maintenance](https://github.com/etcd-io/etcd/blob/master/Documentation/op-guide/maintenance.md)
3. [彻底搞懂 etcd 系列文章（九）：etcd compact 和 watch API](https://juejin.im/post/6874884171068604430)
4. [Access ETCD data](https://www.huweihuang.com/kubernetes-notes/etcd/k8s-etcd-data.html)
5. [etcd restore](https://github.com/etcd-io/etcd/blob/master/Documentation/op-guide/recovery.md#restoring-a-cluster)