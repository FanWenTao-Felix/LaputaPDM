package com.laputa.pdm.message.api.entity;


import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@TableName("msg_mail")
@EqualsAndHashCode(callSuper = true)
@ApiModel(value = "")
public class MsgMail extends Model<MsgMail> {
    String sendMail;
    String receiveMail;
    String subject;
    String content;
    int type;
    String sendUsername;
    String receiveUsername;
    String fileName;
      String myEmailAccount = "962239776@qq.com";
      String myEmailPassword = "ntogbdqtuieybdje";

    // 网易163邮箱的 SMTP 服务器地址为: smtp.163.com
    //qq  smtp.qq.com
      String myEmailSMTPHost = "smtp.qq.com";
}
