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
import com.laputa.pdm.message.api.dto.GroupCreateModel;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import java.io.Serializable;
import java.time.LocalDateTime;

/**
 *
 *
 * @author  code generator
 * @date 2020-02-12 09:50:28
 */
@Data
@TableName("msg_group")
@EqualsAndHashCode(callSuper = true)
@ApiModel(value = "消息集群")
public class MsgGroup extends Model<MsgGroup> {
private static final long serialVersionUID = 1L;

    /**
     *
     */
    @TableId
    @ApiModelProperty(value="ID")
    private Long id;
    /**
     *
     */
    @ApiModelProperty(value="创建时间")
    private LocalDateTime createTime;
    /**
     *
     */
    @ApiModelProperty(value="描述")
    private String description;
    /**
     *
     */
    @ApiModelProperty(value="群组名")
    private String name;
    /**
     *
     */
    @ApiModelProperty(value="创建者ID")
    private Long ownerId;
    /**
     *
     */
    @ApiModelProperty(value="群图片")
    private String picture;
    /**
     *
     */
    @ApiModelProperty(value="更新时间")
    private LocalDateTime updateTime;

    public MsgGroup(MsgUser creator, GroupCreateModel model) {
    }
}
