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

package com.laputa.pdm.daemon.elastic.job;

import com.dangdang.ddframe.job.api.ShardingContext;
import com.dangdang.ddframe.job.api.simple.SimpleJob;
import lombok.extern.slf4j.Slf4j;

/**
 * @author sommer
 * @date 2018/2/7
 * 测试Job
 */
@Slf4j
public class LaputaSimpleJob2 implements SimpleJob {
	/**
	 * 业务执行逻辑
	 *
	 * @param shardingContext 分片信息
	 */
	@Override
	public void execute(ShardingContext shardingContext) {
		log.info("第二个执行了:{}", shardingContext);
	}
}
