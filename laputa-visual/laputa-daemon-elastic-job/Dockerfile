FROM java:8-jre

MAINTAINER sommer_jiang@163.com

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN mkdir -p /laputa-daemon-elastic-job

WORKDIR /laputa-daemon-elastic-job

EXPOSE 5002

ADD ./laputa-visual/laputa-daemon-elastic-job/target/laputa-daemon-elastic-job.jar ./

CMD sleep 120;java -Xms128m -Xmx256m -Djava.security.egd=file:/dev/./urandom -jar laputa-daemon-elastic-job.jar
