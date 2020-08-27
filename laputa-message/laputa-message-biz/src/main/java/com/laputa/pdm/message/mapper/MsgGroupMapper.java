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

package com.laputa.pdm.message.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.laputa.pdm.message.api.entity.MsgGroup;
import org.springframework.stereotype.Repository;

import java.util.List;


/**
 *
 *
 * @author Sommer 20200221
 * @date 2020-02-12 09:50:28
 */
@Repository("msgGroupMapper")
public interface MsgGroupMapper extends BaseMapper<MsgGroup> {

    MsgGroup findGroupByNameEquals(String toLowerCase);

    List<MsgGroup> findGroupByNameLike(String searchName);
}
