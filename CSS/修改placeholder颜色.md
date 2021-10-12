# 修改 plcaeholder 颜色

## 修改 placeholder 的颜色

我们可以使用以下方法来设置 placeholder 的颜色

```scss
// 设置 placeholder 的颜色
@mixin placeholderColor($color) {
  &::-webkit-input-placeholder {
    color: $color;
  }
  &::-moz-placeholder {
    color: $color;
  }
  &::-ms-placeholder {
    color: $color;
  }
  &::placeholder {
    color: $color;
  }
}

input, textarea {
    @include placeholderColor(#c3c3c3);
}
```

## 如何在 chrome 查看 placeholder 的样式

1. 在 chrome 的控制台中打开设置页面

![image-20211012145205579](.\imgs\image-20211012145205579.png)

2. 在设置页面的 Perferences => Elements 中选中 “Show user agent shadow DOM”

![image-20211012145302078](.\imgs\image-20211012145302078.png)

即可在 Elements Tabs 中查看 Input 或 Textarea 的 placeholder 样式

 ![image-20211012145820859](.\imgs\image-20211012145820859.png)