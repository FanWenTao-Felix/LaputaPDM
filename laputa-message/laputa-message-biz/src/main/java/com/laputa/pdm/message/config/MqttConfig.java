package com.laputa.pdm.message.config;


import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.integration.annotation.ServiceActivator;
import org.springframework.integration.channel.DirectChannel;
import org.springframework.integration.core.MessageProducer;
import org.springframework.integration.mqtt.core.DefaultMqttPahoClientFactory;
import org.springframework.integration.mqtt.core.MqttPahoClientFactory;
import org.springframework.integration.mqtt.inbound.MqttPahoMessageDrivenChannelAdapter;
import org.springframework.integration.mqtt.outbound.MqttPahoMessageHandler;
import org.springframework.integration.mqtt.support.DefaultPahoMessageConverter;
import org.springframework.messaging.MessageChannel;
import org.springframework.messaging.MessageHandler;

import java.util.UUID;


/**
 * MQTT配置，生产者
 *
 * @author sommer
 */
@Configuration
public class MqttConfig {

  private static final Logger LOGGER = LoggerFactory.getLogger(MqttConfig.class);

  private static final byte[] WILL_DATA;

  static {
    WILL_DATA = "offline".getBytes();
  }

  /**
   * 订阅的bean名称
   */
  public static final String CHANNEL_NAME_IN = "mqttInboundChannel";
  /**
   * 发布的bean名称
   */
  public static final String CHANNEL_NAME_OUT = "mqttOutboundChannel";

  @Value("${mqtt.username}")
  private String username;

  @Value("${mqtt.password}")
  private String password;

  @Value("${mqtt.url}")
  private String url;

  @Value("${mqtt.producer.clientId}")
  private String producerClientId;

  @Value("${mqtt.producer.defaultTopic}")
  private String producerDefaultTopic;

  @Value("${mqtt.consumer.clientId}")
  private String consumerClientId;

  @Value("${mqtt.consumer.defaultTopic}")
  private String consumerDefaultTopic;




  /**
   * MQTT客户端
   *
   * @return {@link org.springframework.integration.mqtt.core.MqttPahoClientFactory}
   */
  @Bean
  public MqttPahoClientFactory mqttClientFactory() {
    DefaultMqttPahoClientFactory factory = new DefaultMqttPahoClientFactory();
    factory.getConnectionOptions();

    factory.setCleanSession(true);
    // 设置连接的用户名
    factory.setUserName(username);
    // 设置连接的密码
    factory.setPassword(password);
    factory.setServerURIs(StringUtils.split(url, ","));
    // 设置超时时间 单位为秒
    factory.setConnectionTimeout(10);
    // 设置会话心跳时间 单位为秒 服务器会每隔1.5*20秒的时间向客户端发送心跳判断客户端是否在线，但这个方法并没有重连的机制
    factory.setKeepAliveInterval(20);
    // 设置“遗嘱”消息的话题，若客户端与服务器之间的连接意外中断，服务器将发布客户端的“遗嘱”消息。
    factory.setWill(new DefaultMqttPahoClientFactory.Will("willTopic",WILL_DATA,2,false));
    return factory;
  }

  /**
   * MQTT信息通道（生产者）
   *
   * @return {@link org.springframework.messaging.MessageChannel}
   */
  @Bean(name = CHANNEL_NAME_OUT)
  public MessageChannel mqttOutboundChannel() {
    return new DirectChannel();
  }

  /**
   * MQTT消息处理器（生产者）
   *
   * @return {@link org.springframework.messaging.MessageHandler}
   */
  @Bean
  @ServiceActivator(inputChannel = CHANNEL_NAME_OUT)
  public MessageHandler mqttOutbound() {
    MqttPahoMessageHandler messageHandler = new MqttPahoMessageHandler(
        producerClientId+ UUID.randomUUID().toString(),
        mqttClientFactory());
    messageHandler.setAsync(true);
    messageHandler.setDefaultTopic(producerDefaultTopic);
    return messageHandler;
  }

  /**
   * MQTT消息订阅绑定（消费者）
   *
   * @return {@link org.springframework.integration.core.MessageProducer}
   */
  @Bean
  public MessageProducer inbound() {
    // 可以同时消费（订阅）多个Topic
    MqttPahoMessageDrivenChannelAdapter adapter =
        new MqttPahoMessageDrivenChannelAdapter(
            consumerClientId+ UUID.randomUUID().toString(), mqttClientFactory(),
            StringUtils.split(consumerDefaultTopic, ","));
    adapter.setCompletionTimeout(5000);
    adapter.setConverter(new DefaultPahoMessageConverter());
    adapter.setQos(1);
    // 设置订阅通道
    adapter.setOutputChannel(mqttInboundChannel());
    return adapter;
  }

  /**
   * MQTT信息通道（消费者）
   *
   * @return {@link org.springframework.messaging.MessageChannel}
   */
  @Bean(name = CHANNEL_NAME_IN)
  public MessageChannel mqttInboundChannel() {
    return new DirectChannel();
  }

  /**
   * MQTT消息处理器（消费者）
   *
   * @return {@link org.springframework.messaging.MessageHandler}
   */
  @Bean
  @ServiceActivator(inputChannel = CHANNEL_NAME_IN)
  public MessageHandler handler() {

    return message -> LOGGER.info("========={}==========={}============",message.getHeaders().toString(), message.getPayload());
  }
}
