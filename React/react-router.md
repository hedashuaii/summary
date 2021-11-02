# React router

[文档](https://react-router.docschina.org/web/)

react-router 分为 **react-router-dom** 和 **react-router-native**。
react-router 是 **react-router-dom** 和 **react-router-native** 的公共部分;在 4.0 版本之前是不区分的，都在 react-router 里。
**react-router-dom** 是运行于浏览器端的，**react-router-native** 是运行于 react-native 环境下的

## 安装

```bash
npm install react-router-dom -S

npm install react-router-native -S
```

## react-router-dom

### 常用的 react-router-dom 组件

- HashRouter
- BroswerRouter
- Route
- Link
- NaviLink

```javascript
import React, { Component } from 'react'
import { NavLink, Switch, Route } from 'react-router-dom'

export default class ReactRouterStudy extends Component {
  render() {
    return (
      <div>
        <ul>
          <li> <NavLink to="/demo1">demo1</NavLink> </li>
          <li> <NavLink to="/demo2">demo2</NavLink> </li>
          <li> <NavLink to="/demo3">demo3</NavLink> </li>
        </ul>
        <div>
          {/* Switch 组件会在路由中匹配第一个匹配的组件，后续的匹配路由不响应 */}
          <Switch>
            {/*
                路由可以有两种使用方式：
                  一种是将组件放在 component 属性中；
                  另一种是以 children 的方式传入
                区别：
                  一个是传入组件的引用，一个是传入组件实例
                  传入组件的实例可以直接的传入 Prop
            */}
            <Route path="/demo1" component={Demo1} />
            <Route path="/demo2" component={Demo2} />
            <Route path="/demo3"><Demo3 /></Route>
          </Switch>
        </div>
      </div>
    )
  }
}

function Demo1 () { return <div>Demo1</div> }

function Demo2 () { return <div>Demo2</div> }

function Demo3 () { return <div>Demo3</div> }
```

## react-router-config