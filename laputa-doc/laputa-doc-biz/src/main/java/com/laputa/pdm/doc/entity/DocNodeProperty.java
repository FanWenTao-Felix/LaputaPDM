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
 * 节点属性
 *
 * @author sommer
 * @date 2020-02-25 15:16:11
 */
@Data
@TableName("doc_node_property")
@EqualsAndHashCode(callSuper = true)
@ApiModel(value = "节点属性")
public class DocNodeProperty extends Model<DocNodeProperty> {
private static final long serialVersionUID = 1L;

    /**
     * 属性ID
     */
    @TableId
    @ApiModelProperty(value="属性ID")
    private String id;
    /**
     * 属性组
     */
    @ApiModelProperty(value="属性组")
    private String group;
    /**
     * 属性名
     */
    @ApiModelProperty(value="属性名")
    private String name;
    /**
     * 属性值
     */
    @ApiModelProperty(value="属性值")
    private String value;
    /**
     * 节点ID
     */
    @ApiModelProperty(value="节点ID")
    private String nodeId;
    }
