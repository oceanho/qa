# OpenSSL

OpenSSL 使用记录

## installation

MacOS: `brew install -y openssl` or `brew install -y openssl@1.1`

## cli (openssl)

1、查看证书信息

``` shell
openssl x509 -noout -text

openssl rsa -noout -text -in myserver.key

# 查看CSR信息
openssl req -noout -text -in myserver.csr

# 查看证书信息

> openssl x509 -noout -text -in ca.crt

# 验证证书

# 会提示self signed

> openssl verify selfsign.crt

# 因为myserver.crt 是幅ca.crt发布的，所以会验证成功

> openssl verify -CAfile ca.crt myserver.crt

去掉key的密码保护

有时候每次都要输入密码太繁琐了,可以把Key的保护密码去掉

> openssl rsa -in myserver.key -out server.key.insecure

作者：liang_echo
链接：https://www.jianshu.com/p/f5f93c89155e
来源：简书
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
```
