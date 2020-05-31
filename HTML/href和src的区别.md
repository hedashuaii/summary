# href 和 src 的区别

1. href：Hypertext Reference的缩写，超文本引用，它指向一些网络资源，建立和当前元素或者说是本文档的链接关系。在加载它的时候，不会停止对当前文档的处理，浏览器会继续往下走。常用在a、link等标签。

2. src：source的所写，表示的是对资源的引用，它指向的内容会嵌入到当前标签所在的位置。由于src的内容是页面必不可少的一部分，因此浏览器在解析src时会停下来对后续文档的处理，直到src的内容加载完毕。

总结：href用于建立当前页面与引用资源之间的关系（链接），而src则会替换当前标签。遇到href，页面会并行加载后续内容；而src则不同，浏览器需要加载完毕src的内容才会继续往下走。

```html
<!-- 会用到 href 的地方 -->
<a href="http://www.baidu.com"></a>
<link type="text/css" rel="stylesheet" href="common.css">

<!-- 会用到 src 的地方 -->
<img src="img/girl.jpg" />
<frame src="top.html"></frame>
<iframe src="top.html"></iframe>
<script src="show.js"></script>
```