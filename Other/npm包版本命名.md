# npm 包版本命名含义

## 有哪些命名规范

首先我们来看一下著名库 `jquery`  的版本命名

```cmd
npm view jquery versions
```



![1651772097496](H:\project\summary\assets\imgs\npm包版本命名\1651772097496.png)

由此可见其中有三种命名规范较为特殊

* 版本名
* 版本名-alpha
* 版本名-beta
* 版本名-rc

## 命名的含义

### Alpha

**Alpha**版本仍然需要测试，其功能亦未完善，因为它是整个软件发布周期中的第一个阶段，所以它的名称是“Alpha”，[希腊字母](https://zh.wikipedia.org/wiki/希臘字母) 中的第一个字母 “[α](https://zh.wikipedia.org/wiki/Α)”。

### Beta

 **Beta**版本是软件最早对外公开的软件版本，由公司外的第三方开发者和业余玩家等参与 [公众测试](https://zh.wikipedia.org/wiki/公測)。 因为是Alpha的下一个阶段，所以为希腊字母的第二个字 Beta (β)。 一般来说，Beta包含所有功能，但可能有一些已知问题和较轻微的 [程序错误](https://zh.wikipedia.org/wiki/程序错误) （BUG），要进行调试（debug）。Beta版本的测试者通常是开发软件的组织的客户，他们会以免费或优惠价钱得到软件。Beta版本亦作为测试产品的支持和市场反应等。 

### RC

**Release Candidate**（简称**RC**）指可能成为最终产品的候选版本，如果未出现问题则可发布成为正式版本。在此阶段的产品通常包含所有功能、或接近完整，亦不会出现严重问题。

## 参考资料

以上内容主要来自维基百科，其中有对软件开发的生命周期做完善的讲解 [[链接]](https://en.wikipedia.org/wiki/Software_release_life_cycle)