# 虚拟机节点上部署Kubernetes

 虚拟机节点上Ansible使用部署Kubernetes

 基于阿里云搭建kubernetes cluster

## Setup passwordless SSH between ansible controller and kubernetes nodes
Enable ssh (passwordless authentication) to all other nodes, including the current node from where the installation is triggered.
无密码 ssh 登录其它节点
1. [Enable SSH Key based authentication using Ansible](https://www.middlewareinventory.com/blog/ssh-key-based-authentication-using-ansible-ad-hoc-and-playbook/)
2. [How to Setup Passwordless SSH Login](https://linuxize.com/post/how-to-setup-passwordless-ssh-login/)
3. [ansible-setup-passwordless-ssh](https://github.com/ilias-sp/ansible-setup-passwordless-ssh)




 ## References
   1. [ansible一键部署高可用Kubernetes](https://github.com/zhangguanzhang/Kubernetes-ansible)
   2. [和我一步步部署 kubernetes 集群](https://github.com/opsnull/follow-me-install-kubernetes-cluster)
   3. [使用Ansible脚本安装K8S集群](https://github.com/gjmzj/kubeasz) (kubeasz)
   4. [阿里云Kubernetes实战1–集群搭建与服务暴露](https://www.guji.work/archives/693) 风哥
   5. [k8s 国内镜像下载方案](https://www.cnblogs.com/liyongjian5179/p/11318318.html)
   6. [阿里云network plugin terway](https://github.com/AliyunContainerService/terway)


## Multiple Kubernetes Clusters Management
1. [Effectively Managing Kubernetes Access from the Terminal](https://medium.com/capital-one-tech/managing-kubernetes-contexts-for-multiple-clusters-eed174288efe)
2. [Github gopass project](https://github.com/gopasspw/gopass)
