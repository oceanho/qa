# kubectl -o custom-columns

自定义输出列表

``` shell
kubectl get pods -o custom-columns=Name:metadata.name,HostIP:.status.hostIP
```

custom-columns 格式，`<列名(显示)>:<字段>`，字段可以通过 kubectl get pods -o yaml 查看.
