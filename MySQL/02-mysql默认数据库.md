# mysql 默认数据库

* information_schema
保存着关于MySQL服务器所维护的所有其他数据库的信息。
如数据库名，数据库的表，表栏的数据类型与访问权限等
* mysql
MySQL系统数据库, 保存了登录用户名,密码,以及每个用户的权限等等
* performance_schema
用来保存数据库服务器性能的参数
* sys
这个库是通过视图的形式把information_schema和performance_schema结合起来，查询出更加令人容易理解的数据