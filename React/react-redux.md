# react-redux

react-redux 是在 react 中更方便的使用 redux 的一个库

## Class 组件中使用 react-redux

在 class 组件中使用主要是使用 connect 函数来将 state 和 dispatch 映射到组件的 props 中

```react
import React from 'react'
import { Provider, connect } from 'react-redux'
import store from './store'
import { asyncAddAction } from './store/action'

const Content = (props: any) => {
    return (
        <div>
            {props.count}
            <div>
                <button onClick={() => { props.asyncIncrement() }}>test</button>
            </div>
        </div>
    )
}

const Children = connect(
    (state) => {
        return { count: state }
    },
    (dispatch) => {
        return {
            asyncIncrement() {
                dispatch(asyncAddAction() as any)
            },
        }
    }
)(Content)

const Main = () => {
    return (
        <Provider store={store}>
            <Children />
        </Provider>
    )
}

export default Content
```

## Hooks 组件中使用 react-redux

react-redux 主要暴露了 useSelector 和 useDispatch 这两个 hooks，可以使用这两个 hooks 来映射 state 和 dispatch 函数

```react
import React from 'react'
import { Provider } from 'react-redux'
import store from './store'
import { useSelector, useDispatch } from 'react-redux'
import { addAction, subAction } from './store/action'

const Children = (props: any) => {
    const { count } = useSelector((state) => {
        return { count: state }
    })

    const dispatch = useDispatch()
    const increment = () => { dispatch(addAction(2)) }
    const decrement = () => { dispatch(subAction(2)) }


    console.log(count, dispatch)

    return (
        <div>
            {count}
            <div>
                <button onClick={() => {
                    increment()
                }}>增加</button>
                <button onClick={() => {
                    decrement()
                }}>减少</button>
            </div>
        </div>
    )
}

const Content = () => {
    return (
        <Provider store={store}>
            <Chldren />
        </Provider>
    )
}

export default Content
```

