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

package com.laputa.pdm.admin.api.vo;

import com.laputa.pdm.admin.api.entity.SysLog;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;

/**
 * @author sommer
 * @date 2017/11/20
 */
@Data
@ApiModel(value = "日志展示对象")
public class LogVO implements Serializable {
	private static final long serialVersionUID = 1L;

	@ApiModelProperty(value = "日志内容")
	private SysLog sysLog;
	@ApiModelProperty(value = "产生日志的用户")
	private String username;
}
