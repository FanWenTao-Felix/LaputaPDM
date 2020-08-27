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

package com.laputa.pdm.message.api.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 用户表
 *
 * @author Sommer 20200221
 * @date 2020-02-12 09:50:28
 */
@Data
@TableName("msg_user")
@EqualsAndHashCode(callSuper = true)
@ApiModel(value = "用户表")
public class MsgUser extends Model<MsgUser> {
private static final long serialVersionUID = 1L;

    /**
     * 主键ID
     */
    @TableId
    @ApiModelProperty(value="主键ID")
    private Integer userId;
    /**
     * 账号
     */
    @ApiModelProperty(value="账号")
    private String account;
    /**
     * 用户名
     */
    @ApiModelProperty(value="用户名")
    private String username;
    /**
     * 手机
     */
    @ApiModelProperty(value="手机")
    private String phone;
    /**
     * 头像
     */
    @ApiModelProperty(value="头像")
    private String avatar;
    /**
     * 部门ID
     */
    @ApiModelProperty(value="部门ID")
    private Integer deptId;
    /**
     * 创建时间
     */
    @ApiModelProperty(value="创建时间")
    private LocalDateTime createTime;
    /**
     * 修改时间
     */
    @ApiModelProperty(value="修改时间")
    private LocalDateTime updateTime;
    /**
     * 锁定状态
     */
    @ApiModelProperty(value="锁定状态")
    private String lockFlag;
    /**
     * 删除状态
     */
    @ApiModelProperty(value="删除状态")
    private String delFlag;
    /**
     * 所属租户
     */
    @ApiModelProperty(value="所属租户",hidden=true)
    private Integer tenantId;
    /**
     * 邮件
     */
    @ApiModelProperty(value="邮件")
    private String email;
    /**
     * 姓名
     */
    @ApiModelProperty(value="姓名")
    private String name;
    /**
     *
     */
    @ApiModelProperty(value="")
    private String token;
    /**
     *
     */
    @ApiModelProperty(value="")
    private String pushId;
    }
