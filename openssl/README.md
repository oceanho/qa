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

# 加/解密文件
> openssl enc -e -aes-256-gcm -pass pass:<密码> -in <源文件URL> -out <目标/输出文件URL>
# -aes-256-gcm 是加密算法，-e 表示加密，解密用 -d。-pass 指定密钥，格式必须是 pass:<密码>.
作者：liang_echo
```

