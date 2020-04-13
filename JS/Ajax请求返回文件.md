# Ajax请求返回文件

注意: jquery ajax 返回类型不支持 blob, 所以如果需要使用, 需要使用原生的 ajax

```JavaScript

var xhr = new XMLHttpRequest();

xhr.open('GET', 'http://localhost:9000/');

// 设置 AJAX 请求返回的类型是 blob 类型
xhr.responseType = 'blob';

xhr.send();

xhr.onreadystatechange = function() {
    if(this.readyState === 4) {
        if((this.status >= 200 && this.status < 300) || this.status === 304) {
            // 注意的是, 以往服务端返回的数据都放在 this.responseText 当中
            // 因为设置了 responseType为'blob' , 返回的内容就放在了 response 当中
            console.log(this.response, typeof this.response);

            // 因为 URL 还存在兼容问题所以做一下兼容处理
            var URL_util = window.URL || window.webkitURL;

            // 创建一个地址, 可以通过地址访问该文件
            var link = URL_util.createObjectURL(this.response);
            document.querySelector('#download').href = link;
        }
    }
}

```