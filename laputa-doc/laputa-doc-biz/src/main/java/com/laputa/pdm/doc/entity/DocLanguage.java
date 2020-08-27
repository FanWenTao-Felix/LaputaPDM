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

package com.laputa.pdm.doc.entity;

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
 * 文档多语言
 *
 * @author sommer
 * @date 2020-02-25 15:16:50
 */
@Data
@TableName("doc_language")
@EqualsAndHashCode(callSuper = true)
@ApiModel(value = "文档多语言")
public class DocLanguage extends Model<DocLanguage> {
private static final long serialVersionUID = 1L;

    /**
     * 语言ID
     */
    @TableId
    @ApiModelProperty(value="语言ID")
    private String id;
    /**
     * 语言名称
     */
    @ApiModelProperty(value="语言名称")
    private String name;
    /**
     * 语言图像内容
     */
    @ApiModelProperty(value="语言图像内容")
    private String imageContent;
    /**
     * 语言图像后缀名
     */
    @ApiModelProperty(value="语言图像后缀名")
    private String imageMime;
    }
