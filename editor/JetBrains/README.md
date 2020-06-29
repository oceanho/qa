# JetBrains

## 常见问题

1、所有 JetBrains 产品都无法启动了

``` shell
这种情况，就是 JetBrains 的产品无法正确读取解析JetBrains产品的配置，一般是因为用 -javaagent: 破解 JetBrains，然后清理掉了 agent 导致的、

举一个例子，PyCharm 2020.2.1 无法启动了，解决步骤如下
1、cd "/Applications/PyCharm.app/Contents/MacOS/"
2、执行 pycharm, 然后会看到一堆的错误提示，解决掉就可以
```

2、JetBrains 应用用户级的配置文件(.vmoptions)目录

``` shell
cd "~/Library/Application Support/JetBrains"
```
