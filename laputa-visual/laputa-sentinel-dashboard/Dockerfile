FROM java:8-jre

MAINTAINER sommer_jiang@163.com

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN mkdir -p /laputa-sentinel-dashboard

WORKDIR /laputa-sentinel-dashboard

EXPOSE 5020

ADD ./laputa-visual/laputa-sentinel-dashboard/target/laputa-sentinel-dashboard.jar ./

CMD sleep 120;java -Xms128m -Xmx256m -Djava.security.egd=file:/dev/./urandom -jar laputa-sentinel-dashboard.jar
