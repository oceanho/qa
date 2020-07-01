# Python 3.X

## Installation

## 常规配置

Python 的一些常规基础配置

### 1. 配置 pip Mirror

国内通过 pip 直接安装 python package，由于网络原因，可能无法正常下载包，所以需要配置 pip 的 mirror，以加速

安装 pip 包.

``` shell

pip install pip -U
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple

# references
# 1. https://mirrors.tuna.tsinghua.edu.cn/help/pypi/
```

### 2. Tab 自动补全

``` shell
cat > ~/.pythonrc <EOF
try:
    import readline
except ImportError:
    print("Module readline not available.")
else:
    import rlcompleter
    readline.parse_and_bind("tab: complete")
EOF

# references
# 1. https://stackoverflow.com/questions/246725/how-do-i-add-tab-completion-to-the-python-shell
```

### 3. virtualenv 实现 python 环境管理

有时候，需要有多个 Python 环境，他们的依赖各自独立，virtualenv 可以实现这个需求.

``` shell

# 安装 virtualenv
pip install virtualenv
# 创建新 py env 环境.
virtualenv -p python3.8 ~/venv/py3.8
# 激活 venv
source ~/venv/py3.8/bin/activate
# 释放/取消激活当前 python venv
deactivate

```
