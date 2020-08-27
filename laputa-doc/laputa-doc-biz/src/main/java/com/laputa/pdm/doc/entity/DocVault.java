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
 * 文件仓管理表
 *
 * @author sommer
 * @date 2020-02-25 15:15:42
 */
@Data
@TableName("doc_vault")
@EqualsAndHashCode(callSuper = true)
@ApiModel(value = "文件仓管理表")
public class DocVault extends Model<DocVault> {
private static final long serialVersionUID = 1L;

    /**
     * 文档节点ID
     */
    @TableId
    @ApiModelProperty(value="文档节点ID")
    private String id;
    /**
     * 文件名
     */
    @ApiModelProperty(value="文件名")
    private String fileName;
    /**
     * Bucket库
     */
    @ApiModelProperty(value="Bucket库")
    private String bucketName;
    /**
     * 原始名
     */
    @ApiModelProperty(value="原始名")
    private String original;
    /**
     * 类型
     */
    @ApiModelProperty(value="类型")
    private String type;
    /**
     * 内容类型
     */
    @ApiModelProperty(value="内容类型")
    private String contentType;
    /**
     * 文件大小
     */
    @ApiModelProperty(value="文件大小")
    private Long fileSize;
    /**
     * 创始人
     */
    @ApiModelProperty(value="创始人")
    private String createUser;
    /**
     * 上传时间
     */
    @ApiModelProperty(value="上传时间")
    private LocalDateTime createTime;
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
