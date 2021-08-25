# Renew cluster certificate using kubeadm (v.15)
  kubeadm version: v1.15.12<br>
  kubernetes cluster version: v.15.12
  
## Steps to renew kubernetes cluster certificates
1. Check kubernetes cluster expiration date:
   ```shell
    $ kubeadm alpha certs check-expiration
   CERTIFICATE                EXPIRES                  RESIDUAL TIME   EXTERNALLY MANAGED
   admin.conf                 Aug 23, 2022 07:20 UTC   363d            no
   apiserver                  Aug 23, 2022 07:20 UTC   363d            no
   apiserver-etcd-client      Aug 23, 2022 07:20 UTC   363d            no
   apiserver-kubelet-client   Aug 23, 2022 07:20 UTC   363d            no
   controller-manager.conf    Aug 23, 2022 07:20 UTC   363d            no
   etcd-healthcheck-client    Aug 21, 2022 12:20 UTC   361d            no
   etcd-peer                  Aug 21, 2022 12:20 UTC   361d            no
   etcd-server                Aug 21, 2022 12:20 UTC   361d            no
   front-proxy-client         Aug 23, 2022 07:20 UTC   363d            no
   scheduler.conf             Aug 23, 2022 07:20 UTC   363d            no
   ```
   This command displays the expiration time/remaining time of the client certificate 
   in the ***/etc/kubernetes/pki*** folder and the client certificate embedded in the 
   ***KUBECONFIG*** file used by kubeadm.
2. Back up existing certificates on ***each control plan node***
   ```shell
    cp -rp /etc/kubernetes /etc/kubernetes.bak
   ```
3. Certificates to be renewed on ***each control plan node***
   ```shell
   /etc/kubernetes/pki/apiserver* 
   /etc/kubernetes/pki/front-proxy-client.*
   /etc/kubernetes/pki/etcd/healthcheck-client.*
   /etc/kubernetes/pki/etcd/server.*
   /etc/kubernetes/pki/etcd/peer.*
   ```
4. Back up ETCD ***on one of control plan node***
   ```shell
   # Copy etcdctl from etcd pod to node on every control plane node
   kubectl cp kube-system/etcd-k8s-master01:/usr/local/bin/etcdctl /usr/local/bin/etcdctl 
   
   # Backup ETCD snapshot on one of control planes:
   ETCDCTL_API=3  etcdctl --endpoints=https://172.27.38.17:2379 \
   --cacert=/etc/kubernetes/pki/etcd/ca.crt \
   --key=/etc/kubernetes/pki/etcd/healthcheck-client.key \
   --cert=/etc/kubernetes/pki/etcd/healthcheck-client.crt \
    snapshot save /etc/kubernetes/pki/etcd/etcd-snapshot.db
   ```
5. Get Kubernetes cluster configuration in kubeadm format:
   ```shell
    kubeadm config view > kubeadm-config.yaml
   ```
6. Renew certificates on each control plan node:
   ```shell
    kubeadm alpha certs renew all --config=./kubeadm-config.yaml
   ```
7. Restart etcd, kube-apiserver, kube-scheduler,kube-controller-manager to enable certificates  on each control plan node
   ```shell
   docker ps |grep -E 'k8s_kube-apiserver|k8s_kube-controller-manager|k8s_kube-scheduler|k8s_etcd_etcd' | awk -F ' ' '{print $1}' |xargs docker restart
   ```
8. Check apiserver certificate to ensure upgrade is succeeded
   ```shell
   echo | openssl s_client -showcerts -connect 127.0.0.1:6443 -servername api 2>/dev/null | openssl x509 -noout -enddate
   ```
9. Generate kube configuration file again (optional)
   ```shell
   rm -rf /etc/kubernetes/admin.conf
   rm -rf /etc/kubernetes/controller-manager.conf
   rm -rf /etc/kubernetes/kubelet.conf
   rm -rf /etc/kubernetes/scheduler.conf

   kubeadm init phase kubeconfig all --config=./kubeadm-config.yaml
   ```
10. Update kubectl kubeconfig file on one of control plane node (optional)
    ```shell
    mv $HOME/.kube/config $HOME/.kube/config.old
    cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
    chown $(id -u):$(id -g) $HOME/.kube/config
    ```
11. Check Kubernetes cluster status:
   ```shell
    kubectl get nodes

    kubectl get componentstatuses -oyaml
   ```

  ## Step 5) 6) 7) should be executed on each control plane node one by one.