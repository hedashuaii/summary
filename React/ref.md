# ref

ref 可以拿到组件或dom元素的引用

## 使用方式

### 字符串形式

```typescript
import React, { Component } from 'react'

class RefString extends Component {
    render() {
        return (
            <div>
                <input ref="inputRef" type="text" />
                <button onClick={() => {
                    (this.refs.inputRef as HTMLInputElement).value = 'ref 设置的值'
                }}>设置值</button>
            </div>
        )
    }
}
```

### 回调函数形式

```typescript
import React, { Component } from 'react'

export default class RefCallback extends Component {
    // 声明属性，防止 ts 类型检查报错
    inputRef: HTMLInputElement | null = null

    render() {
        return (
            <div>
                <input ref={c => this.inputRef = c} type="text" />
                <button onClick={() => {
                    this.inputRef!.value = 'ref 设置的值'
                }}>设置值</button>
            </div>
        )
    }
}

```

### createRef 形式

```typescript
import React, { Component, createRef } from 'react'

export default class RefCreateRef extends Component {
    // 创建一个 ref 容器
    inputRef = createRef<HTMLInputElement>()

    render() {
        return (
            <div>
                <input ref={this.inputRef} type="text" />
                <button onClick={() => {
                    this.inputRef.current!.value = 'ref 设置的值'
                }}>设置值</button>
            </div>
        )
    }
}

```

### useRef 形式

```typescript
import React, { useRef } from 'react'

export default function UseRefDemo() {
    const ref = useRef<HTMLInputElement>(null)

    return (
        <div>
            <input ref={ref} type="text" />
            <button onClick={() => {
                // 通过 ref.current 可以拿到 input 元素的引用
                console.log(ref.current!.value)
            }}>按钮</button>
        </div>
    )
}
```

## useRef 和 createRef 的区别

useRef 是一个 hooks 只能使用在 函数组件 当中，而 createRef 是 React 对象身上的一个 API，可以使用在 函数组件 和 class 组件 当中

因为 useRef 是一个 hooks 所以一个组件实例只会创建一次，之后组件状态的更新不会重新创建，而 React.createRef 是在创建一个函数调用，只要组件更新这个 函数就会再次被调用