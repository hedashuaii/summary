# setState

[setState 官方文档](https://zh-hans.reactjs.org/docs/react-component.html#setstate)

## setState 的参数
### setState 的 typescript 声明

```typescript
class Component<P, S> {
    setState<K extends keyof S>(
        state: ((prevState: Readonly<S>, props: Readonly<P>) => (Pick<S, K> | S | null)) | (Pick<S, K> | S | null),
        callback?: () => void
    ): void;
}
```

从这个 typescript 的类型声明中我们可以看出，setState 可以传两个参数

### setState 的第一个参数

#### 第一个参数的类型为对象

stateChange为状态改变对象(该对象可以体现出状态的更改)

```typescript
setState(stateChange, [callback])
```

#### 第一个参数的类型为函数

1.updater为返回stateChange对象的函数。
2.updater可以接收到state和props

```typescript
// setState(updater, [callback])
setState((state, props) => {})
```
### setState 的第二个参数

从 setState 的类型声明中我们可以看出它的第二个参数是一个可选参数，类型是一个函数，如果传递了第二个参数后它会在状态更新完毕、界面也更新后(render调用后)才被调用

### 总结

1. 对象式的setState是函数式的setState的简写方式(语法糖)
2. 使用原则：
    * 如果新状态不依赖于原状态 ===> 使用对象方式
    * 如果新状态依赖于原状态 ===> 使用函数方式
    * 如果需要在setState()执行后获取最新的状态数据, 要在第二个callback函数中读取


## setState 是同步还是异步的

setState 从源码角度来看，他就是处在一个同步任务当中，只是修改状态的调用时机是在“生命周期”或者“事件”的后面；所以会表现为一种异步的形式。
### 为什么 setState 在 setTimeout 等宏任务中表现是同步的呢？

因为 setTimeout 等宏任务执行的时候，在源码里是没有走改变批量更新这个状态的逻辑的，所以会立即修改状态，表现就变成了同步的