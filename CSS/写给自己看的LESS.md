# 写给自己看的LESS

[LESS中文官网](https://less.bootcss.com/)

## 变量

定义变量：
```
@变量名: 变量值;
```

LESS代码：
```LESS
@width: 10px;
@height: @width + 10px;

#header {
  width: @width;
  height: @height;
}
```

编译后： 
```CSS
#header {
  width: 10px;
  height: 20px;
}
```