# Disk


## 常用操作

### 1. 不重启服务器实现磁盘扩容(fdisk)

``` shell

# 一、处理磁盘设备
1、fdisk -lu /dev/vdb      # /dev/vdb 是新加了磁盘空间，需要用于分区扩容的磁盘设备，记住 Start 数字是多少（比如: 2048）
2、fdisk /dev/vdb
2.1、d: 删除需要重新扩容大小的分区
2.2、n: 新创建分区，Start 和 第一步 获取到的 Start 必须一致.
2.3、w: 写入分区表
# 二、扩容文件系统
1. ext 文件系统
growpart /dev/vdb  1;    # 扩容分区，/dev/vdb 是扩容的磁盘设备，1 表示分区号.
resize2fs /dev/vdb1      # 调整 /dev/vdb1 分区的文件系统大小.

2. xfs 文件系统
xfs_growfs /data    # /data 是数据挂载点.

# references
# ==========
# 1. https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/storage_administration_guide/xfsgrow
# 2. https://help.aliyun.com/document_detail/25452.html?spm=5176.11065259.1996646101.searchclickresult.1db338f2e3yMCU#ResizeInInstance
```
