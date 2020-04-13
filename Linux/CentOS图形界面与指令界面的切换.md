## CentOS图形界面与指令界面的切换

* 查看当前系统默认：
    systemctl get-default
* 设置开机默认命令行界面：
    systemctl set-default multi-user.target
* 设置开机默认图形化界面：
    systemctl set-default graphical.target

设置后需要重启才能生效： reboot

