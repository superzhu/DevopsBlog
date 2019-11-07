Docker commands

1 List Dangling images
  docker images -f dangling=true
  
2 Remove Dangling Images
  docker rmi $(docker images -f dangling=true -q)
  docker images --quiet --filter=dangling=true | xargs --no-run-if-empty docker rmi
  
  Remove Unused Docker Images
  docker image prune -a
  
3 Purging All Unused or Dangling Images, Containers, Volumes, and Networks
  docker system prune
  
4 Remove all exited containers
  docker ps -a -f status=exited
  
  docker rm $(docker ps -a -f status=exited -q)
  
5 Remove dangling volumes - Docker 1.9 and later
  docker volume ls -f dangling=true
  docker volume prune
  
6. Remove image tag
   docker rmi registry.cn-zhangjiakou.aliyuncs.com/bizconf_devops/deepin_qt:v20base-qt5.11