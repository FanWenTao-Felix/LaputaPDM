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
import com.laputa.pdm.message.api.entity.MsgUser;
import com.laputa.pdm.message.api.entity.MsgUserContacts;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 用户表
 *
 * @author Sommer 20200221
 * @date 2020-02-12 09:50:28
 */
@Repository("msgUserMapper")
public interface MsgUserMapper extends BaseMapper<MsgUser> {

    List<MsgUser> findUsersByPushIdEqualsAndUserIdEquals(String toLowerCase, Integer userId);

    MsgUser findUserByTokenEquals(String token);

    List<MsgUser> findUsersByNameLikeLimes(String searchName);

    MsgUser findUserByUserNameEquals(String name);

    List<MsgUserContacts> findUserFollowsByOriginIdEquals(Integer userId);
}
