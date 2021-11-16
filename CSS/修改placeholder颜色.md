  # 修改 plcaeholder 颜色

  ## 修改 placeholder 的颜色

  我们可以使用以下方法来设置 placeholder 的颜色

  ```scss
  // 设置 placeholder 的颜色
  @mixin placeholderColor($color) {
    // Firefox
    &::-moz-placeholder {
      color: $color;
      opacity: 1; // Override Firefox's unusual default opacity; see https://github.com/twbs/bootstrap/pull/11526
    }

    // Internet Explorer 10+
    &:-ms-input-placeholder {
      color: $color;
    }

    // Safari and Chrome
    &::-webkit-input-placeholder {
      color: $color;
    }
    
    // Standard
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

  ![image-20211012145205579](http://qiniu.hedashuai.com/cmsImg/163706370739905313908840100774/image-20211012145205579.png)

  2. 在设置页面的 Perferences => Elements 中选中 “Show user agent shadow DOM”

  ![image-20211012145302078](http://qiniu.hedashuai.com/cmsImg/1637063707400027740180513558266/image-20211012145302078.png)

  即可在 Elements Tabs 中查看 Input 或 Textarea 的 placeholder 样式

  ![image-20211012145820859](http://qiniu.hedashuai.com/cmsImg/163706370740108931260312264895/image-20211012145820859.png)