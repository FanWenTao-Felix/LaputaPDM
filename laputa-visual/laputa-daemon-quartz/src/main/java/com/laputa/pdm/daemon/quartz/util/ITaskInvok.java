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

package com.laputa.pdm.daemon.quartz.util;

import com.laputa.pdm.daemon.quartz.entity.SysJob;
import com.laputa.pdm.daemon.quartz.exception.TaskException;

/**
 * 定时任务反射实现接口类
 *
 * @author 郑健楠
 */
public interface ITaskInvok {

	/**
	 * 执行反射方法
	 *
	 * @param sysJob 配置类
	 * @throws TaskException
	 */
	void invokMethod(SysJob sysJob) throws TaskException;
}
