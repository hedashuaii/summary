# Hooks

## 实现 componentDidMount 和 componentWillUnMount

```js
// useEffect 第二个参数传一个空数组，效果类似于 componentDidMount
useEffect(() => {
  console.log('useEffect')
}, [])

// 同理可以实现 componentWillUnMount
useEffect(() => {
  return () => {
    console.log('useEffect callback')
  }
}, [])
```
