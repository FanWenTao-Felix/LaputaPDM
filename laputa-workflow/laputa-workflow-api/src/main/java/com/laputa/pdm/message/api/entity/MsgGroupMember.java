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
 *
 *
 * @author Sommer 20200221
 * @date 2020-02-13 14:37:41
 */
@Data
@TableName("msg_group_member")
@EqualsAndHashCode(callSuper = true)
@ApiModel(value = "")
public class MsgGroupMember extends Model<MsgGroupMember> {
private static final long serialVersionUID = 1L;
    public static final int PERMISSION_TYPE_NONE = 0; // 默认权限，普通成员
    public static final int PERMISSION_TYPE_ADMIN = 1;  // 管理员
    public static final int PERMISSION_TYPE_ADMIN_SU = 100; // 创建者

    public static final int NOTIFY_LEVEL_INVALID = -1; // 默认不接收消息
    public static final int NOTIFY_LEVEL_NONE = 0; // 默认通知级别
    public static final int NOTIFY_LEVEL_CLOSE = 1; // 接收消息不提示
    /**
     *
     */
    @TableId
    @ApiModelProperty(value="")
    private Long id;
    /**
     *
     */
    @ApiModelProperty(value="")
    private String alias;
    /**
     *
     */
    @ApiModelProperty(value="")
    private LocalDateTime createTime;
    /**
     *
     */
    @ApiModelProperty(value="")
    private Long groupId;


    /**
     *
     */
    @ApiModelProperty(value="")
    private Integer notifyLevel;
    /**
     *
     */
    @ApiModelProperty(value="")
    private Integer permissionType;
    /**
     *
     */
    @ApiModelProperty(value="")
    private LocalDateTime updateTime;
    /**
     *
     */
    @ApiModelProperty(value="")
    private Long userId;


    private MsgUser user;

    private MsgGroup group;

    public MsgGroupMember(MsgUser creator, MsgGroup group) {
    }
}
