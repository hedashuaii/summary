# Vue 项目优化

## 常用插件 CDN 引入

```
// vue.config.js
module.exports = {
	// ...
	configureWebpack: {
		// ...
		externals: {
			'vue': 'Vue',
			'vuex': 'Vuex',
			'vue-router': 'VueRouter',
			'axios': 'axios',
			'element-ui': 'ELEMENT',
		}
	}
}
```

externals 对象的属性就是要引入的框架名称，其值就是 通过 script 标签引入的 JS 文件导出的全局变量的名称。
注意的点就是，这个全局变量的名称怎么获取了；我们可以从下面的各大框架打包后的文件头部可以看到，各个文件对外暴露的变量名称是什么。

```js
// vue.runtime.js
/* 
!function(t, e) {
    "object" == typeof exports && "undefined" != typeof module ? module.exports = e() : "function" == typeof define && define.amd ? define(e) : (t = t || self).Vue = e()
}(this, function() { 
 */

// vuex.js
/* 
!function(t, e) {
 "object" == typeof exports && "undefined" != typeof module ? module.exports = e() : "function" == typeof define && define.amd ? define(e) : (t = t || self).Vuex = e()
}(this, function() {
 */

// vue-router.js
/* 
!function(t, e) {
    "object" == typeof exports && "undefined" != typeof module ? module.exports = e() : "function" == typeof define && define.amd ? define(e) : t.VueRouter = e()
}(this, function() {
 */

// axios.js
/* 
!function(e, t) {
    "object" == typeof exports && "object" == typeof module ? module.exports = t() : "function" == typeof define && define.amd ? define([], t) : "object" == typeof exports ? exports.axios = t() : e.axios = t()
}(this, function() {
 */

// element.js
/* 
!function(e, t) {
    "object" == typeof exports && "object" == typeof module ? module.exports = t(require("vue")) : "function" == typeof define && define.amd ? define("ELEMENT", ["vue"], t) : "object" == typeof exports ? exports.ELEMENT = t(require("vue")) : e.ELEMENT = t(e.Vue)
}("undefined" != typeof self ? self : this, function(e) {
 */

```

注意点: 使用了 CDN 引入 vue 后，Chrome 浏览器调试控制台的 Vue 面板是打不开的。因为 vue.min.js 默认是生产模式，需要在 main.js 中做如下设置

```
if (process.env.NODE_ENV === 'development') {
    // 因为使用了CDN引入vue文件，默认是是关闭了 vue 调试工具的。
    Vue.config.devtools = true
}
```

## GZIP

使用 GZIP 格式的来减小请求的传输量

```
// vue.config.js
module.exports = {
	// ...
	chainWebpack: (config) => {
		config.plugin('compression').use(CompressionPlugin, [{
			test: /\.js$|\.html$|\.css$|\.jpg$|\.jpeg$|\.png/, // 需要压缩的文件类型
			threshold: 10240, // 归档需要进行压缩的文件大小最小值，我这个是10K以上的进行压缩
			deleteOriginalAssets: false, // 是否删除原文件
		}]);
	},
}
```

如果使用了 nginx 需要对 nginx 进行配置

```
// nginx 配置
/* 
http {
    include       mime.types;
    default_type  application/octet-stream;
    sendfile        on;
    keepalive_timeout  65;
    server {
        listen       80;
        server_name  ecs.hedashuai.com;
        gzip on;
        gzip_buffers 32 4K;
        gzip_comp_level 6;
        gzip_min_length 100;
        gzip_types application/javascript text/css text/xml;
        gzip_disable "MSIE [1-6]\.";
        gzip_vary on;

        location / {
           proxy_pass http://localhost:7001;
           index  index.html index.htm;
        }
    }
}
 */
```