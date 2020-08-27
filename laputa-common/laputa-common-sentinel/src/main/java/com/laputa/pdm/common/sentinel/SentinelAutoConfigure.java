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

package com.laputa.pdm.common.sentinel;

import com.alibaba.csp.sentinel.adapter.servlet.callback.WebCallbackManager;
import com.laputa.pdm.common.sentinel.handle.LaputaUrlBlockHandler;
import com.laputa.pdm.common.sentinel.parser.LaputaHeaderRequestOriginParser;
import org.springframework.context.annotation.Configuration;

import javax.annotation.PostConstruct;

/**
 * @author sommer
 * <p>
 * sentinel 配置
 */
@Configuration
public class SentinelAutoConfigure {

	@PostConstruct
	public void initWebCallbackManager() {
		WebCallbackManager.setUrlBlockHandler(new LaputaUrlBlockHandler());
		WebCallbackManager.setRequestOriginParser(new LaputaHeaderRequestOriginParser());
	}

}
