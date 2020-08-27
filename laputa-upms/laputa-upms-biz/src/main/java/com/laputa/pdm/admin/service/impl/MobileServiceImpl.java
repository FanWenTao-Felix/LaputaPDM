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

package com.laputa.pdm.admin.service.impl;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.RandomUtil;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.exceptions.ClientException;
import com.baomidou.mybatisplus.core.toolkit.StringPool;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.laputa.pdm.admin.mapper.SysUserMapper;
import com.laputa.pdm.admin.service.MobileService;
import com.laputa.pdm.admin.api.entity.SysUser;
import com.laputa.pdm.admin.utils.SmsUtils;
import com.laputa.pdm.common.core.constant.CacheConstants;
import com.laputa.pdm.common.core.constant.SecurityConstants;
import com.laputa.pdm.common.core.constant.enums.LoginTypeEnum;
import com.laputa.pdm.common.core.exception.LaputaBaseException;
import com.laputa.pdm.common.core.util.R;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.concurrent.TimeUnit;

/**
 * @author sommer
 * @date 2018/11/14
 * <p>
 * 手机登录相关业务实现
 */
@Slf4j
@Service
@AllArgsConstructor
public class MobileServiceImpl implements MobileService {
	private final RedisTemplate redisTemplate;
	private final SysUserMapper userMapper;
	private final SmsUtils smsUtils;

	/**
	 * 发送手机验证码
	 * TODO: 调用短信网关发送验证码,测试返回前端
	 *
	 * @param mobile mobile
	 * @return code
	 */
	@Override
	public R<Boolean> sendSmsCode(String mobile) {
		List<SysUser> userList = userMapper.selectList(Wrappers
			.<SysUser>query().lambda()
			.eq(SysUser::getPhone, mobile));

		if (CollUtil.isEmpty(userList)) {
			log.info("手机号未注册:{}", mobile);
			return R.ok(Boolean.FALSE, "手机号未注册");
		}

		Object codeObj = redisTemplate.opsForValue().get(CacheConstants.DEFAULT_CODE_KEY + LoginTypeEnum.SMS.getType() + StringPool.AT + mobile);

		if (codeObj != null) {
			log.info("手机号验证码未过期:{}，{}", mobile, codeObj);
			return R.ok(Boolean.FALSE, "验证码发送过频繁");
		}

		String code = RandomUtil.randomNumbers(Integer.parseInt(SecurityConstants.CODE_SIZE));
		log.debug("手机号生成验证码成功:{},{}", mobile, code);
		redisTemplate.opsForValue().set(
			CacheConstants.DEFAULT_CODE_KEY + LoginTypeEnum.SMS.getType() + StringPool.AT + mobile
			, code, SecurityConstants.CODE_TIME, TimeUnit.SECONDS);
		SendSmsResponse response = null;

		try {

			response = smsUtils.sendSms(mobile,code);

			log.info(response.getCode()+"  "+response.getMessage());
		} catch (ClientException e) {
			e.printStackTrace();
			log.error("发射短消息失败");
			throw new LaputaBaseException("发射短消息失败");
		}

		return R.ok(Boolean.TRUE, code);
	}
}
