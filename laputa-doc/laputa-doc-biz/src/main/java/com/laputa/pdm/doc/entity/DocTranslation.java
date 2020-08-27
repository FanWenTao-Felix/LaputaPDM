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
 * 文档翻译
 *
 * @author sommer
 * @date 2020-02-25 15:16:04
 */
@Data
@TableName("doc_translation")
@EqualsAndHashCode(callSuper = true)
@ApiModel(value = "文档翻译")
public class DocTranslation extends Model<DocTranslation> {
private static final long serialVersionUID = 1L;

    /**
     * 模块
     */
    @TableId
    @ApiModelProperty(value="模块")
    private String module;
    /**
     * 关键字
     */
    @ApiModelProperty(value="关键字")
    private String key;
    /**
     * 语言
     */
    @ApiModelProperty(value="语言")
    private String language;
    /**
     * 翻译内容
     */
    @ApiModelProperty(value="翻译内容")
    private String content;
    }
