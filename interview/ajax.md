```javascript
function ajax(options: {url: string, method: string, data: any, async: boolean, success: Function}) {
    const {url, method, data, async, success} = options
    const xhr = new XMLHttpRequest()

    // 如果是 get 将 data 拼接到URL上

    // 请求超时处理
    xhr.timeout = 2000
    xhr.ontimeout = () => {console.log('timeout');}

    // 错误监听
    xhr.onerror = (err) => {console.log('handleError', err)}

    xhr.open(method, url, async)
    xhr.send(method.toLowerCase() === 'post' ? data : undefined)

    // 设置响应类型
    xhr.responseType = 'json'

    xhr.addEventListener('readystatechange', () => {
        if(xhr.readyState !== 4) return

        if((xhr.status >= 200 && xhr.status < 300) || xhr.status === 304) {
            success && success(xhr.response)
        }
    })
}
```