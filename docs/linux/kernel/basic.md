# Basic

Linux kernel 基础知识

## FD

FD（File Descriptor，中文: 文件描述符），在 Linux 上一切皆文件，一个进程所执行的操作，都需要创建一个或多个 FD（文件描述符），它存放于内存中，FD 有自己的数据结构，计算机内存总是有限的，因此就会有文件描述符的上限设置，而且这些设置直接影响到应用程序的最大可用性（比如能提供的最大 tcp 连接）。

[Wikepedia-FD 参考文献](https://en.wikipedia.org/wiki/File_descriptor)

## /proc

Linux /proc，一个内存映射目录，该目录包含当前系统的运行状态,内核参数,进程状态等信息

### /proc/sys/fs/file-max

该文件表示的是系统的最大文件描述符限制，临时设置

`echo 65535 > /proc/sys/fs/file-max`

### /proc/sys/fs/file-nr

查看操作系统的 FD 使用情况。

``` shell
root@ocean-ubuntu1604:~# cat /proc/sys/fs/file-nr
672  0  197632

# 672 已经分配的(正在使用)
# 0 表示使用中的？2.6.13 后该值总是为 0. man proc，搜索 file-nr 能看到具体说明
# 197632 表示最大文件描述符限制
root@ocean-ubuntu1604:~#
```

### /proc/sys/kernel/net/ipv4/tcp_mem,rmem,wmem



## /etc/sysctl.conf

这是内存参数配置文件，Linux 上所有的配置，一般都支持临时性和永久性生效。

/proc/sys/fs/file-max

## /etc/security/limits.conf
