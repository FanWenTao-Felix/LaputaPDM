package com.laputa.pdm.pay.config;

import lombok.Data;

/**
 * @author sommer
 * @date 2019-06-19
 */
@Data
public class WxPayConfig {
	/**
	 * 服务端回调地址
	 */
	private String notifyUrl;

	/**
	 * 订单过期时间
	 */
	private String expireTime;
}