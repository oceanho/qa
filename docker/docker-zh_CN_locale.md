# Docker zh_CN 字符集

[参考资料，设置 Docker image 的 Locale](https://jdhao.github.io/2019/09/27/linux_locale_settings/)

``` shell
FROM postgres:9.4
RUN apt-get update && \
    apt-get install -y locales

RUN sed -i -e 's/# zh_CN.UTF-8 UTF-8/zh_CN.UTF-8 UTF-8/' /etc/locale.gen && locale-gen

ENV LC_ALL zh_CN.UTF-8
```
