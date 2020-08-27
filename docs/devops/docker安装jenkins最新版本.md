# docker安装jenkins最新版本

1.pull一个jenkins镜像 docker pull jenkins/jenkins:lts;
这个是安装最新版的jenkins,如果安装旧版本，很多插件安装不上，docker环境下升级又比较麻烦。



![img](https://upload-images.jianshu.io/upload_images/5570465-7a64ce2741657fe4.png?imageMogr2/auto-orient/strip|imageView2/2/w/779/format/webp)

image.png

2.查看已经安装的jenkins镜像 docker images;

![img](https://upload-images.jianshu.io/upload_images/5570465-132e46826d0af5d1.png?imageMogr2/auto-orient/strip|imageView2/2/w/706/format/webp)

image.png



查看是否是最新版 docker inspect ba607c18aeb7



![img](https://upload-images.jianshu.io/upload_images/5570465-4240c8795cc7215a.png?imageMogr2/auto-orient/strip|imageView2/2/w/707/format/webp)

image.png

3.创建一个jenkins目录 mkdir /home/jenkins_home;
4.启动一个jenkins容器 docker run -d --name jenkins_01 -p 8081:8080 -v /home/jenkins_01:/home/jenkins_01 jenkins/jenkins:lts ;



![img](https://upload-images.jianshu.io/upload_images/5570465-77d9ebe490f3bb7f.png?imageMogr2/auto-orient/strip|imageView2/2/w/949/format/webp)

image.png

5.查看jenkins服务 docker ps | grep jenkins;



![img](https://upload-images.jianshu.io/upload_images/5570465-e551f7a7d2b84657.png?imageMogr2/auto-orient/strip|imageView2/2/w/1091/format/webp)

image.png

6.启动服务端 。localhost:8081;



![img](https://upload-images.jianshu.io/upload_images/5570465-da6b7b587332b1f1.png?imageMogr2/auto-orient/strip|imageView2/2/w/1159/format/webp)

image.png

7.进入容器内部docker exec -it jenkins_01 bash；
8.执行：cat /var/jenkins_home/secrets/initialAdminPassword，得到密码并粘贴过去



![img](https://upload-images.jianshu.io/upload_images/5570465-4bfcb4c0836fbc63.png?imageMogr2/auto-orient/strip|imageView2/2/w/1095/format/webp)

image.png



；
9.输入密码之后，重启docker镜像 docker restart {CONTAINER ID}，安装完毕。



![img](https://upload-images.jianshu.io/upload_images/5570465-667f7b8196d5bec1.png?imageMogr2/auto-orient/strip|imageView2/2/w/994/format/webp)

image.png