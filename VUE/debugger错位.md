# debugger 错位

处理在 vue-cli3 创建的项目中，使用 debugger 后断点所在位置不是 debugger 位置的问题

*vue.config.js*
```js
module.export =  {
    configureWebpack: {
        devtool: 'source-map'
    }
}
```