# webpack - loader

## loader 类型

- pre loader（前置 loader）
- normal laoder （普通 loader）
- inline loader （内联 loader）
- post loader （后置 loader）

在 webpack 配置文件中，通过 module.rules 属性来配置 loader。
在配置项中通过 enforce 属性来指定 loader 的执行顺序。

```js
// 内联 loader
import "inline-loader1!inline-loader2!../src/index.js";

module.rules = [
  {
    test: /\.js$/,
    enforce: "pre",
    use: ["pre-loader1", "pre-loader2"],
  },
  {
    test: /\.js$/,
    use: ["normal-loader1", "normal-loader2"],
  },
  {
    test: /\.js$/,
    enforce: "post",
    use: ["post-loader1", "post-loader2"],
  },
];
```

## loader 执行顺序

执行的原则就是从右到左，从下到上

- 先执行前置 loader
- 然后执行普通 loader
- 然后执行内联 loader
- 最后执行后置 loader

在 pitch 阶段是从左到右，从上到下执行。

## 内联方式的特殊情况

过为内联 import 语句添加前缀，可以覆盖 配置 中的所有 normal loader, preLoader 和 postLoader：

使用 ! 前缀，将禁用所有已配置的 normal loader(普通 loader)

```js
import Styles from "!style-loader!css-loader?modules!./styles.css";
```

使用 !! 前缀，将禁用所有已配置的 loader（preLoader, normal loader, postLoader）

```js
import Styles from "!!style-loader!css-loader?modules!./styles.css";
```

使用 -! 前缀，将禁用所有已配置的 preLoader 和 normal loader，但是不禁用 postLoaders

```js
import Styles from "-!style-loader!css-loader?modules!./styles.css";
```
