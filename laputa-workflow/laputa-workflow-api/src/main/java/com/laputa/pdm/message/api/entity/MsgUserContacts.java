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

import java.time.LocalDateTime;

/**
 *
 *
 * @author Sommer
 * @date 2020-02-13 15:08:42
 */
@Data
@TableName("msg_user_contacts")
@EqualsAndHashCode(callSuper = true)
@ApiModel(value = "")
public class MsgUserContacts extends Model<MsgUserContacts> {
private static final long serialVersionUID = 1L;

    /**
     *
     */
    @TableId
    @ApiModelProperty(value="")
    private Long userId;
    /**
     *
     */
    @ApiModelProperty(value="")
    private String alias;
    /**
     *
     */
    @ApiModelProperty(value="")
    private LocalDateTime createAt;
    /**
     *
     */
    @ApiModelProperty(value="")
    private Long originId;
    /**
     *
     */
    @ApiModelProperty(value="")
    private Long targetId;
    /**
     *
     */
    @ApiModelProperty(value="")
    private LocalDateTime updateAt;


    private MsgUser target;

    private MsgUser origin;
    }
