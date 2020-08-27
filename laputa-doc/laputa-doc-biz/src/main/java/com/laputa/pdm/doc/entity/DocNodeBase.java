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
 * 文档节点
 *
 * @author sommer
 * @date 2020-02-25 15:03:59
 */
@Data
@TableName("doc_node_base")
@EqualsAndHashCode(callSuper = true)
@ApiModel(value = "文档节点")
public class DocNodeBase extends Model<DocNodeBase> {
private static final long serialVersionUID = 1L;

    /**
     * 文档节点ID
     */
    @TableId
    @ApiModelProperty(value="文档节点ID")
    private String id;
    /**
     * 作者
     */
    @ApiModelProperty(value="作者")
    private String author;
    /**
     * 内容
     */
    @ApiModelProperty(value="内容")
    private String context;
    /**
     * 创建时间
     */
    @ApiModelProperty(value="创建时间")
    private LocalDateTime createTime;
    /**
     * 文档名
     */
    @ApiModelProperty(value="文档名")
    private String name;
    /**
     * 父类 如果是根类，则是0
     */
    @ApiModelProperty(value="父类 如果是根类，则是0")
    private String parent;
    /**
     * 文档路径
     */
    @ApiModelProperty(value="文档路径")
    private String path;
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
