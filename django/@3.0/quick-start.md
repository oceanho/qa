# Django 3.0 Quick Start

## 安装

## 基础知识

1. brew
1. python virtualenv

### 创建 venv

安装 virtualenv，`brew install virtualenv`

``` shell
virtualenv -p python3.8 ./venv
```

## 数据库

### 用 mysql 作为数据库 Engine

安装 `mysqlclient` 依赖 `mysql-client`，参考 https://pypi.org/project/mysqlclient/

``` shell

brew install mysql-client

# 注意，安装完成后，注意下面的这话，等会用得到.
mysql-client is keg-only, which means it was not symlinked into /usr/local,
because it conflicts with mysql (which contains client libraries).

If you need to have mysql-client first in your PATH run:
  echo 'export PATH="/usr/local/opt/mysql-client/bin:$PATH"' >> /Users/ocean/.bash_profile

For compilers to find mysql-client you may need to set:
  export LDFLAGS="-L/usr/local/opt/mysql-client/lib"
  export CPPFLAGS="-I/usr/local/opt/mysql-client/include"

For pkg-config to find mysql-client you may need to set:
  export PKG_CONFIG_PATH="/usr/local/opt/mysql-client/lib/pkgconfig"
```

安装 `mysqlclient`

``` shell
  export LDFLAGS="-L/usr/local/opt/mysql-client/lib"
  export CPPFLAGS="-I/usr/local/opt/mysql-client/include"
  export PKG_CONFIG_PATH="/usr/local/opt/mysql-client/lib/pkgconfig"
  
  pip install mysqlclient
```
