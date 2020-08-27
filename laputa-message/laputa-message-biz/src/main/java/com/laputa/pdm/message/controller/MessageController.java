package com.laputa.pdm.message.controller;

import com.laputa.pdm.common.core.util.R;
import com.laputa.pdm.common.core.util.ResponseUtil;
import com.laputa.pdm.message.api.entity.MsgGroup;
import com.laputa.pdm.message.api.entity.MsgMessage;
import com.laputa.pdm.message.api.entity.MsgUser;
import com.laputa.pdm.message.api.vo.MessageVo;
import com.laputa.pdm.message.api.dto.MessageCreateModel;
import com.laputa.pdm.message.service.GroupService;
import com.laputa.pdm.message.service.MessageService;
import com.laputa.pdm.message.service.PushService;
import com.laputa.pdm.message.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


/**
 * 消息发送的入口
 *
 * @author Sommer 20200212
 * @version 1.0.0
 */
@RestController
@Slf4j
@RequestMapping("/api/msg")
public class MessageController {


    @Autowired
    MessageService messageService;


    @Autowired
    UserService userService;


    @Autowired
    PushService pushService;

    @Autowired
    GroupService groupService;


    /**
     * // 发送一条消息到服务器
     *
     * @param token
     * @param model
     * @return
     */
    @PostMapping
    public R<MessageVo> pushMessage(@RequestHeader("token") String token, @RequestBody MessageCreateModel model) {
        log.info("MessageCreateModel:{}", model);
        if (!MessageCreateModel.check(model)) {
            return ResponseUtil.buildParameterError();
        }

        MsgUser self = userService.findByToken(token);

        // 查询是否已经在数据库中有了
        MsgMessage message = messageService.findById(model.getId());
        if (message != null) {
            // 正常返回

            return ResponseUtil.buildOk(new MessageVo(message));
        }

        if (model.getReceiverType() == MsgMessage.RECEIVER_TYPE_GROUP) {
            return pushToGroup(self, model);
        } else {
            return pushToUser(self, model);
        }
    }

    // 发送到人
    private R<MessageVo> pushToUser(MsgUser sender, MessageCreateModel model) {
        MsgUser receiver = userService.findById(model.getReceiverId());
        if (receiver == null) {
            // 没有找到接收者
            return ResponseUtil.buildNotFoundUserError("Con't find receiver user");
        }

        if (receiver.getUserId().equals(sender.getUserId())) {
            // 发送者接收者是同一个人就返回创建消息失败
            return ResponseUtil.buildCreateError(ResponseUtil.ERROR_CREATE_MESSAGE);
        }

        // 存储数据库
        MsgMessage message = messageService.add(sender, receiver, model);

        return buildAndPushResponse(sender, message);
    }

    // 发送到群
    private R<MessageVo> pushToGroup(MsgUser sender, MessageCreateModel model) {
        // 找群是有权限性质的找
        MsgGroup group = groupService.findById(sender, model.getReceiverId());
        if (group == null) {
            // 没有找到接收者群，有可能是你不是群的成员
            return ResponseUtil.buildNotFoundUserError("Con't find receiver group");
        }

        // 添加到数据库
        MsgMessage message = messageService.add(sender, group, model);

        // 走通用的推送逻辑
        return buildAndPushResponse(sender, message);
    }

    // 推送并构建一个返回信息
    private R<MessageVo> buildAndPushResponse(MsgUser sender, MsgMessage message) {
        if (message == null) {
            // 存储数据库失败
            return ResponseUtil.buildCreateError(ResponseUtil.ERROR_CREATE_MESSAGE);
        }


        // 进行推送
        pushService.pushNewMessage(sender, message);

        // 返回
        return ResponseUtil.buildOk(new MessageVo(message));
    }
}
