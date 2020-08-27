/*
 *    Copyright (c) 2018-2025, Sommer 20200212 All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * Redistributions of source code must retain the above copyright notice,
 * this list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright
 * notice, this list of conditions and the following disclaimer in the
 * documentation and/or other materials provided with the distribution.
 * Neither the name of the laputapdm.com developer nor the names of its
 * contributors may be used to endorse or promote products derived from
 * this software without specific prior written permission.
 * Author: Sommer (sommer_jiang@163.com)
 */

package com.laputa.pdm.mp;

import com.laputa.pdm.common.security.annotation.EnableLaputaFeignClients;
import com.laputa.pdm.common.security.annotation.EnableLaputaResourceServer;
import com.laputa.pdm.common.swagger.annotation.EnableLaputaSwagger2;
import org.springframework.boot.SpringApplication;
import org.springframework.cloud.client.SpringCloudApplication;

/**
 * @author sommer
 * @date 2019/03/25
 * 微信公众号管理模块
 */
@EnableLaputaSwagger2
@SpringCloudApplication
@EnableLaputaFeignClients
@EnableLaputaResourceServer
public class LaputaMpPlatformApplication {

	public static void main(String[] args) {
		SpringApplication.run(LaputaMpPlatformApplication.class, args);
	}
}
