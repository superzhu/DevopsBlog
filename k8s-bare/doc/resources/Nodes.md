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
7. ff