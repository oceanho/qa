# About

Linux 下常用的命令总结

## 统计显示服务器的网络连接状态

netstat -n| awk '/^tcp/ {++S[$NF]} END {for(a in S) print a, S[a]}'
