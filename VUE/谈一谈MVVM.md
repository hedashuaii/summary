# 谈一谈MVVM

## M => Model

Model 即 数据

## V => View

View 即 视图

## VM => ViewModel

ViewModel 在 VUE 中代表 VUE 实例

## V / M / VM 之间的联系

View 与 Model 没有直接联系, 需要通过 VM 来连接
VM 是一个侦察者, 当 Model 发生变化, VM 会通知 View 更新, 反之亦然