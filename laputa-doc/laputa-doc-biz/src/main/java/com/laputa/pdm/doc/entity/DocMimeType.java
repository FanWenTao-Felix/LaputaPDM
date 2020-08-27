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
 * 文档MIME类型
 *
 * @author sommer
 * @date 2020-02-25 15:16:47
 */
@Data
@TableName("doc_mime_type")
@EqualsAndHashCode(callSuper = true)
@ApiModel(value = "文档MIME类型")
public class DocMimeType extends Model<DocMimeType> {
private static final long serialVersionUID = 1L;

    /**
     * 编号
     */
    @TableId
    @ApiModelProperty(value="编号")
    private Long id;
    /**
     * 类型描述
     */
    @ApiModelProperty(value="类型描述")
    private String description;
    /**
     * 应用工具
     */
    @ApiModelProperty(value="应用工具")
    private String application;
    /**
     * 图标路径
     */
    @ApiModelProperty(value="图标路径")
    private String iconPath;
    /**
     * 类型图标
     */
    @ApiModelProperty(value="类型图标")
    private String imageContent;
    /**
     * 类型图标类型
     */
    @ApiModelProperty(value="类型图标类型")
    private String imageMime;
    /**
     * 文件类型
     */
    @ApiModelProperty(value="文件类型")
    private String name;
    /**
     * 是否搜索
     */
    @ApiModelProperty(value="是否搜索")
    private String search;
    /**
     * 创始人
     */
    @ApiModelProperty(value="创始人")
    private String createUser;
    /**
     * 创建时间
     */
    @ApiModelProperty(value="创建时间")
    private LocalDateTime createTime;
    /**
     * 类型 video 
     */
    @ApiModelProperty(value="类型 video ")
    private String mimeType;
    /**
     * 是否删除
     */
    @ApiModelProperty(value="是否删除")
    private String delFlag;
    /**
     * 所属租户
     */
    @ApiModelProperty(value="所属租户",hidden=true)
    private Integer tenantId;
    }
