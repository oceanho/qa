# K8S useful Commands
K8S useful Commands

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
