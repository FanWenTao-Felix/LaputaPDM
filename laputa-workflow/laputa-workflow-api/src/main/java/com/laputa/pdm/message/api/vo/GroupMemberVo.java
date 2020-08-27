package com.laputa.pdm.message.api.vo;


import com.fasterxml.jackson.annotation.JsonFormat;
import com.laputa.pdm.message.api.entity.MsgGroupMember;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 群成员Model
 * @author qiujuer Email:qiujuer.live.cn
 */
@Data
public class GroupMemberVo {

    private Long id;// Id

    private String alias;// 别名／备注

    private boolean isAdmin;// 是否是管理员

    private boolean isOwner;// 是否是创建者

    private Integer userId;// 对于的用户Id

    private Long groupId;// 对于的群Id

    @JsonFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss",timezone = "GMT+8")
    private LocalDateTime modifyAt;// 最后修改时间

    public GroupMemberVo(MsgGroupMember member) {
        this.id = member.getId();
        this.alias = member.getAlias();
        this.isAdmin = member.getPermissionType() == MsgGroupMember.PERMISSION_TYPE_ADMIN;
        this.isOwner = member.getPermissionType() == MsgGroupMember.PERMISSION_TYPE_ADMIN_SU;
        this.userId = member.getUser().getUserId();
        this.groupId = member.getGroup().getId();
        this.modifyAt = member.getUpdateTime();
    }


}
