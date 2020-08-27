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

package com.laputa.pdm.act.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.laputa.pdm.act.dto.CommentDto;
import com.laputa.pdm.act.dto.LeaveBillDto;

import java.io.InputStream;
import java.util.List;
import java.util.Map;

/**
 * @author sommer
 * @date 2018/9/25
 */
public interface ActTaskService {


	/**
	 * 获取用户代办列表
	 *
	 * @param params
	 * @param name
	 * @return
	 */
	IPage getTaskByName(Map<String, Object> params, String name);

	/**
	 * 通过任务ID查询任务信息关联申请单信息
	 *
	 * @param id
	 * @return
	 */
	LeaveBillDto getTaskById(String id);

	/**
	 * 提交任务
	 *
	 * @param leaveBillDto
	 * @return
	 */
	Boolean submitTask(LeaveBillDto leaveBillDto);

	/**
	 * 通过任务ID 查询批注信息
	 *
	 * @param taskId 任务ID
	 * @return
	 */
	List<CommentDto> getCommentByTaskId(String taskId);

	/**
	 * 追踪图片节点
	 *
	 * @param id
	 * @return
	 */
	InputStream viewByTaskId(String id);
}
