# 保存自动格式化

VSCode 按照vue项目的ESlint格式自动格式化文件

1. 在VSCode中安装名为“ESlint”的插件
2. 在VSCode中的设置文件中添加如下代码
```json
{	// 大括号为设置文件中最外层的大括号， 如果已经有则不需要这个大括号
	"eslint.autoFixOnSave": true,
    "editor.codeActionsOnSave": {
        "source.fixAll.eslint": true
    }
}
```

## NOTICE

需要注意的是，VSCode 打开的项目文件夹必需是当前项目的跟目录，要不然可能会失效