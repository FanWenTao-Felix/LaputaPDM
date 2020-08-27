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

package com.laputa.pdm.manager.api.service.impl;

import com.laputa.pdm.manager.api.service.ApiModelService;
import com.laputa.pdm.manager.manager.ModelInfoManager;
import com.laputa.pdm.manager.model.ModelInfo;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author LCN on 2017/11/13
 * @author LCN
 */
@Service
public class ApiModelServiceImpl implements ApiModelService {


	@Override
	public List<ModelInfo> onlines() {
		return ModelInfoManager.getInstance().getOnlines();
	}


}
