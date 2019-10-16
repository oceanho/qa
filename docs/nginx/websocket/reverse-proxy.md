# WS resverse proxy

Nginx reverse proxy WebSocket

## Kernel 参数

### /etc/sysctl.conf

### /etc/secrity/limits.conf

## Nginx Web 参数

### /etc/nginx/nginx.conf

``` shell
http {
    map $http_upgrade $connection_upgrade {
        default upgrade;
        ''      close;
    }
}

```

### /etc/nginx/conf.d/notify.ws.mydomain.com.conf

改 mydomain.com 为自己的域名，或者自定义一下文件名，内容如下。
如果站点是需要接入 https，参考这里 [Nginx 配置 HTTPS](../https/defualt.md)

``` shell
upstream ws_notify_svrs {
    server  172.16.1.100:80;
    server  172.16.1.101:80;
}
server {
    listen 80;
    location /ws {
        proxy_pass http://ws_notify_svrs;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection $connection_upgrade;
    }
}

```
