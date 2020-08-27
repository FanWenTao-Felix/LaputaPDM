FROM java:8-jre

MAINTAINER sommer_jiang@163.com

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN mkdir -p /laputa-oa-platform

WORKDIR /laputa-oa-platform

EXPOSE 5005

ADD ./laputa-visual/laputa-oa-platform/target/laputa-oa-platform.jar ./

CMD sleep 120;java -Xms128m -Xmx256m -Djava.security.egd=file:/dev/./urandom -jar laputa-oa-platform.jar
