# Lantern

蓝灯: [https://getlantern.org](https://getlantern.org)

## 一、MacOS

安装蓝灯客户端: [https://getlantern.org/zh_CN/index.html](https://getlantern.org/zh_CN/index.html)

安装教程-github: [https://github.com/getlantern/lantern/wiki](https://github.com/getlantern/lantern/wiki)

### 1.1、在其它电脑访问蓝灯代理

因为蓝灯服务监听的IP地址是 127.0.0.1，其它的主机(电脑)是不能直接访问到蓝灯服务的，也就是说我在 MacOS 上安装了蓝灯，想要在其它电脑上访问蓝灯代理，需要做一些额外功能（端口转发），在 Linux服务器上，我们有 iptables S/DNAT 很容易就实现了。我在 MacOS 上的 pfctl 测试后发现不能正常工作。就换了一种方法，使用 ssh + tunnel 的方式实现蓝灯服务的外部电脑的访问。

修改 MacOS 的 /etc/ssh/sshd_config, ListenAddress 修改为 127.0.0.1 （安全起见）

1、启动 SSH 服务

以下操作在 MacOS 上执行

``` shell
sudo launchctl unload  /System/Library/LaunchDaemons/ssh.plist
```

参考资料: [MacOS start ssh service](https://superuser.com/questions/478035/command-line-ssh-restart-mac-osx-mountain-lion)

2、通过 SSH 创建一个端口转发的功能

以下操作在 MacOS 上执行

``` shell
# 语法
# ssh -NfL 访问入口IP:入口端口:目标服务器IP:目标服务器端口 SSH服务器登录用户@SSH服务器IP地址
#
# 举一个例子
# 在我的 MacOS 上，有多张网卡，其中 192.168.2.1 这个IP地址的网卡是被外部
# 电脑所访问到的，我的蓝灯服务端口是 61697。
# 我们就可以创建下面这样一条 ssh tunnel, 让从 192.168.2.1:58888 请求
# 通过 ssh tunnel 到 127.0.0.1:61697 上，这样，我们在其它电脑上，就可
# 以通过  192.168.2.1:58888 访问到 MaOS 的 127.0.0.1:61697 了。
ssh -NfL 192.168.2.1:58888:127.0.0.1:61697 root@127.0.0.1
```

3、在其它电脑上使用 MacOS 的蓝灯代理服务

我这里是在Ubuntu1604上访问 MacOS 的蓝灯代理服务，以下shell支持 linux 发行版本服务器/电脑，可能不支持 Windows

``` shell
cat >/etc/profile.d/lantern.sh <<EOF
#!/bin/bash
#
function setlantternvpn(){
  export HTTP_PROXY=http://192.168.2.1:58888
  export HTTPS_PROXY=http://192.168.2.1:58888
}

function unsetlantternvpn(){
  unset HTTP_PROXY
  unset HTTPS_PROXY
}
EOF

source /etc/profile.d/lantern.sh
# 设置 http_proxy 代理环境变量
setlantternvpn
# 取消 http_proxy
#unsetlantternvpn
```
