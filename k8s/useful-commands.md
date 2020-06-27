# kubectl useful Commands
The kubectl cli useful Commands

- 获取 k8s 的 API Groups
  - 命令
    - 获取 groups: `kubectl api-resources -o wide`
    - 获取 server api verion 列表: `kubectl api-versions`
  - 用途
    - 编写 k8s Yaml 文件的时候不知道 ApiVersion 写啥
    
- \<TAB\> 自动补全 kubectl 参数
  - 命令
    - `source<(kubectl completion bash)`
  - 用途
    - tab补全，可以支持多种 shell 的补全
    
- 用 Stdin 方式实现 kubectl apply -f
  - 命令
    - ``` shell
      cat <<EOF | kubectl apply -f -
      k8s Yaml 文件内容
      EOF
      
      # Example
      cat <<EOF | kubectl apply -f -
      apiVersion: v1
      kind: Service
      metadata:
        name: db-svc
      spec:
        selector:
          app: mysql
        ports:
          - protocol: TCP
            port: 53306
            targetPort: 3306
      
      EOF

## 切换到某个K8S

`export KUBECONFIG=~/.k8s/api-k8s-cluster.conf`

通过设置环境变量 `KUBECONFIG`, 告诉 `kubectl` 远程的k8s API地址以及认证信息

## 删除资源无等待

`kubectl get pods -l service=lanhuapi | awk 'NR>1{print "kubectl delete pod --wait=false " $1}' | bash`
