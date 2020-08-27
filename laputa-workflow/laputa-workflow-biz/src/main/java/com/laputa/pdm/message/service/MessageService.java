package com.laputa.pdm.message.service;


import com.laputa.pdm.message.api.dto.MessageCreateModel;
import com.laputa.pdm.message.api.entity.MsgGroup;
import com.laputa.pdm.message.api.entity.MsgMessage;
import com.laputa.pdm.message.api.entity.MsgUser;

import com.laputa.pdm.message.mapper.MsgMessageMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;


/**
 * 消息数据存储的类
 *
 * @author Sommer 20200212
 * @version 1.0.0
 */
@Service
@Transactional
public class MessageService {


    @Resource
    MsgMessageMapper msgMessageMapper;

    // 查询某一个消息
    public MsgMessage findById(String id) {
       return msgMessageMapper.selectById(id);

    }

    // 添加一条普通消息
    public MsgMessage add(MsgUser sender, MsgUser receiver, MessageCreateModel model) {
        MsgMessage message = new MsgMessage(sender, receiver, model);
        return save(message);
    }

    // 添加一条群消息
    public MsgMessage add(MsgUser sender, MsgGroup group, MessageCreateModel model) {
        MsgMessage message = new MsgMessage(sender, group, model);
        return save(message);
    }

    private  MsgMessage save(MsgMessage message) {
        int id = msgMessageMapper.insert(message);
        return msgMessageMapper.selectById(id);
    }

}
