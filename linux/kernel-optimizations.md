# Optimizations


Linux kernel parameter optimization.

## 预备知识

文件

``` shell
/etc/sysctl.conf                # linux kernel conf file
/proc/sys/                      # linux process system virtual dir. include kernel & os stat info.
```

命令

``` shell
sysctl -p                                 # reload /etc/sysctl.conf & effect.
sysctl -w <kernel param = value>          # write a kernel params of effect temponary.
```

## 内核参数分类

从内核，内存，磁盘，网络 等几个方面阐述Linux内核参数

### 内核自身

内核自身相关的参数

#### kernel.*

### 内存内核参数

内存相关的内核参数

#### vm.*

vm.swappiness

查看当前系统的swap大小 `cat /proc/sys/vm/swappiness`

### 磁盘内核参数

磁盘相关的内核参数

### 网络内核参数(重点)

网络相关的内核参数

## 常见场景内核参数参考

服务器常用的 Linux 内核参数参考

### Nginx

### MySQL

### Redis

### MongoDB

### GFS

### Cepher

