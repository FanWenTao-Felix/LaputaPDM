FROM java:8-jre

MAINTAINER sommer_jiang@163.com

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN mkdir -p /laputa-codegen

WORKDIR /laputa-codegen

EXPOSE 5003

ADD ./laputa-visual/laputa-codegen/target/laputa-codegen.jar ./

CMD sleep 120;java -Xms128m -Xmx256m -Djava.security.egd=file:/dev/./urandom -jar laputa-codegen.jar
