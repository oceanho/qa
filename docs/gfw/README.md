# GFW

解决 GFW 问题，科学上网，满足大家日常需要上 Google 查资料，看点小视频的需要，严重鄙视那群说某度就能满足需求的“专家”。

## Lantern(蓝灯)

- [共享 MacOS 上的蓝灯服务](./lantern.md)

## Shadowsocks(影梭)

一句命令部署 sock5/http/https Proxy 服务

``` shell
#!/bin/bash
#
# Create your http/https/socks5 Proxy Services on a Docker host with one command.
#
#

local password="RjN4aCd"

# Shadow Socks Server
docker run -d \
    --name ss-local \
    --network host \
    --restart always \
    --entrypoint /usr/local/bin/ss-server \
    tommylau/shadowsocks:latest \
    -s 127.0.0.1 -p 58388 -k ${password} -m rc4-md5

# Shadow Socks Local
docker run -d \
    --name ss-local \
    --network host \
    --restart always \
    --entrypoint /usr/local/bin/ss-local \
    tommylau/shadowsocks:latest \
    -s 127.0.0.1 -p 58388 \
    -l 10800 -b 0.0.0.0 -k ${password} -m rc4-md5

# Http Proxy
docker run -d \
    --name http-proxy \
    --network host \
    --restart always \
    --entrypoint polipo \
    lsiocommunity/polipo:latest \
    socksParentProxy=127.0.0.1:10800 \
    socksProxyType=socks5 \
    proxyAddress=0.0.0.0 \
    proxyPort=18123


echo "Done, proxy service info"
echo "==========================="
echo "sock5 proxy: 0.0.0.0:10800"
echo "http/https proxy: 0.0.0.0:18123"
echo
```
