# About

Linux 下常用的命令总结

## 统计显示服务器的网络连接状态

- 命令：`netstat -n| awk '/^tcp/ {++S[$NF]} END {for(a in S) print a, S[a]}'`
- 用途：用于排查服务器常见的网络问题，比如连不上 Web 了，CLOSE_WAIT 过多问题，内核参数调优等、
