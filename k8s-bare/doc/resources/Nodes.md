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
4. ff