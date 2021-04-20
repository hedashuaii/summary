# Git 的使用

## Git 配置

```
    查看 Git 配置
    git config --list

    配置用户名和邮箱
    git config --global user.name "用户名"
    git config --global user.email "邮箱"

    修改你的用户名和邮箱
    git config --global --replace-all user.name "用户名"
    git config --global --replace-all user.email "邮箱"
```

---

## 单人开发

- 编写代码
- 通过"git add 文件名称"/"git add ." 添加到版本库的暂缓区中
- 通过git commit -m"说明" 将暂缓区的文件添加到HEAD指针指向的分支中(默认只有一个分支, master分支, 也称之为主分支)

### 单人使用 Git 管理项目的优点

- 可以通过git status查看哪些文件没有被管理, 修改了哪些文件，红色(没有被管理或者被修改了)、绿色(在暂缓区)
- 可以通过 git diff 查看具体修改了哪些代码
- 可以通过 git log / git reflog 查看项目演变历史
- 可以通过 git reset --hard 版本号  在任意版本之间切换
- 无需备份多个文件, 每次commit提交Git会自动备份

---

## 多人开发

### 创建 Git 共享版本库

```git
git init --bare
```

### 克隆远程版本库

```
git clone 远程服务器共享版本库地址
```

### 开发阶段

- 编写代码
- "git add ." 添加到暂缓区
- "git commit -m '备注内容' " 添加到HEADER指针指向的分支
- "git pull" 先从服务器获取最新的内容，以防冲突
- "git push" 在没有冲突的情况下将最新的内容提交到共享版本库

---

## 分支

### 查看分支列表

```git
// 查看本地分支列表
git branch

// 查看共享版本库中的分支列表
git branch -r
```

### 创建分支

```git
git branch 分支名称

在哪个分支中创建新的分支, 那么创建出来的新的分支就会继承当前分支的所有状态
例如:
    在master分支中创建了Dev分支
    那么创建出来的Dev分支就会继承master分支中的所有代码及状态
```

> 注意点: 一旦分支被创建出来之后, 分支就是独立的, 分支之间不会相互影响


### 切换分支

```
// 通过下面的命令来修改HEADER指针的指向
git switch 分支名称
```

> 注意点: 只要HEADER指针的指向发生了改变, 那么commit的代码就会发生改变, HEADER指针指向谁commit提交的代码就提交到谁里面

### 将本地分支提交到共享版本库

```
// 通过以下命令提交当前分支到共享版本库
git push --set-upstream origin 分支名称

// 可以使用以下命令查看远程版本库分支列表
git branch -r
```

### 合并分支

```git
// 在master分支中执行 "git merge Dev" 就代表需要将Dev分支中的代码都合并到master分支中
// 在Dev分支中执行 "git merge master" 就代表需要将master分支中的代码都合并到Dev分支中
git merge 分支名称
```

### 删除分支

```git 
// 删除本地版本库中的分支
git branch -d 分支名称

// 删除共享版本库中的分支
git push origin --delete 分支名称
```
---

## GitFlow

GitFlow 是使用 Git 的流程和规范

### GitFlow 常用分支

- **Production 分支**
也就是我们经常使用的 Master 分支，这个分支最近发布到生产环境的代码，最近发布的 Release， 这个分支只能从其他分支合并，不能在这个分支直接修改
- **Develop 分支**
这个分支是我们是我们的主开发分支，包含所有要发布到下一个 Release 的代码，这个主要合并与其他分支，比如 Feature 分支

- **Feature 分支**
这个分支主要是用来开发一个新的功能，一旦开发完成，我们合并回 Develop 分支进入下一个 Release

- **Release分支**
当你需要一个发布一个新 Release 的时候，我们基于 Develop 分支创建一个 Release 分支，完成 Release 后，我们合并到 Master 和 Develop 分支

- **Hotfix分支**
当我们在 Production 发现新的 Bug 时候，我们需要创建一个 Hotfix, 完成 Hotfix 后，我们合并回 Master 和 Develop 分支，所以 Hotfix 的改动会进入下一个Release