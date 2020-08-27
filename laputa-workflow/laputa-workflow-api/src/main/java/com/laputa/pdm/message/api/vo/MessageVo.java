package com.laputa.pdm.message.api.vo;



import com.alibaba.fastjson.annotation.JSONField;
import com.laputa.pdm.message.api.entity.MsgMessage;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 消息的卡片Model
 *
 * @author Sommer 20200212
 * @version 1.0.0
 */
@Data
public class MessageVo {

    private String id; // Id

    private String content;// 内容

    private String attach;// 附件，附属信息

    private int type;// 消息类型
    @JSONField(format = "yyyy-MM-dd'T'hh:mm:ss")
    private LocalDateTime createAt;// 创建时间

    private long groupId;// 如果是群信息，对应群Id

    private long senderId;// 发送者Id，不为空

    private long receiverId;// 接收者Id

    public MessageVo(MsgMessage message) {
        this.id = message.getId();
        this.content = message.getContent();
        this.type = message.getType();
        this.attach = message.getAttach();
        this.createAt = message.getCreateTime();
        this.groupId = message.getGroupId();
        this.senderId = message.getSenderId();
        this.receiverId = message.getReceiverId();
    }


}
