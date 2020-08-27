FROM java:8-jre

MAINTAINER sommer_jiang@163.com

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN mkdir -p /laputa-register

WORKDIR /laputa-register

EXPOSE 8848

ADD ./laputa-register/target/laputa-register.jar ./


CMD sleep 60;java -Xms128m -Xmx256m -Djava.security.egd=file:/dev/./urandom -jar laputa-register.jar


