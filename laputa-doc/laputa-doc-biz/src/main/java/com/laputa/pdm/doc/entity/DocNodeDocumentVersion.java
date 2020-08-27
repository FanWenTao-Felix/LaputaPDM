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
 * 文件版本表
 *
 * @author sommer
 * @date 2020-02-25 15:15:48
 */
@Data
@TableName("doc_node_document_version")
@EqualsAndHashCode(callSuper = true)
@ApiModel(value = "文件版本表")
public class DocNodeDocumentVersion extends Model<DocNodeDocumentVersion> {
private static final long serialVersionUID = 1L;

    /**
     * 文件版本ID
     */
    @TableId
    @ApiModelProperty(value="文件版本ID")
    private String id;
    /**
     * 作者
     */
    @ApiModelProperty(value="作者")
    private String author;
    /**
     * 文件checksum
     */
    @ApiModelProperty(value="文件checksum")
    private String checksum;
    /**
     * 文件标注
     */
    @ApiModelProperty(value="文件标注")
    private String comment;
    /**
     * 仓库ID
     */
    @ApiModelProperty(value="仓库ID")
    private String vaultId;
    /**
     * 创建时间
     */
    @ApiModelProperty(value="创建时间")
    private LocalDateTime createTime;
    /**
     * 是否是最新版本
     */
    @ApiModelProperty(value="是否是最新版本")
    private String current;
    /**
     * 文件ID
     */
    @ApiModelProperty(value="文件ID")
    private String documentId;
    /**
     * 父版本
     */
    @ApiModelProperty(value="父版本")
    private String parent;
    /**
     * 上一个版本
     */
    @ApiModelProperty(value="上一个版本")
    private String previous;
    /**
     * 阶段版本
     */
    @ApiModelProperty(value="阶段版本")
    private String stage;
    /**
     * 主版本
     */
    @ApiModelProperty(value="主版本")
    private Integer major;
    /**
     * 次版本
     */
    @ApiModelProperty(value="次版本")
    private Integer minor;
    }
