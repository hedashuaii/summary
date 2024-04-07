## Vue 响应式

### Vue@2 响应式

vue2中主要是通过发布订阅模式和Object.defineProperty()来实现数据响应式的。在 get 中收集依赖，在 set 中触发依赖，更新视图的渲染。

### Vue@3 响应式

vue3中主要是通过Proxy来实现数据响应式的。在 get 拦截中收集依赖，在 set 拦截中触发依赖，更新视图的渲染。

### 为什么 Vue3 中要使用 Proxy 方案来替代 Object.defineProperty()

#### Object.defineProperty() 的缺点

- 只能对属性进行劫持，不能对整个对象进行劫持；
- 只能劫持对象的属性，因此需要对每个对象的每个属性进行遍历；
- 监听数组的变化性能较差，需要靠重写 Array 原型的方法来支持。

#### Proxy 的优缺点

- Proxy 可以劫持整个对象，不需要像 Object.defineProperty() 一样遍历对象的每个属性
- Proxy 可以直接监听数组的变化，不需要重写 Array 原型上的方法
- Proxy 有多达 13 种拦截方法，不限于 apply、ownKeys、deleteProperty 等
- Proxy 的兼容性不如 Object.defineProperty()，但是现在大部分浏览器都已经支持了。


### Vue2 和 Vue3 的对比

- 类型检测：Vue2 使用的是 Flow，Vue3 使用的是 TypeScript
- 代码体积：移除部分 API 如 filter, 使用 tree-shaking
- 数据劫持：Vue2 使用的 Object.defineProperty()，Vue3 使用的 Proxy
- 编译优化：Vue3 实现了 PatchFlag 优化，重写了 DOM DIFF 算法
- Vue3 新增了 compisition API，更良好的代码复用
- Vue3 新增了 Fragment、Teleport、Suspense 组件