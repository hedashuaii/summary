# 题目

- 隐匿类型转换
    调用对象的 Symbol.toPrimitive || valueOf || toString 方法获取原始值

- 箭头函数与普通函数的区别
    没有自己的 this 所以不能够使用 call apply bind 这些方法来改变 this 的指向
    没有 arguments 对象
    不能做为构造函数来使用，所以函数内也不可以用 super 关键字
    不能作为 generator 函数，所以不能使用

- 手写深、浅拷贝

- 手写 call apply bind

- new 实现

- 继承

- 原型链

- this
！！！！！

- 闭包
！

- 事件机制

捕获阶段、冒泡阶段
addEventListener(事件名， 回调， 是否在捕获阶段) 
addEventListener(事件名， 回调， {
    useCaptrue: boolean
    passive: boolean
    once: boolean
}) 

- 模块化

ES6 \ CMD AMD \ COMMONJS