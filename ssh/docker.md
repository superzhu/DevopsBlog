## Docker commands

1. List Dangling images
```bash
        docker images -f dangling=true
```
2. Remove Dangling Images
```bash
        docker rmi $(docker images -f dangling=true -q)
        docker images --quiet --filter=dangling=true | xargs --no-run-if-empty docker rmi
  
        Remove Unused Docker Images:
        docker image prune -a
```
3. Purging All Unused or Dangling Images, Containers, Volumes, and Networks
```bash
        docker system prune
```
4. Remove all exited containers
```bash
        docker ps -a -f status=exited
  
        docker rm $(docker ps -a -f status=exited -q)
```
5.  Remove dangling volumes - Docker 1.9 and later
```bash
        docker volume ls -f dangling=true
        docker volume prune
```
6.   Remove image tag
```bash
        docker rmi registry.cn-zhangjiakou.aliyuncs.com/bizconf_devops/deepin_qt:v20base-qt5.11
```
   