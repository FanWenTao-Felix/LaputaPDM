/*
 *
 *      Copyright (c) 2018-2025, Sommer 20200212 All rights reserved.
 *
 *  Redistribution and use in source and binary forms, with or without
 *  modification, are permitted provided that the following conditions are met:
 *
 * Redistributions of source code must retain the above copyright notice,
 *  this list of conditions and the following disclaimer.
 *  Redistributions in binary form must reproduce the above copyright
 *  notice, this list of conditions and the following disclaimer in the
 *  documentation and/or other materials provided with the distribution.
 *  Neither the name of the laputapdm.com developer nor the names of its
 *  contributors may be used to endorse or promote products derived from
 *  this software without specific prior written permission.
 *  Author: Sommer (sommer_jiang@163.com)
 *
 */

package com.laputa.pdm.admin.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.laputa.pdm.admin.api.entity.SysLog;
import com.laputa.pdm.admin.api.vo.PreLogVo;

import java.util.List;

/**
 * <p>
 * 日志表 服务类
 * </p>
 *
 * @author sommer
 * @since 2017-11-20
 */
public interface SysLogService extends IService<SysLog> {


	/**
	 * 批量插入前端错误日志
	 *
	 * @param preLogVoList 日志信息
	 * @return true/false
	 */
	Boolean saveBatchLogs(List<PreLogVo> preLogVoList);
}