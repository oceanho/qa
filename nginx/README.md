# Nginx

## Nginx 调优

Linux 调优（内核参数 + Nginx参数）

### Linux 内核参数

### Nginx 配置参数优化

``` shell
#
# 以下
# nginx.conf 主配置文件，一般位于 /etc/nginx/nginx.conf
# 也可以通过 nginx -V 获取到编译信息（包括工作目录，配置文件目录，编译包括模块等）
#

user nginx;
worker_processes auto;
error_log /var/log/nginx/error.log;
pid /run/nginx.pid;

# Load dynamic modules. See /usr/share/doc/nginx/README.dynamic.
include /usr/share/nginx/modules/*.conf;

events {
    worker_connections 65535;
    use epoll;
}

http {
    log_format  main  '$remote_addr - $remote_user [$time_local] "$request" "$host" '
                      '$status $body_bytes_sent "$http_referer" '
                      '"$http_user_agent" "$http_x_forwarded_for"';

    #access_log  /var/log/nginx/access.log  main;
    #rewrite_log on;
    sendfile            on;
    tcp_nopush          on;
    tcp_nodelay         on;
    keepalive_timeout   65;
    types_hash_max_size 2048;

    include             /etc/nginx/mime.types;
    default_type        application/octet-stream;

    # Load modular configuration files from the /etc/nginx/conf.d directory.
    # See http://nginx.org/en/docs/ngx_core_module.html#include
    # for more information.
    include /etc/nginx/conf.d/*.conf;
}
```

## Reverse Proxy Server

### Proxy sub path (代理子路径)

``` shell
server {
     listen 80;
     server_name pcs.oceanho.com;
     location / {
             return 404 'pcs';
     }
     location /oms/api {
             proxy_set_header  Host        	"oms.oceanho.com";
             proxy_set_header  X-Real-IP        $http_x_forwarded_for;
             proxy_set_header  X-Forwarded-For  $proxy_add_x_forwarded_for;
             proxy_set_header  X-NginX-Proxy true;
             rewrite ^/oms/(.*)$ /$1 break;
             proxy_pass https://oms.oceanho.com;
     }
}
```
