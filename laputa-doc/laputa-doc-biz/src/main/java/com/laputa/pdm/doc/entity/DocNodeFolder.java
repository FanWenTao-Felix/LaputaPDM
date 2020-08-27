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
 * 文件夹表
 *
 * @author sommer
 * @date 2020-02-25 15:16:00
 */
@Data
@TableName("doc_node_folder")
@EqualsAndHashCode(callSuper = true)
@ApiModel(value = "文件夹表")
public class DocNodeFolder extends Model<DocNodeFolder> {
private static final long serialVersionUID = 1L;

    /**
     * 文件夹描述
     */
    @ApiModelProperty(value="文件夹描述")
    private String description;
    /**
     * 节点ID
     */
    @TableId
    @ApiModelProperty(value="节点ID")
    private String nodeId;
    }
