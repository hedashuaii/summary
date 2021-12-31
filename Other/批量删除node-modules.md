# 批量删除node-modules

在 windows 中使用 rimraf 这个 node 插件来实现

```cmd
npm install -g rimraf
```

## 删除当前文件夹下的 node-modules

```cmd
# 进入目标文件夹下执行如下命令
rimraf node-modules
```

## 删除当前文件夹下所有子文件夹的 node-modules

```cmd
# 进入目标文件夹下执行如下命令
rimraf */node-modules
```