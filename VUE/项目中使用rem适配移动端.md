# 项目中使用 rem 适配移动端

1. 首先安装 postcss-pxtorem

```
npm install -S postcss-pxtorem
```

2. 项目根目录新建 postcss.config.js

```js
/* postcss.config.js */
module.exports = {
  plugins: {
    autoprefixer: {},
    'postcss-pxtorem': {
      rootValue: 50, // 结果为：设计稿元素尺寸/16，比如元素宽320px,最终页面会换算成 20rem
      propList: ['*'],
    },
  },
}
```

3. 项目 main.js 中引入 apdter.js 动态设置 html font-size

```js
/* apdter.js */
/* 动态设置 html font-size */
const docEl = document.documentElement
const resizeEvt = 'orientationchange' in window ? 'orientationchange' : 'resize'

function recalc() {
  const { clientWidth } = docEl
  if (!clientWidth) return
  if (clientWidth >= 768) {
    docEl.style.fontSize = '100px'
  } else {
    docEl.style.fontSize = `${100 * (clientWidth / 768)}px`
  }
}

window.addEventListener(resizeEvt, recalc, false)
document.addEventListener('DOMContentLoaded', recalc, false)
```
