FROM java:8-jre

MAINTAINER sommer_jiang@163.com

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN mkdir -p /laputa-tx-manager

WORKDIR /laputa-tx-manager

EXPOSE 5004
EXPOSE 9998

ADD ./laputa-visual/laputa-tx-manager/target/laputa-tx-manager.jar ./

CMD sleep 120;java -Xms128m -Xmx256m -Djava.security.egd=file:/dev/./urandom -jar laputa-tx-manager.jar
