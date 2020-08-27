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
package com.laputa.pdm.doc.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.laputa.pdm.doc.entity.DocNodeBase;
import com.laputa.pdm.doc.mapper.DocNodeBaseMapper;
import com.laputa.pdm.doc.service.DocNodeBaseService;
import org.springframework.stereotype.Service;

/**
 * 文档节点
 *
 * @author sommer
 * @date 2020-02-25 15:03:59
 */
@Service
public class DocNodeBaseServiceImpl extends ServiceImpl<DocNodeBaseMapper, DocNodeBase> implements DocNodeBaseService {

}
