package com.laputa.pdm.project;

import com.laputa.pdm.common.security.annotation.EnableLaputaFeignClients;
import com.laputa.pdm.common.security.annotation.EnableLaputaResourceServer;
import com.laputa.pdm.common.swagger.annotation.EnableLaputaSwagger2;

import org.springframework.boot.SpringApplication;
import org.springframework.cloud.client.SpringCloudApplication;

/**
 * @author sommer
 * <p>
 * 项目启动类
 */
@EnableLaputaSwagger2
@SpringCloudApplication
@EnableLaputaFeignClients
@EnableLaputaResourceServer
public class LaputaProjectApplication {
    public static void main(String[] args) {
        SpringApplication.run(LaputaProjectApplication.class, args);
    }
}
