# Mac 配置 python 语言的开发环境

## brew

https://brew.sh/index_zh-cn

## pip Mirror

``` shell
临时使用
pip install -i https://pypi.tuna.tsinghua.edu.cn/simple some-package
注意，simple 不能少, 是 https 而不是 http

设为默认
升级 pip 到最新的版本 (>=10.0.0) 后进行配置：

pip install pip -U
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple

如果您到 pip 默认源的网络连接较差，临时使用本镜像站来升级 pip：
pip install -i https://pypi.tuna.tsinghua.edu.cn/simple pip -U
```

参考资料
https://mirror.tuna.tsinghua.edu.cn/help/pypi/


## openssl

``` shell
brew reinstall openssl

cat >> ~/.profile <<EOF
# OpenSSL for python building links.
# Reference: https://github.com/pyca/cryptography/issues/3489
export CPPFLAGS=-I/usr/local/opt/openssl/include
export LDFLAGS=-L/usr/local/opt/openssl/lib
EOF
```

可能遇到的问题(如果不配置)

1. ['openssl/opensslv.h' file not found](https://github.com/pyca/cryptography/issues/3489)


## postgres

``` shell
brew reinstall postgres
```
