# Vue 响应式原理

创建vue对象的时候，vue 会遍历 data 的所有属性，使用 Object.defineProperty 定义getter / setter，拦截数据的 get 和 set;
vue 使用观察者模式在 get 中 vue 对象会收集依赖，当 set 数据时， vue 对象会更新所有的依赖

## 模版编译

通过模版生成AST语法树；
通过AST语法树生成 render 函数实现的字符串；
用 with 包裹住 render 函数的实现字符串；
render 函数 = new Function(render函数的字符串)；
通过render函数生成虚拟DOM

## v-if 和 v-show

v-if 在生成render函数的时候，是用指定变量的值来判断是否要生成一个空的虚拟DOM
v-show 则是生成一个指令， 在运行时会对这个指令进行处理

v-if 的render函数实现
```js
// vue-template-compiler 这个库可以帮我们把 template 生成 render 函数的实现
const {compile} = require("vue-template-compiler");

/* v-if 的render函数实现 */
let html = `<div v-if="flag"></div>`;
let { render: renderFunctionString} = compile(html);
console.log(renderFunctionString);
// 以下为renderFunctionString的内容
/* 
with (this) {
  return (flag) ? _c('div') : _e()
}
*/
```

v-show
```js
// vue-template-compiler 这个库可以帮我们把 template 生成 render 函数的实现
const {compile} = require("vue-template-compiler");

let html = `<div v-show="flag"></div>`;
let { render: renderFunctionString} = compile(html);
console.log(renderFunctionString);
// 以下为renderFunctionString的内容
/*
with (this) {
  return _c('div', {
    directives: [
      { 
        name: "show",
        rawName: "v-show",
        value: (flag),
        expression: "flag"
      }
    ]
  })
}
  */
```

## v-for 和 v-if 

从render函数的实现中可以看出：
v-for 的优先级更高， 会先循环三次， 再在第一个里面 if 判断，
所以效率低，不建议在同一个元素上使用v-for 和 v-if

```js
let html = `<div v-if="flag" v-for="i in 3"></div>`;
let { render: renderFunctionString} = compile(html);
console.log(renderFunctionString);

// 以下为renderFunctionString的内容
/* 
with(this) {
  return _l((3), function(i) {
    return (flag) ? _c('div') : _e()
  })
}
 */
```

## diff

通过算法对比

## v-for 为什么要用 key

因为 diff 算法对比的时候， 会用 tag 和 key 进行对比两个虚拟 DOM 是否一样
如果没有 key 的情况下， key 的值为 undefined,  两个虚拟DOM的 key 做对比时， undefined === undefined, 值就为 true,
在这种情况下， 会只比较 虚拟DOM的tag，如果tag一样则认为DOM可以复用

## 描述VUE组件渲染和更新过程

## VUE 的组件 data 为什么需要是一个 函数

因为 VUE 组件是需要复用的。
VUE 组件都要被 Vue.extend() 生成一个构造函数
在 Vue.extend 函数中， data 是被放到这个生成的构造函数的原型上
如果 data 是一个对象，则在组件复用时， 修改data，就是修改这个构造函数原型上的数据，会影响到所有的相同的组件实例
而 data 是一个方法， 就不会有影响， 因为每个组件的 data 的引用都不一样

## 为什么 new Vue 中的 data 可以是一个 对象

因为 new Vue 的实例不会被公用

## VUE 中的事件绑定

* DOM 元素的事件是通过 addEventListener 监听的
* vue 组件的事件是通过 $on 监听的(使用发布订阅模式)，vue 组件的 .native 事件是通过 addEventListener 监听的
