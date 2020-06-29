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
sysctl -p                                 # 重新加载 /etc/sysctl.conf, 使新的内核参数生效
sysctl -w <kernel param = value>          # 临时生效某个内核参数
```

## 内核参数分类

从内核，内存，磁盘，网络 等几个方面阐述Linux内核参数

### 通用

内核自身相关的参数

#### kernel.*

#### fs.*

`fs.file-max`，设置在Kernel级允许最大打开文件描述符数量。

查看当前参数大小 `cat /proc/sys/fs/file-max`

查看当前文件数的情况 `cat /proc/sys/fs/file-nr`

``` shell
# cat /proc/sys/fs/file-nr
2432	   0	      2147483584
已使用    申请中    总大小
```

### 内存内核参数

内存相关的内核参数

#### vm.*

`vm.swappiness`，设置当系统内存不足时，置换到 swap 的权重, 但不是 swap 和 page cache 的比例, 比如 swappiness = 100 意思是swappiness 和 page cache 的比例是相同的. swappiness = 20 就是 swappiness 和 page cache 比例是1:9. 减少该参数值避免使用swap可以提升系统的性能，该参数不能关闭swap，执行 `swapoff -a` 可以关闭 swap。参考资料：https://zhuanlan.zhihu.com/p/30888296

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

