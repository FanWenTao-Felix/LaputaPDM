CentOS安装Gogs

环境要求
数据库（选择以下一项）
git
安装数据库
下载二进制安装包
解压
运行
查看网页
配置
再次打开
开机启动
修改启动脚本
复制启动脚本到启动目录
赋予执行权限
测试启动脚本
服务脚本加入到系统启动队列
检查 gogs 服务是否已经生效
环境要求
数据库（选择以下一项）
MySQL：版本 >= 5.7
PostgreSQL
MSSQL
TiDB（实验性支持，使用 MySQL 协议连接）
或者什么都不安装，直接使用 SQLite3
git
服务端和客户端均需版本 >= 1.7.1

查看服务器git版本

git --version
1
安装数据库
请根据您的选择进行安装：

MySQL（引擎：INNODB）
PostgreSQL
可以使用 scripts/mysql.sql 来自动创建名为 gogs 的数据库。如果您选择手动创建，请务必将编码设置为 utf8mb4

mysql.sql 内容如下：

SET GLOBAL innodb_file_per_table = ON,                                                          
           innodb_file_format = Barracuda,                                                      
           innodb_large_prefix = ON;                                                            
DROP DATABASE IF EXISTS gogs;                                                                   
CREATE DATABASE IF NOT EXISTS gogs CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
1
2
3
4
5
1
2
3
4
5
下载二进制安装包
进入到软件安装目录，例如我的

cd /opt/software
1
查看对应版本的二进制包

https://gogs.io/docs/installation/install_from_binary.html

下载系统对应版本的二进制包

wget http://gogs.dn.qbox.me/gogs_0.11.66_linux_amd64.tar.gz
1
解压
tar -zxvf gogs_0.11.66_linux_amd64.tar.gz
1
运行
进入解压的目录

cd gogs/
1
执行命令

./gogs web
1
可以看到输出日志如下：

2018/09/19 14:18:31 [ INFO] Listen: http://0.0.0.0:3000
1
启动方式

直接命令启动 ./gogs web, 关闭控制台则程序关闭。
守护进程启动 nohup ./gogs web &。
使用启动脚本script文件夹中。
查看网页
这里测试服务器的IP地址是 http://192.168.234.97/

那么在浏览器中打开：

http://192.168.234.97:3000



配置
填写好数据库，操作用户，输入管理员（不填写，则安装成功后第一个注册的用户为管理员）。

当前操作用户，最好是创建一个git用户。

再次打开
再次在浏览器中打开：

http://192.168.234.97:3000



安装成功！

开机启动
修改启动脚本
vim /opt/software/gogs/scripts/init/centos/gogs
1
修改GOGS_HOME 和 GOGS_USER(最好使用默认的git用户，前提需要CentOS创建这个用户)

NAME=gogs                                                                                       
GOGS_HOME=/opt/software/gogs                                                                    
GOGS_PATH=${GOGS_HOME}/$NAME                                                                    
GOGS_USER=root  
1
2
3
4
复制启动脚本到启动目录
cp /opt/software/gogs/scripts/init/centos/gogs /etc/rc.d/init.d/
1
进入目录启动目录

cd /etc/rc.d/init.d/
1
赋予执行权限
chmod +x gogs
1
测试启动脚本
service gogs start    #启动服务

service gogs stop     #停止服务

service gogs restart  #重启服务
1
2
3
4
5
服务脚本加入到系统启动队列
chkconfig gogs on 
1
检查 gogs 服务是否已经生效
chkconfig --list gogs 
1
输出结果

gogs     0:关    1:关    2:开    3:开    4:开    5:开    6:关
1

————————————————
版权声明：本文为CSDN博主「jeikerxiao」的原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/jeikerxiao/article/details/82772348