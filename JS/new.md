# new

```js
// 手写一个 new 实现
function myNew(constructorFuntion, ...args) {
  var obj = {};
  obj.__proto__ = constructorFuntion.prototype;
  var res = constructorFuntion.apply(obj, args);
  return res || obj;
}
```