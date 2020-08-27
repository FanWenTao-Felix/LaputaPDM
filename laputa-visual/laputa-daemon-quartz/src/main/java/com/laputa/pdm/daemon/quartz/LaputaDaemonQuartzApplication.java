package com.laputa.pdm.daemon.quartz;

import com.laputa.pdm.common.security.annotation.EnableLaputaFeignClients;
import com.laputa.pdm.common.security.annotation.EnableLaputaResourceServer;
import com.laputa.pdm.common.swagger.annotation.EnableLaputaSwagger2;
import org.springframework.boot.SpringApplication;
import org.springframework.cloud.client.SpringCloudApplication;

/**
 * @author frwcloud
 * @date 2019/01/23
 * 定时任务模块
 */
@EnableLaputaSwagger2
@SpringCloudApplication
@EnableLaputaFeignClients
@EnableLaputaResourceServer
public class LaputaDaemonQuartzApplication {

	public static void main(String[] args) {
		SpringApplication.run(LaputaDaemonQuartzApplication.class, args);
	}
}
