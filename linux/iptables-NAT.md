# iptables NAT

## 配置 iptables 作为转发服务器

![iptables NAT](./iptable-nat.jpg)

``` shell
# 1、修改 ip 包的 目标地址，实现从任意客户端访问 tcp 443 口的请求都转发到 172.16.1.100 的 443 端口上去
iptables -A PREROUTING -t nat -p tcp -s 0.0.0.0/0 --dport 443 -j DNAT --to 172.16.1.100.443
# 2、修改 ip 包的 源地址，确保转发到 172.16.1.100 的 443 端口的数据包可以正常回到 192.168.1.100 这台服务器上
iptables -A POSTROUTING -t nat -p tcp -d 172.16.1.100 --dport 443 -j SNAT --to 192.168.1.100
# 3、开启 192.168.1.100 的ip数据包转发功能
echo 1 > /proc/sys/net/ipv4/ip_forward # 临时
echo net.ipv4.ip_forward=1 >> /etc/sysctl.conf # 永久，记得执行 sysctl -p
```
