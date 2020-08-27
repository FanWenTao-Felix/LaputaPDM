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
 * 文档文件表
 *
 * @author sommer
 * @date 2020-02-25 15:15:54
 */
@Data
@TableName("doc_node_document")
@EqualsAndHashCode(callSuper = true)
@ApiModel(value = "文档文件表")
public class DocNodeDocument extends Model<DocNodeDocument> {
private static final long serialVersionUID = 1L;

    /**
     * 是否检出
     */
    @ApiModelProperty(value="是否检出")
    private String checkedOut;
    /**
     * 加密方式名称
     */
    @ApiModelProperty(value="加密方式名称")
    private String cipherName;
    /**
     * 文件描述
     */
    @ApiModelProperty(value="文件描述")
    private String description;
    /**
     * 文件加密符号
     */
    @ApiModelProperty(value="文件加密符号")
    private String encryption;
    /**
     * 文档语言
     */
    @ApiModelProperty(value="文档语言")
    private String language;
    /**
     * 最后更新时间
     */
    @ApiModelProperty(value="最后更新时间")
    private LocalDateTime lastModified;
    /**
     * 创建时间
     */
    @ApiModelProperty(value="创建时间")
    private LocalDateTime createTime;
    /**
     * 作者
     */
    @ApiModelProperty(value="作者")
    private String author;
    /**
     * 加密TOKEN
     */
    @ApiModelProperty(value="加密TOKEN")
    private String token;
    /**
     * 是否锁定
     */
    @ApiModelProperty(value="是否锁定")
    private String locked;
    /**
     * 文件后缀名
     */
    @ApiModelProperty(value="文件后缀名")
    private String mimeType;
    /**
     * 文件状态 0:新创建，1:已更新，2: 已发布 100: 已废除
     */
    @ApiModelProperty(value="文件状态 0:新创建，1:已更新，2: 已发布 100: 已废除")
    private String status;
    /**
     * 文件内容
     */
    @ApiModelProperty(value="文件内容")
    private String content;
    /**
     * 是否压缩
     */
    @ApiModelProperty(value="是否压缩")
    private String textExtracted;
    /**
     * 文件名
     */
    @ApiModelProperty(value="文件名")
    private String title;
    /**
     * 仓库ID
     */
    @ApiModelProperty(value="仓库ID")
    private String vaultId;
    /**
     * 版本号
     */
    @ApiModelProperty(value="版本号")
    private String version;
    /**
     * 文件ID
     */
    @TableId
    @ApiModelProperty(value="文件ID")
    private String id;
    }
