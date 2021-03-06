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
 * @date 2020-02-12 09:50:28
 */
@Data
@TableName("msg_push_history")
@EqualsAndHashCode(callSuper = true)
@ApiModel(value = "")
public class MsgPushHistory extends Model<MsgPushHistory> {
private static final long serialVersionUID = 1L;

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
    private LocalDateTime arrivalTime;
    /**
     *
     */
    @ApiModelProperty(value="")
    private LocalDateTime createTime;
    /**
     *
     */
    @ApiModelProperty(value="")
    private String entity;
    /**
     *
     */
    @ApiModelProperty(value="")
    private Integer entityType;
    /**
     *
     */
    @ApiModelProperty(value="")
    private Long receiverId;
    /**
     *
     */
    @ApiModelProperty(value="")
    private String receiverPushId;
    /**
     *
     */
    @ApiModelProperty(value="")
    private Long senderId;
    /**
     *
     */
    @ApiModelProperty(value="")
    private LocalDateTime updateTime;


    @ApiModelProperty(value="接收者")
    private MsgUser receiver;

    @ApiModelProperty(value="发送者")
    private MsgUser sender;


}
