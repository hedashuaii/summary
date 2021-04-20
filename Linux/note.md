# 关机、重启

```
shutdown -h now
shutdown -r now
```

# 目录

* bin 全称binary，含义是二进制。该目录中存储的都是一些二进制文件，文件都是可以被运行的
* dev 该目录中主要存放的是外接设备，例如盘、其他的光盘等。在其中的外接设备是不能直接被使用的，需要挂载（类似windows下的分配盘符）
* mnt 当外接设备需要挂载的时候，就需要挂载到mnt目录下
* home 表示“家”，表示除了root用户以外其他用户的家目录，类似于windows下的User/用户目录
* proc process，表示进程，该目录中存储的是Linux运行时候的进程
* tmp 表示“临时”的，当系统运行时候产生的临时文件会在这个目录存着
* var 存放的程序/系统的日志文件的目录
* etc 该目录主要存储一些配置文件
* root 该目录是root用户自己的家目录
* sbin 全称super binary，该目录也是存储一些可以被执行的二进制文件，但是必须得有super权限的用户才能执行
* usr 存放的是用户自己安装的软件。类似于windows下的program files


# ls 指令

list

```
# ls
输出当前文件夹下的文件和文件夹名称

# ls -l
输出当前文件夹下的文件和文件夹的详细信息

# ls -lh
h => human-readable (人性化-可读的)
输出当前文件夹下的文件和文件夹的详细信息, 文件大小带单位

# ls 目录
# ls /root
输出指定目录下的文件和文件夹名称

# ls -a
输出当前文件夹下的文件和文件夹，及隐藏文件

# ls -la
输出当前文件夹下的文件、文件夹和隐藏文件的详细信息

# ls -lha
输出当前文件夹下的文件和文件夹，及隐藏文件的详细信息, 文件大小带单位
```

# pwd 指令

print working directory

```
# pwd
打印当前目录的绝对路径
```

# cd 指令

change directory

```
# cd 路径
# cd /
切换到跟目录
# cd /home
# cd ~
~表示当前用户的home目录
```

# mkdir 指令

make directory

```
# mkdir 路径
# mkdir testFloder
# mkdir /root/testFloder
# mkdir -p a/b/c/d
如果a,b,c这几个文件夹不存在也会创建
# mkdir a b c d
一次性创建多个文件夹
```

# touch 指令

```
# touch [路径]文件名称
# touch test1.txt
在当前目录新建一个 test1.txt 文件
# touch a/test2.txt
在当前目录下的a文件夹新建一个 test1.txt 文件
# touch test3.txt a/test4.txt
同时创建两个文件：一个在当前目录下创建test3.txt，一个在当前目录下的a文件夹新建一个 test4.txt 文件
```

# cp 指令

copy

```
# cp [选项] 被复制的路径 粘贴的路径
# cp ./a/test1.txt ./b/test1.txt
复制 a 下的 test1.txt 到 b 下并命名为 test1.txt
# cp ./a/test1.txt ./b/test2.txt
复制 a 下的 test1.txt 到 b 下并命名为 test2.txt
# cp -r a b
复制 a 文件夹到为 b 文件夹

```

# mv 指令

move

```
# mv 被剪切目标路径 粘贴路径
# mv a/test.txt b/test.txt
移动a下的test.txt到b中
# mv a/test.txt b/test2.txt
移动 a 下的 test.txt 到b中并重命名为 test2.txt
# mv a b
将 a 文件夹重命名为 b
# mv test1.txt test2.txt
将 test1.txt 文件重命名为 test2.txt
```

# rm 指令

remove

```
# rm b/test.txt
删除一个文件，需要确认
# rm -f a/test.txt
强制删除一个文件, -f force
# rm -rf a
强制删除一个文件夹, -r recursion
```

# vi/vim 指令

```
# vi 文件路径
# vi a/test.txt
打开文件, 并编辑
shift + : + q 退出编辑
```

# cat 指令，将文件输出到控制台

```
# cat 文件路径
# cat test.txt
将文件输出到控制台

# cat test.txt test1.txt test2.txt > 
```

# 输出重定向

```
在语句后面添加 >/>> 重定向文件名称
# ls > ls.txt
将 ls 的结果写入到 ls.txt 中
```

# df 指令，查看磁盘使用情况

查看磁盘使用情况

```
# df
显示磁盘列表
# df -h
h => human-readable (人性化-可读的)
显示磁盘列表，以高可读的形式
```

# free 指令，查看内在使用情况

查看内存使用情况

```
# free -h
查看内存全盘情况以高可用的方式
```

# head 指令，查看文件前几行

查看文件的前几行

```
# head -n 文件路径
n 代表行数
# head -6 test.txt
查看 test.txt 文件的前 6 行

# head test.txt
不设置选项的放默认输出前 10 行
```

# tail 指令，查看文件后几行

查看文件的后几行

```
# tail -n 文件路径 
n 代表行数
# tail -6 test.txt
查看 test.txt 文件的后 6 行

# tail test.txt
不设置选项的放默认输出后 10 行

# tail -f 文件路径
# tail -f log.txt
可以通过tail指令来查看一个文件的动态变化内容【变化的内容不能是用户手动增加的】
该命令一般用于查看系统的日志比较多
```

# less 指令，查看文件

```
# less 文件路径
查看文件，以较少的内容进行输出，按下辅助功能键（数字+回车、空格键+上下方向键）查看更多
退出时按： q
```

# wc 指令，统计文件信息

```
# wc -lwc 需要统计的文件路径
统计文件内容信息（包含行数、单词数、字节数）
-l：表示lines，行数
-w：表示words，单词数   依照空格来判断单词数量
-c：表示bytes，字节数

感觉没什么用的命令
```

# date 指令，输出、设置时间

```
# date
输出日期以 CST 格式
# date +%F
以这种格式输出年月日：2021-01-06
# date +%Y-%m-%d
以这种格式输出年月日：2021-01-06
# date +%T
以这种格式输出时分秒：15:44:51
# date +%H:%M-%S
以这种格式输出时分秒：15:44:51
# date "+%F %T"
以这种格式输出时间：2021-01-06 15:44:51
# date "+%Y-%m-%d %H:%M-%S"
以这种格式输出时间：2021-01-06 15:44:51

# date "-1 year" "+%F %T"
以这种格式输出一年后的时间时间：2022-01-06 15:44:51
符号的可选值：+（之后） 或者 - （之前）
单位的可选值：day（天）、month（月份）、year（年）
```

# cal 指令，输出日历

```
作用：用来输出日历的
语法1：#cal	  等价于 #cal  -1		直接输出当前月份的日历
语法2：#cal  -3			表示输出上一个月+本月+下个月的日历
语法3：#cal  -y 年份  		表示输出某一个年份的日历
```

# clear 指令

```
# clear
清屏
快捷键: ctrl + L
```

# 管道

```
管道符：|
作用：管道一般可以用于“过滤”，“特殊”，“扩展处理”。
语法：管道不能单独使用，必须需要配合前面所讲的一些指令来一起使用，其作用主要是辅助作用

# ls | grep y
过滤 ls 的结果带 y 的项目

# ls / | wc -l
统计根目录下的文档的总个数
```

# hostname 指令，读取主机名称

作用：操作服务器的主机名（读取、设置）

```
# hostname
含义：表示输出完整的主机名

# hostname -f
含义：表示输出当前主机名中的FQDN（全限定域名）
```

# id 指令， 查看用信息

```
作用：查看一个用户的一些基本信息（包含用户id，用户组id，附加组id…），该指令如果不指定用户则默认当前用户

# id
默认显示当前执行该命令的用户的基本信息

# id  用户名
显示指定用户的基本信息
```

# whoami 指令， 查看当前用户名

```
作用：“我是谁？”显示当前登录的用户名，一般用于shell脚本，用于获取当前操作的用户名方便记录日志

# whoami
```

# du 指令, 查看目录真实大小

disk usage

```
作用：查看目录的真实大小

# du -sh 目录路径
-s或--summarize 仅显示总计。
-h或--human-readable 以K，M，G为单位，提高信息的可读性。
```

# find 指令, 用于查找文件

```
# find 路径范围 选项 选项的值
    -name：按照文档名称进行搜索（支持模糊搜索）
    -type：按照文档的类型进行搜索
            文档类型：“-”表示文件（在使用find的时候需要用f来替换），“d”表示文件夹
```

# service 指令，用于控制软件的服务启动、停止、重启

```
#service 服务名 start/stop/restart

#service httpd start
需要启动本机安装的Apache（网站服务器软件），其服务名httpd
```

# kill 指令，杀死进程

```
# kill  进程PID
可以通过 ps 指令查看对应的 PID
# killall 进行名称
```

# ifconifg 指令，查看网卡信息

```
# ifconifg
inet addr就是网卡的ip地址
```

# reboot 指令，重启

```
# reboot
```

# shutdown，关机

```
#shutdown -h now “关机提示” 
立刻关机
#shutdown  -h 15:25 “关机提示”
定时关机，表示 15:25 时关机
```

# 删除光标前后的字符

```
Ctrl + U
删除光标前的所有字符

Ctrl + K
删除光标后的所有字符
```

