# Gitlab CI

## gitlab-runner

使用 gitlab runner 步骤

安装 gitlab-runner --> 创建 gitlab token --> 注册 gitlab-runner --> 安装 gitlab-runner 服务 --> 启动 gitlab-runner Service --> .gitlab-ci.yaml

1、安装 gitlab-runner

2、创建 gitlab token

3、注册 gitlab-runner

``` shell
gitlab-runner --name build-svr \
--url https://gitlab.XXX.com/ \
--token XXXXXX \
--tag-list ["prod","artifact","build"] \
--shell bash --executor shell
```

4、安装 gitlab-runner 服务

5、启动 gitlab-runner Service

6、.gitlab-ci.yaml

## .gitlab-ci.yaml

参考资料: [蓝湖 .gitlab-ci.yaml 文档](https://gitlab.lanhuapp.com/help/ci/yaml/README.md)
