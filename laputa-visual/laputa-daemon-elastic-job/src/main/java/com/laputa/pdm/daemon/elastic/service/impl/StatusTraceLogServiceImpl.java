package com.laputa.pdm.daemon.elastic.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.laputa.pdm.daemon.elastic.entity.StatusTraceLog;
import com.laputa.pdm.daemon.elastic.mapper.StatusTraceLogMapper;
import com.laputa.pdm.daemon.elastic.service.StatusTraceLogService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * 任务轨迹处理
 *
 * @author lishangbu
 * @date 2018/11/22
 */
@Service("statusTraceLogService")
@AllArgsConstructor
public class StatusTraceLogServiceImpl extends ServiceImpl<StatusTraceLogMapper, StatusTraceLog> implements StatusTraceLogService {

}
