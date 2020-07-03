# node Resource相关的操作

1. **列出node上面的taints**
   ```bash
        ## 检查节点的污点
        kubectl describe node Nodename

    OR
       
       kubectl get nodes -o json | jq '.items[].spec'

    OR

      kubectl get nodes -o json | jq '.items[].spec.taints'

      [
         {
            "effect": "NoSchedule",
            "key": "node-role.kubernetes.io/master"
         }
      ]

   ```
2. **Get the list of nodes that have a specific Taint**
   ```bash
   kubectl get nodes -o go-template='{{range $item := .items}}{{with $nodename := $item.metadata.name}}{{range $taint := $item.spec.taints}}{{if and (eq $taint.key "node-role.kubernetes.io/master") (eq $taint.effect "NoSchedule")}}{{printf "%s\n" $nodename}}{{end}}{{end}}{{end}}{{end}}'

   master1
   ```
3. 从节点中移除污点
   ```bash
        kubectl taint nodes foo dedicated-

        ## kubectl taint nodes node-name key=value:NoSchedule
        kubectl taint nodes node2 node2:NoExecute-

        kubectl taint nodes kube-master1 node-role.kubernetes.io/master:NoSchedule-
   ```
4. 检查container资源使用情况
```bash
      kubectl top pod --containers --all-namespaces
```
5. Add /Remove label to/from a node
```bash
    # add label nodetype=elastic to node: kube-node1
    kubectl label nodes kube-node1 nodetype=elastic

    # remove label nodetype from node kube-node1
    kubectl label nodes kube-node1 nodetype-
```
6. 安装kubectl需要的配置文件
```bash
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```
7. Get node memorypressure
   ```bash
   kubectl describe node minikube | grep MemoryPressure
   ```
8. One more bash command to delete evicted pods
   ```bash
   kubectl get pods | grep Evicted | awk '{print $1}' | xargs kubectl delete pod
   ```
9. [kubernetes node重启，导致一些pod不能重新启动](https://stackoverflow.com/questions/33671449/how-to-restart-kubernetes-nodes)：
   ```bash
    # issue: /k8s_POD_metrics-server-79864f564f-n6fk4_kube-system_784756e6-2766-4761-b195-0a7c79ba1723_2" 
    # is already in use by container "7bdf7fa1147edaf70dfa469c5e85ae466a575cc3cdc6767e9c4252a5e990e35a". 
    # You have to remove (or rename) that container to be able to reuse that name

    docker container prune -f
    docker restart $(docker ps -a -q)
    kubectl get nodes
    systemctl restart kubelet
    
    kubectl get pods --all-namespaces
    systemctl restart docker
    
    kubectl scale deployment/calico-kube-controllers -n kube-system --replicas=1
    kubectl delete pod -n=kube-system calico-node-b9c66 (daemonset)
   ```
10. ff


## Blogs
1. [Recovering a crashed Kubernetes node](https://www.ibm.com/support/knowledgecenter/en/SS6JWS_3.5.0/UG/sc_ug_node_crash_ub.html)
2. [Kubernetes pod平滑迁移](https://www.cnblogs.com/Dev0ps/p/11088810.html)
3. [Pods are not moved when Node in NotReady state](https://github.com/kubernetes/kubernetes/issues/55713)
4. [Gracefully Shutting Down Pods in a Kubernetes Cluster](https://blog.gruntwork.io/gracefully-shutting-down-pods-in-a-kubernetes-cluster-328aecec90d)
5. [Safely Drain a Node while Respecting the PodDisruptionBudget](https://kubernetes.io/docs/tasks/administer-cluster/safely-drain-node/)
6. [kubernetes nodes notready 解决思路](https://blog.csdn.net/qq_21816375/article/details/80222689)

## Evicted Pods
1. [Understanding Kubernetes pod evicted and scheduling problems](https://sysdig.com/blog/kubernetes-pod-evicted/)
2. [Kubernetes Eviction Policies for Handling Low RAM and Disk Space Situations - Part 2](https://medium.com/@Alibaba_Cloud/kubernetes-eviction-policies-for-handling-low-ram-and-disk-space-situations-part-2-d63596aec9d2)

## Node unavailable
1. [Kubernetes Tip: What Happens To Pods Running On Node That Become Unreachable?](https://medium.com/tailwinds-navigator/kubernetes-tip-what-happens-to-pods-running-on-node-that-become-unreachable-3d409f734e5d)
