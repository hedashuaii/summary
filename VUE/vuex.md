# vuex

vuex 核心是： state, mutation, action；其它内容都是通过这三个衍生出来的

## 整体流程

改变 state ，如果有异步操作，在要通过 action 调用异步操作， 再在 action 中 commit mutation 并传值过去，最终在 mutation 中修改 state;
如果没有异步操作，可以直接调用 mutation 修改 state;

