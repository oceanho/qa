# 排查谁(哪个公钥)登录了服务器

`ssh-keygen -lf ~/.ssh/authorized_keys`，查看 authorized_keys 文件的所有 sha256 指纹信息，配合 /var/log/auth.log 排查谁登录了服务器
