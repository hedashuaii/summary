# vue cli 创建的项目与git远程仓库连通

情景：用 "vue cli4" 创建一个项目，想要使用 git 管理。"vue cli4" 创建的项目默认是有使用 git 功能的，但是是提交到本地， 没有配置远程仓库地址。如果想要将项目提交到远程仓库的话需要配置一下。

```
## 1、添加一个远程仓库
git remote add origin https://gitee.com/dashuaihe/test.git

## 2、拉取远程仓库中的文件
git pull

## 3、设置将 master 分支默认提交到 远程仓库的 master 分支
git branch --set-upstream-to=origin/master master

## 4、设置将远程仓库的 master 分支与本地强制合并
git pull origin master --allow-unrelated-histories
```