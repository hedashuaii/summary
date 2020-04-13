# call apply bind

call apply bind

* call(obj, arg1, arg2, ...);        // 立即执行函数   
* apply(obj, [arg1, arg2, ...]);     // 立即执行函数
* bind(obj);                         // 不立即执行, 返回一个新函数

这三个方法都是 Function 原型上的方法, 作用都是用来改变函数的 this 指向问题


## call

手写一个 call 函数

```JavaScript
// 实现一个 call 函数
Function.prototype.myCall = function(that) {
    /* this => 调用 myCall 函数 */

    var res;

    // 使用 content 来记录 this 指向的对象
    var content = that || window;

    // 关键步骤:
    // 给 content 添加一个 fn 属性
    // fn 属性保存了函数的引用
    content.fn = this;

    // 用 args 记录函数运行进的参数
    // 这个地方去除了第一个参数
    // 因为第一个参数是函数运行时的 this 指向对象
    var args = [...arguments].slice(1);

    // 因为对象身上有 fn 这个属性, 调用 fn 属性所指向的函数
    // 就会使方法中的 this 指向 content
    res = content.fn(...args);

    // 删除刚刚添加的多余属性
    delete content.fn

    return res;
}
```


## apply

手写一个 apply 函数

```JavaScript
// 手写一个 apply 函数
Function.prototype.myApply = function(that) {
    /* this => 被调用的函数 */
    
    var res;

    // 用 content 记录函数运行时 this 的指向
    var content = that || window;

    // this 指向的对象增加一个 fn 属性, 存储被调用函数的指向
    content.fn = this;

    // 判断调用 myApply 函数时, 是否传入第二个参数
    var args = arguments[1];
    if(args) {
        // 如果传入第二个参数, 则将数组解构出来, 传给被调用的函数
        // 运行该函数时, 因为是 content 调用的, 所以函数的 this 是指向 content
        res = content.fn(...args);
    } else {
        // 如果没有传入第二个参数, 则直接运行该函数
        // 运行该函数时, 因为是 content 调用的, 所以函数的 this 是指向 content
        res = content.fn();
    }

    delete content.fn;

    return res;
}
```

## bind

作用: 改变一个函数的 this 指向, 并返回一个改变指向后的新函数;

手手一个 bind 函数

```JavaScript
Function.prototype.myBind = function (context) {
    console.log(this);
    if (typeof this !== 'function') {
        throw new TypeError('Error')
    }
    const _this = this
    const args = [...arguments].slice(1)
    // 返回一个函数
    return function F() {
        // 因为返回了一个函数，我们可以 new F()，所以需要判断
        if (this instanceof F) {
            return new _this(...args, ...arguments)
        }
        return _this.apply(context, args.concat(...arguments))
    }
}
```