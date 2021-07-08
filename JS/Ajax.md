# AJAX

## 手写Ajax

```JavaScript
// 请求默认参数
var defaultOption = {
    url: '',
    data: {},
    asyncFlag: true,
    dataType: '',
    method: 'get',
    timeout: 1000,
    error: (status) => { throw Error('Ajax 请求失败! status: ' + status); },
    success: (res) => { console.log(res); },
    ontimeout: () => { throw Error('Ajax 请求超时, timeout: ' + timeout); }
};

/**
 * @param obj 请求默认参数
 * @return undefined
 * */
function stringifyQuery(obj) {
    var str = '';
    for(var item in obj) {
        str += item + '=' + encodeURIComponent(obj[item]) + '&';
    }
    return str.slice(0, str.length - 1);
}

function get(
    {
        url = defaultOption.url, 
        data = defaultOption.data, 
        asyncFlag = defaultOption.asyncFlag, 
        dataType = defaultOption.dataType, 
        method = defaultOption.method, 
        timeout = defaultOption.timeout, 
        error = defaultOption.error, 
        success = defaultOption.success, 
        ontimeout = defaultOption.ontimeout
    } = {}
) {
    var xhr = new XMLHttpRequest();

    if(method.toLocaleLowerCase() === 'get') {
        // GET 请求
        url += (url.indexOf('?') >= 0 ? '' : '?') + stringifyQuery(data);
    } else if(method.toLocaleLowerCase() === 'post') {
        // POST 请求
    } else {
        // 其它请求
    }

    // 请求超时
    xhr.timeout = timeout;
    xhr.ontimeout = ontimeout;

    xhr.open(method, url, asyncFlag);
    xhr.send();

    /* 
        readyState 的各个状态值:
            0：未初始化。尚未调用 open()方法。
            1：启动。已经调用 open()方法，但尚未调用 send()方法。
            2：发送。已经调用 send()方法，但尚未接收到响应。
            3：接收。已经接收到部分响应数据。
            4：完成。已经接收到全部响应数据，而且已经可以在客户端使用了。
    */
    return new Promise((reslove, reject) => {
        xhr.onreadystatechange = function() {
            if (xhr.readyState == 4) {
                if ((xhr.status >= 200 && xhr.status < 300) || xhr.status == 304) {
                    var res = xhr.responseText;
                    if(dataType.toLocaleLowerCase() === 'json') {
                        res = JSON.parse(xhr.responseText);
                    }
                    success(res);
                    reslove(res);
                } else {
                    error(xhr.status);
                    reject(xhr.status);
                }
            }
        }
    });
    
}

get({
    url: './test.json',
    method: 'get',
    dataType: 'json',
    data: { name: 'HeDaShuai'}
});

```