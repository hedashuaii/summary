# Promise

## 手写 Promise

- 创建时必须传入一个函数, 否则会报错
- 会给传入的函数设置两个回调函数
- 刚创建的Promise对象状态是pending
- 状态一旦发生改变就不可再次改变
- 可以通过then来监听状态的改变
    - 如果添加监听时状态已经改变, 立即执行监听的回调
    - 如果添加监听时状态还未改变, 那么状态改变时候再执行监听回到
    - 同一个Promise对象可以添加多个then监听, 状态改变时所有的监听按照添加顺序执行

- then方法每次执行完毕都会返回一个新的Promise对象
- 上一个Promise对象的then可以给下一个Promise的then传递数据
    - 无论上一个是在成功的回调还是失败的回调传递的参数都会传递给下一个成功的回调
    - 如果上一个传递的是Promise对象, 那么传给下一个的成功还是失败由传递的Promise状态决定

- then方法返回的Promise对象的状态和前一个Promise的状态默认相同
- 后一个Promise对象的then可以捕获前一个Promise then的异常
- catch方法就是then方法的语法糖 then(undefined, function(){});

```typescript
enum PromiseStatus {
    pending = "pending", // 等待状态
    reject = "reject",  // 成功状态
    fulfilled = "fulfilled",  // 拒绝状态
}

class MyPromise {

    status = PromiseStatus.pending

    resolveCallbacks: ((value: any) => any)[] = []
    rejectCallbacks: ((reason: any) => any)[] = []
    value: any
    reason: any
    
    constructor(callback: (resolve: any, reject: any) => void) {
        // 如果不是函数类型的，招聘异常
        if(!this._isFunction(callback)) {
            throw new Error("Promise constructor param should be a function");
        }
        
        callback(this.resolve.bind(this), this.reject.bind(this))
    }

    resolve(value: any) {
        // 判断一下，是为了保证 Promise 的状态只改变一次
        if(this.status !== PromiseStatus.pending) return

        this.value = value
        this.status = PromiseStatus.fulfilled

        // 执行回调函数队列
        this.resolveCallbacks.forEach(item => item(this.value))
    }

    reject(reason: any) {
        // 判断一下，是为了保证 Promise 的状态只改变一次
        if(this.status !== PromiseStatus.pending) return

        this.reason = reason
        this.status = PromiseStatus.reject

        // 执行回调函数队列
        this.rejectCallbacks.forEach(item => item(this.reason))
    }

    then(resolveCallback?: (value: any) => any, rejectCallback?: (reason: any) => any) {
        return new MyPromise((nextResolve, nextReject) => {
            const resolveCbIsFun = this._isFunction(resolveCallback)
            const rejectCbIsFun = this._isFunction(rejectCallback)

            // 如果 resolveCallback 是函数 且当前是 fulfilled 状态，resolveCallback 立即执行
            if(resolveCbIsFun && this.status === PromiseStatus.fulfilled) {
                try {
                    const res = resolveCallback!(this.value)
                    if(res instanceof MyPromise) {
                        res.then(nextResolve, nextReject)
                    } else {
                        nextResolve(res)
                    }
                } catch (error) {
                    nextReject(error)
                }
            }

            // 如果 rejectCallback 是函数 且当前是 reject 状态，rejectCallback 立即执行
            if(rejectCbIsFun && this.status === PromiseStatus.reject) {
                try {
                    const res = rejectCallback!(this.reason)
                    if(res instanceof MyPromise) {
                        res.then(nextResolve, nextReject)
                    } else if (res !== undefined) {
                        nextResolve(res)
                    } else [
                        nextReject()
                    ]
                } catch (error) {
                    nextReject(error)
                }
            }

            // 如果当前是 pending 状态，记录下回调函数
            if(this.status === PromiseStatus.pending) {
                this.resolveCallbacks.push((v) => {
                    try {
                        const res = resolveCallback!(v)
                        if(res instanceof MyPromise) {
                            res.then(nextResolve, nextReject)
                        } else {
                            nextResolve(res)
                        }
                    } catch (error) {
                        nextReject(error)
                    }
                })
                this.rejectCallbacks.push((v) => {
                    try {
                        const res = rejectCallback!(v)
                        if(res instanceof MyPromise) {
                            res.then(nextResolve, nextReject)
                        } else if (res !== undefined) {
                            nextResolve(res)
                        } else [
                            nextReject()
                        ]
                    } catch (error) {
                        nextReject(error)
                    }
                })
            }
        })
    }

    catch(rejectCallback: (reason: any) => any) {
        return this.then(undefined, rejectCallback)
    }

    // 判断 obj 是否是一个函数类型
    _isFunction(obj: any) {
        return typeof obj === 'function'
    }
}
```