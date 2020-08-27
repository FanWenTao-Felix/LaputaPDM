package com.laputa.pdm.message.api.vo;



import com.fasterxml.jackson.annotation.JsonFormat;
import com.laputa.pdm.message.api.entity.MsgUser;
import lombok.Data;

import java.time.LocalDateTime;
import java.time.ZoneId;

/**
 * @author qiujuer Email:qiujuer@live.cn
 * @version 1.0.0
 */
@Data
public class UserVo {

    private Integer id;

    private String name;

    private String phone;

    private String portrait;

    private String desc;

    private String sex;

    // 用户关注人的数量

    private int follows;

    // 用户粉丝的数量

    private int following;

    // 我与当前User的关系状态，是否已经关注了这个人

    private boolean isFollow;

    // 用户信息最后的更新时间
    @JsonFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss",timezone = "GMT+8")
    private LocalDateTime modifyAt;

    public UserVo(final MsgUser user) {
        this(user, false);
    }

    public UserVo(final MsgUser user, boolean isFollow) {
        this.isFollow = isFollow;

        this.id = user.getUserId();
        this.name = user.getUsername();
        this.phone = user.getPhone();
        this.portrait = user.getAvatar();
        this.desc = user.getAccount();
        ZoneId zoneId = ZoneId.systemDefault();

        this.modifyAt = user.getUpdateTime();

    }



}
