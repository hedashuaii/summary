```js
const chunk = (arr, size) => arr.reduce((acc, item, index, source) => (index % size === 0 && acc.push(source.slice(index, index + size)), acc), [])
```