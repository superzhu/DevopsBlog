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

7. Check cgroup used in docker 
```bash
sudo docker info | grep -i cgroup
```
8. ff

## Kubernetes：如何解决从k8s.gcr.io拉取镜像失败问题
1. docker.io仓库对google的容器做了镜像，可以通过下列命令下拉取相关镜像：
```bash
      docker pull mirrorgooglecontainers/defaultbackend-amd64:1.5
```
2. 通过docker tag命令来修改镜像的标签：
```bash
     docker tag mirrorgooglecontainers/defaultbackend-amd64:1.5  k8s.gcr.io/defaultbackend-amd64:1.5
```
3. 使用docker rmi删除不用镜像
```bash
     docker rmi mirrorgooglecontainers/defaultbackend-amd64:1.5
```
4. Override the ENTRYPOINT.
   ```bash
   docker run -ti --rm  --entrypoint /bin/sh a1d22e4b51ad
   ```

# References
1. [Ten tips for debugging Docker containers](https://medium.com/@betz.mark/ten-tips-for-debugging-docker-containers-cde4da841a1d)
2. [Saving Images and Containers as Tar Files for Sharing](http://dockerlabs.collabnix.com/beginners/saving-images-as-tar/)