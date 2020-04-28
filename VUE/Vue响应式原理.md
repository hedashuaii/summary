# Vue 响应式原理

创建vue对象的时候，vue 会遍历 data 的所有属性，使用 Object.defineProperty 定义getter / setter，拦截数据的 get 和 set;
在 get 中 vue 对象会收集依赖，当 set 数据时， vue 对象会更新所有的依赖