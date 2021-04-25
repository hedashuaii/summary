# sourcemap

在webpack配置文件当中，使用 devtool 字段对webpack进行sourcemap的的打包配置

```
devtool: "source-map", // enum
```

## 各配置项关键词说明

eval:
不会单独生成sourcemap文件, 会将映射关系存储到打包的文件中, 并且通过eval存储
优势: 性能最好
缺点: 业务逻辑比较复杂时候提示信息可能不全面不正确

source-map:
会单独生成sourcemap文件, 通过单独文件来存储映射关系
优势: 提示信息全面,可以直接定位到错误代码的行和列
缺点: 打包速度慢

inline:
不会单独生成sourcemap文件, 会将映射关系存储到打包的文件中, 并且通过base64字符串形式存储

cheap:
生成的映射信息只能定位到错误行不能定位到错误列

module:
不仅希望存储我们代码的映射关系, 还希望存储第三方模块映射关系, 以便于第三方模块出错时也能更好的排错

## 开发配置

development: **cheap-module-eval-source-map**
只需要行错误信息, 并且包含第三方模块错误信息, 并且不会生成单独sourcemap文件

production: **cheap-module-source-map**
只需要行错误信息, 并且包含第三方模块错误信息, 并且会生成单独sourcemap文件

## 文档

[传送门](https://www.webpackjs.com/configuration/devtool/)