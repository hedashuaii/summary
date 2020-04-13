# 文件上传框

加上 capture 中的字段的值, 在移动端可以直接打开相应的应用, 

* camera =>  照片
* camcorder =>  摄像机
* microphone =>  麦克风

加上 accept 中的字段的值, 就可以指定上传的文件类型

* image =>  照片
* video =>  摄像机
* audio =>  麦克风

加上 multiple 可以一次选择多个文件

```JavaScript
<input type="file" name="" id="" accept="image/*" capture="camera"> 照片
<input type="file" name="" id="" accept="video/*" capture="camcorder"> 摄像机
<input type="file" name="" id="" accept="audio/*" capture="microphone"> 麦克风
```