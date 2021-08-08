const fs = require('fs')
const path = require('path')

// 白名单，跳过的文件夹目录
const whiteList = ['.git', '.vscode', 'example', 'assets']
// 过滤出当前项目下的文件夹
const categories = fs.readdirSync(__dirname).filter(item => fs.statSync(item).isDirectory() && !whiteList.includes(item))

// 分类列表
const categoryList = categories.map(category => {
    return {
        // 分类名称
        name: category,
        // 分类下的文件列表
        articles: fs.readdirSync(path.resolve(category)).map(article => {
            // 获取文件名称、扩展名
            const [name, extend] = article.split('.')
            // 如果有扩展名就生成一项，如果没有就不生成
            return extend ? `* [${name}](./${category}/${article})` : null
        })
    }
})

// 将内容进行拼接
const text = categoryList.map(category => `## ${category.name}\r\n\r\n${category.articles.filter(Boolean).join('\r\n')}`).join('\r\n\r\n')

// 写内容进文件
fs.writeFileSync(path.resolve(__dirname, 'Readme.md'), text)

// 输出提示
console.log('Readme.md 创建完成!')