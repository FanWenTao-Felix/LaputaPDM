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

package com.laputa.pdm.admin.controller;

import cn.hutool.json.JSONArray;
import com.laputa.pdm.admin.api.entity.SysRouteConf;
import com.laputa.pdm.admin.service.SysRouteConfService;
import com.laputa.pdm.common.core.util.R;
import com.laputa.pdm.common.log.annotation.SysLog;
import io.swagger.annotations.Api;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;


/**
 * 路由
 *
 * @author sommer
 * @date 2018-11-06 10:17:18
 */
@RestController
@AllArgsConstructor
@RequestMapping("/route")
@Api(value = "route",tags = "动态路由管理模块")
public class SysRouteConfController {

	private final SysRouteConfService sysRouteConfService;


	/**
	 * 获取当前定义的路由信息
	 *
	 * @return
	 */
	@GetMapping
	public R listRoutes() {
		return R.ok(sysRouteConfService.list());
	}

	/**
	 * 修改路由
	 *
	 * @param routes 路由定义
	 * @return
	 */
	@SysLog("修改路由")
	@PutMapping
	public R updateAllRoutes(@RequestBody JSONArray routes) {
		return R.ok(sysRouteConfService.updateRoutes(routes));
	}

	/**
	 * 修改路由
	 *
	 * @param route 路由
	 * @return
	 */
	@SysLog("修改路由")
	@PostMapping
	public R addRoute(@RequestBody SysRouteConf route) {
		return R.ok(sysRouteConfService.add(route));
	}

	/**
	 * 修改路由
	 *
	 * @param route 路由定义
	 * @return
	 */
	@SysLog("修改单点路由")
	@PutMapping("update")
	public R updateRoutes(@RequestBody SysRouteConf route) {
		return R.ok(sysRouteConfService.updateRoute(route));
	}
}
