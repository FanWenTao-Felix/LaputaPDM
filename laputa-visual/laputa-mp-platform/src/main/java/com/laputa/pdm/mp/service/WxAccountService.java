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
package com.laputa.pdm.mp.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.laputa.pdm.common.core.util.R;
import com.laputa.pdm.mp.entity.WxAccount;

/**
 * 公众号账户
 *
 * @author sommer
 * @date 2019-03-26 22:07:53
 */
public interface WxAccountService extends IService<WxAccount> {

	/**
	 * 生成公众号二维码
	 *
	 * @param appId
	 * @return
	 */
	R generateQr(String appId);

	/**
	 * 获取公众号统计数据
	 *
	 * @param appId
	 * @param interval
	 * @return
	 */
	R statistics(String appId, String interval);
}
