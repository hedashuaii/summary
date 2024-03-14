# new

```js
// ES5: 手写一个 new 实现
function myNew(constructorFuntion, ...args) {
  var obj = {};
  obj.__proto__ = constructorFuntion.prototype;
  var res = constructorFuntion.apply(obj, args);
  return res || obj;
}

// ES6: 手写一个 new 实现
function myNewEs6(constructorFuntion, ...args) {
  const obj = Object.create(constructorFuntion.prototype);
  const res = constructorFuntion.apply(obj, args);
  return res || obj;
}
```
