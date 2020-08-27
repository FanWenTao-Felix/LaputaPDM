FROM java:8-jre

MAINTAINER sommer_jiang@163.com

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN mkdir -p /laputa-pay-platform

WORKDIR /laputa-pay-platform

EXPOSE 5010

ADD ./laputa-visual/laputa-pay-platform/target/laputa-pay-platform.jar ./

CMD sleep 120;java -Xms128m -Xmx256m -Djava.security.egd=file:/dev/./urandom -jar laputa-pay-platform.jar
