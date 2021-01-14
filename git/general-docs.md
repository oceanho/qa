# Git general Docs

## 查看某个时间段 git commit

``` shell
git log \
--pretty=format:'%h %x09% %aD %cD %cn' \
--after="2020-08-15 00:00:00" --before="2020-08-26 23:59:59"
```
