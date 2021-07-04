# new

## new 的时候做了什么

我们看一下 new 的时候的几种情况，分别做了什么

```js

function Person1(name) {
    this.name = name
}

function Person2(name) {
    this.name = name
    return {person: 'Person2'}
}

function Person3(name) {
    this.name = name
    return 'Person3'
}

const p1 = new Person1('hedashuai')
p1 // {name: 'hedashuai'}

const p2 = new Person2('hezhihui')
p2 // {person: 'Person2'}

const p3 = new Person2('xiaohe')
p3 // {name: 'xiaohe'}

```

- 实例对象的 __proto__ 属性指向 构造函数的 prototype

- 返回一个对象，如果构造函数有返回值且是对象，就返回返回值对象; 如果构造函数没有返回值，或构造函数的返回值不是对象就返回一个 实例

## 手写实现 new

简易实现

```js
function myNew(constructor, ...args) {
    // 创建一个对象，即是要返回的实例对象
    const instance = {}

    // 实例对象的 __proto__ 属性指向 构造函数的 prototype
    instance.__proto__ = constructor.prototype

    // 执行构造函数
    const res = constructor.apply(instance, args)

    // 如果构造函数有返回值，且是对象类型，就返回该返回值
    // 如果构造函数没有返回值，或构造函数的返回值不是对象就返回新建的实例对象
    return res instanceof Object ? res : instance
}
```

优化一下

```js
function myNew(constructor, ...args) {
    // 将前两步合成一步
    // 创建一个对象，即是要返回的实例对象
    // 实例对象的 __proto__ 属性指向 构造函数的 prototype
    const instance = Object.create(constructor.prototype)

    // 执行构造函数
    const res = constructor.apply(instance, args)

    // 如果构造函数有返回值，且是对象类型，就返回该返回值
    // 如果构造函数没有返回值，或构造函数的返回值不是对象就返回新建的实例对象
    return res instanceof Object ? res : instance
}
```