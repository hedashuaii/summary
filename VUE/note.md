## v-html
有XSS攻击的风险， 子组件会被覆盖

## v-show v-if 的区别

v-show 渲染元素
v-if 只渲染值为true的元素， 但可以和v-else 和 v-else-if配合使用

## v-for 跟 v-if

## v-model
自定义组件使用v-model 
[传送门1](https://cn.vuejs.org/v2/api/#model)
[传送门2](https://cn.vuejs.org/v2/guide/components.html#%E5%9C%A8%E7%BB%84%E4%BB%B6%E4%B8%8A%E4%BD%BF%E7%94%A8-v-model)
[传送门3](https://cn.vuejs.org/v2/guide/components-custom-events.html#%E8%87%AA%E5%AE%9A%E4%B9%89%E7%BB%84%E4%BB%B6%E7%9A%84-v-model)

## 父子组件的通信

## 父子组件生命周期, destory

## 自定义 v-model

## $nextTicket

## slot

## 动态、异步组件

## keep-alive

## mixin

## MVVM

## Object.defineProperty 、Proxy

缺点： 深度监听的时候需要递归遍历、 无法监听原生数组、无法监听属性的增删

## 虚拟DOM

因为DOM操作很耗时，需要不停的回流重绘，所以要用VDOM

## diff算法

## 模版编译
with 语法

## vue 原理核心的内容就是渲染

通过字符串模版生成render函数， 再通过render函数生成虚拟DOM，通过虚拟DOM生成DOM。

初次渲染时：
  通过字符串模版生成render函数（或已经通过vue-loader生成了render函数就不需要再生成了）;
  再通过render函数生成虚拟DOM，vue 就会收集对数据的依赖（get, set）;
  通过虚拟DOM生成DOM;

更新过程：

  修改data, 触发data的set
  set会触发render函数，生成虚拟DOM
  VUE对比虚拟DOM，生成新DOM

## hash路由

```js
window.onhashchange = function (e) {
  console.log(e.oldURL);
  console.log(e.newURL);
}
```

## vue常见性能优化方式

* 合理使用 v-show 和 v-if
* 合理使用 computed
* 自定义事件，DOM事件要及时销毁
* 合理使用 keep-alive
* 合理使用 异步组件