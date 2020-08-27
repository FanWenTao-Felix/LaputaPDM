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

package com.laputa.pdm.common.security.exception;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.laputa.pdm.common.security.component.LaputaAuth2ExceptionSerializer;
import org.springframework.http.HttpStatus;

/**
 * @author sommer
 * @date 2018/7/8
 */
@JsonSerialize(using = LaputaAuth2ExceptionSerializer.class)
public class ForbiddenException extends LaputaAuth2Exception {
	public ForbiddenException(String msg) {
		super(msg);
	}
	public ForbiddenException(String msg, Throwable t) {
		super(msg,t);
	}

	@Override
	public String getOAuth2ErrorCode() {
		return "access_denied";
	}

	@Override
	public int getHttpErrorCode() {
		return HttpStatus.FORBIDDEN.value();
	}

}

