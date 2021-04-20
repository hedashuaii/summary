# Vue3 中深度选择后代元素

```LESS
/* 报错： */
// [@vue/compiler-sfc] the >>> and /deep/ combinators have been deprecated. Use :deep() instead.

/* 解决方法： */
// 报错写法
.father /deep/ .son {/* ... */}
.father >>> .son {/* ... */}

// 正确写法
.father ::v-deep(.son) {/* ... */}
```
[尤大大原文 传送门](https://github.com/vuejs/rfcs/blob/master/active-rfcs/0023-scoped-styles-changes.md)