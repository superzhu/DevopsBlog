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
8. docker save & load
```bash
        docker save -o <path for generated tar file> <image name>

        docker load -i <path to image tar file>
```
9. dd

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

## Building docker images from private git repositories
1. [Access Private Repositories from Your Dockerfile Without Leaving Behind Your SSH Keys](https://vsupalov.com/build-docker-image-clone-private-repo-ssh-key/)
2. [Building docker images from private git repositories using ssh login](https://itnext.io/building-docker-images-from-private-git-repositories-using-ssh-login-433edf5a18f2)
3. [Cloning Files From Git into a Docker Image](https://janakerman.co.uk/docker-git-clone/)
4. [Difference between save and export in Docker](https://tuhrig.de/difference-between-save-and-export-in-docker/)

# multi stage build java gitlab ci
1. [How get the most out of dockerized builds (with Gitlab)](https://medium.com/fme-developer-stories/how-get-the-most-out-of-dockerized-builds-with-gitlab-e368b960f7c1)
2. [A Guide to Docker Multi-Stage Builds](https://blog.bitsrc.io/a-guide-to-docker-multi-stage-builds-206e8f31aeb8)
3. [(Multi-stage docker) in docker as CI Sledgehammer](https://blog.scottlogic.com/2018/02/09/multi-dind-ci-boxes.html)