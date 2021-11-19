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

