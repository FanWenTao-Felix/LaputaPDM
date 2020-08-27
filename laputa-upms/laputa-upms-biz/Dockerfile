FROM java:8-jre

MAINTAINER sommer_jiang@163.com

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN mkdir -p /laputa-upms

WORKDIR /laputa-upms

EXPOSE 4000

ADD ./laputa-upms/laputa-upms-biz/target/laputa-upms-biz.jar ./

CMD sleep 120;java -Xms128m -Xmx256m -Djava.security.egd=file:/dev/./urandom -jar laputa-upms-biz.jar
