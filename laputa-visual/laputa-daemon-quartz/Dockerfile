FROM java:8-jre

MAINTAINER sommer_jiang@163.com

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN mkdir -p /laputa-daemon-quartz

WORKDIR /laputa-daemon-quartz

EXPOSE 5007

ADD ./laputa-visual/laputa-daemon-quartz/target/laputa-daemon-quartz.jar ./

CMD sleep 120;java -Xms128m -Xmx256m -Djava.security.egd=file:/dev/./urandom -jar laputa-daemon-quartz.jar
