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
import com.laputa.pdm.admin.api.entity.SysRoleMenu;

/**
 * <p>
 * 角色菜单表 服务类
 * </p>
 *
 * @author sommer
 * @since 2017-10-29
 */
public interface SysRoleMenuService extends IService<SysRoleMenu> {

	/**
	 * 更新角色菜单
	 *
	 * @param role
	 * @param roleId  角色
	 * @param menuIds 菜单ID拼成的字符串，每个id之间根据逗号分隔
	 * @return
	 */
	Boolean saveRoleMenus(String role, Integer roleId, String menuIds);
}