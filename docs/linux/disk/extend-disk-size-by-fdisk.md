# fdisk 扩容磁盘

1、`fdisk <磁盘>`

2、`p` # 打印磁盘分区信息，记录好起始分区号，非常重要！！！！

3、`d` # 删除需要扩容的磁盘分区

4、`n` # 重新分区，然后起始分区号写 第2步 获取到的分区号，结束分区号不能小于 第2步 的结束分区号，不然会丢数据！！！

5、`w` # 写入分区信息

6、`partprobe` # 通知内核重新读取分区表信息

7、`resize2fs <磁盘分区>` # 重新调整磁盘分区大小，不调整的话，df -h 看到的分区大小 和 fdisk 显示的大小可能不一致。
