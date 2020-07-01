# Docker


## Installation

## 授权普通用户执行 docker XX 命令

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
