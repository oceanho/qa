# Nginx

## Nginx 调优

Linux 调优（内核参数 + Nginx参数）

### Linux 内核参数

/etc/sysctl.conf

``` shell
fs.nr_open = 
fs.file-max = 
```

nginx.conf

``` shell
worker_rlimit_nofile 30000;
```

[nginx: Open too many files](https://www.cyberciti.biz/faq/linux-unix-nginx-too-many-open-files/)

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

内核参数

``` shell
net.ipv4.tcp_max_tw_buckets = 6000
net.ipv4.tcp_sack = 1
net.ipv4.tcp_window_scaling = 1
net.ipv4.tcp_rmem = 4096 87380 4194304
net.ipv4.tcp_wmem = 4096 16384 4194304
net.core.wmem_default = 8388608
net.core.rmem_default = 8388608
net.core.rmem_max = 16777216
net.core.wmem_max = 16777216
net.core.netdev_max_backlog = 262144
net.core.somaxconn = 262144
net.ipv4.tcp_max_orphans = 3276800
net.ipv4.tcp_max_syn_backlog = 262144
net.ipv4.tcp_timestamps = 0
net.ipv4.tcp_synack_retries = 1
net.ipv4.tcp_syn_retries = 1
net.ipv4.tcp_tw_recycle = 1
net.ipv4.tcp_tw_reuse = 1
net.ipv4.tcp_mem = 94500000 915000000 927000000
net.ipv4.tcp_fin_timeout = 1
net.ipv4.tcp_keepalive_time = 30
net.ipv4.ip_local_port_range = 1024 65000

#
# The value  in  file-max  denotes  the  maximum number of file handles
# that the Linux kernel will allocate. When you get a lot of error messages
# about running out of  file handles, you might want to raise this limit.
# The default value is 10% of  RAM in kilobytes.  To  change it, just  write 
# the new number  into the file
#
# grep -r MemTotal /proc/meminfo | awk '{printf("%d",$2/10)}'
# 32G meminfo can be config values are: 3294797
fs.file-max = 3294797

# /etc/security/limits.conf
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
