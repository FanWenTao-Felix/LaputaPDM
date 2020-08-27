package com.laputa.pdm.message.api.dto;



import com.google.common.base.Strings;

import com.laputa.pdm.message.api.entity.MsgMessage;
import lombok.Data;
import lombok.ToString;

/**
 * API请求的Model格式
 *
 * @author Sommer 20200212
 * @version 1.0.0
 */
@ToString
@Data
public class MessageCreateModel {
    // ID从客户端生产，一个UUID

    private String id;

    private String content;

    private String attach;

    // 消息类型

    private int type = MsgMessage.TYPE_STR;

    // 接收者 可为空

    private Long receiverId;

    // 接收者类型，群，人

    private int receiverType = MsgMessage.RECEIVER_TYPE_NONE;




    public static boolean check(MessageCreateModel model) {
        return model != null
                && !( Strings.isNullOrEmpty(model.id)
                || Strings.isNullOrEmpty(model.content)
                || (model.receiverId==0))

                && (model.receiverType == MsgMessage.RECEIVER_TYPE_NONE
                || model.receiverType == MsgMessage.RECEIVER_TYPE_GROUP)

                && (model.type == MsgMessage.TYPE_STR
                || model.type == MsgMessage.TYPE_AUDIO
                || model.type == MsgMessage.TYPE_FILE
                || model.type == MsgMessage.TYPE_PIC);
    }



}
