# Docker


## Installation

## 常用操作

docker 的一些常用操作.

### 1.授权普通用户执行 docker XX 命令

docker 默认以 root 运行，cli docker 默认需要访问 /var/run/docker.sock 文件，从而操作docker

该文件的 owner/group 是 root:docker, 普通用户默认没有执行 docker XXX 命令的权限，需要配置下.

``` shell
#
#usermod -aG <Docker Group ID> $USER
#newgrp <Docker Group ID>
#==============================================================================
# references
# 1. https://stackoverflow.com/questions/48568172/docker-sock-permission-denied
#

sudo usermod -aG docker $USER
newgrp docker
# testing.
docker ps -a
```

### 2.Docker Image 添加 zh_CN 字符集支持

[参考资料，设置 Docker image 的 Locale](https://jdhao.github.io/2019/09/27/linux_locale_settings/)

``` shell
FROM postgres:9.4
RUN apt-get update && \
    apt-get install -y locales

RUN sed -i -e 's/# zh_CN.UTF-8 UTF-8/zh_CN.UTF-8 UTF-8/' /etc/locale.gen && locale-gen

ENV LC_ALL zh_CN.UTF-8
```
