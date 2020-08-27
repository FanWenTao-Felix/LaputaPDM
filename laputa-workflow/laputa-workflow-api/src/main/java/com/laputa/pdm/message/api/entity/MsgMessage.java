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
import com.laputa.pdm.message.api.dto.MessageCreateModel;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.beans.Transient;
import java.io.Serializable;
import java.time.LocalDateTime;

/**
 *
 *
 * @author Sommer 20200221
 * @date 2020-02-12 09:50:28
 */
@Data
@TableName("msg_message")
@EqualsAndHashCode(callSuper = true)
@ApiModel(value = "")
public class MsgMessage extends Model<MsgMessage> {
    private static final long serialVersionUID = 1L;
    // 发送给人的
    public static final int RECEIVER_TYPE_NONE = 1;
    // 发送给群的
    public static final int RECEIVER_TYPE_GROUP = 2;

    public static final int TYPE_STR = 1; // 字符串类型
    public static final int TYPE_PIC = 2; // 图片类型
    public static final int TYPE_FILE = 3; // 文件类型
    public static final int TYPE_AUDIO = 4; // 语音类型


    /**
     *
     */
    @TableId
    @ApiModelProperty(value="")
    private String id;
    /**
     *
     */
    @ApiModelProperty(value="")
    private String attach;
    /**
     *
     */
    @ApiModelProperty(value="")
    private String content;
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
    private Long receiverId;
    /**
     *
     */
    @ApiModelProperty(value="")
    private Long senderId;
    /**
     *
     */
    @ApiModelProperty(value="")
    private Integer type;
    /**
     *
     */
    @ApiModelProperty(value="")
    private LocalDateTime updateTime;


    private MsgGroup group;

    private MsgUser receiver;


    public MsgMessage(MsgUser sender, MsgUser receiver, MessageCreateModel model) {
    }

    public MsgMessage(MsgUser sender, MsgGroup group, MessageCreateModel model) {
    }


}
