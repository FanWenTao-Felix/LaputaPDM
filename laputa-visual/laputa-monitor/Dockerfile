FROM java:8-jre

MAINTAINER sommer_jiang@163.com

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN mkdir -p /laputa-monitor

WORKDIR /laputa-monitor

EXPOSE 5001

ADD ./laputa-visual/laputa-monitor/target/laputa-monitor.jar ./

CMD sleep 120;java -Xms128m -Xmx256m -Djava.security.egd=file:/dev/./urandom -jar laputa-monitor.jar
