package com.laputa.pdm.message.service;


import com.google.common.base.Strings;
import com.laputa.pdm.message.api.dto.GroupCreateModel;
import com.laputa.pdm.message.api.entity.MsgGroup;
import com.laputa.pdm.message.api.entity.MsgGroupMember;
import com.laputa.pdm.message.api.entity.MsgUser;

import com.laputa.pdm.message.mapper.MsgGroupMapper;
import com.laputa.pdm.message.mapper.MsgGroupMemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 * 群数据处理类
 *
 * @author Sommer 20200212
 * @version 1.0.0
 */
@Service
@Transactional
public class GroupService {


    @Autowired
    MsgGroupMapper groupRepository;

    @Autowired
    MsgGroupMemberMapper groupMemberRepository;



    /**
     *  // 通过Id拿群Model
     * @param groupId
     * @return
     */
    public MsgGroup findById(Long groupId) {
        return groupRepository.selectById(groupId);
    }



    /**
     *     // 查询一个群，同时这个人必须是群的成员
     * @param user
     * @param groupId
     * @return
     */
    public MsgGroup findById(MsgUser user, Long groupId) {
        MsgGroupMember member = getMember(user.getUserId(), groupId);
        if (member != null) {
            return member.getGroup();
        }
        return null;
    }



    /**
     *  // 通过名字查找群
     * @param name
     * @return
     */
    public MsgGroup findByName(String name) {
        return groupRepository.findGroupByNameEquals(name.toLowerCase());

    }



    /**
     *   // 获取一个群的所有成员
     * @param group
     * @return
     */
    public Set<MsgGroupMember> getMembers(MsgGroup group) {
        return groupMemberRepository.findGroupMembersByGroupId(group.getId());

    }

    // 获取一个人加入的所有群
    public Set<MsgGroupMember> getMembers(MsgUser user) {
        return groupMemberRepository.findGroupMembersByUserIdEquals(user.getUserId());

    }

    // 创建群
    public MsgGroup create(MsgUser creator, GroupCreateModel model, List<MsgUser> users) {
        MsgGroup group = new MsgGroup(creator, model);
     long id =    groupRepository.insert(group);
        group.setId(id);
        MsgGroupMember ownerMember = new MsgGroupMember(creator, group);
        // 设置超级权限，创建者
        ownerMember.setPermissionType(MsgGroupMember.PERMISSION_TYPE_ADMIN_SU);
        groupMemberRepository.insert(ownerMember);
        for (MsgUser user : users) {
            MsgGroupMember member = new MsgGroupMember(user, group);
            // 保存，并没有提交到数据库
            groupMemberRepository.insert(ownerMember);
        }
        return group;
    }

    // 获取一个群的成员
    public MsgGroupMember getMember(long userId, long groupId) {
        return  groupMemberRepository.findGroupMemberByUserIdEqualsAndGroupIdEquals(userId,groupId);

    }

    // 查询
    @SuppressWarnings("unchecked")
    public List<MsgGroup> search(String name) {
        if (Strings.isNullOrEmpty(name)) {
            name = ""; // 保证不能为null的情况，减少后面的一下判断和额外的错误
        }
        final String searchName = "%" + name + "%"; // 模糊匹配
        return   groupRepository.findGroupByNameLike(searchName);

    }

    // 给群添加成员
    public List<MsgGroupMember> addMembers(MsgGroup group, List<MsgUser> insertUsers) {
        List<MsgGroupMember> members = new ArrayList <>();

        for (MsgUser user : insertUsers) {
            MsgGroupMember member = new MsgGroupMember(user, group);
            // 保存，并没有提交到数据库

            members.add(member);
           long id =  groupMemberRepository.insert(member);
            member.setId(id);
        }

        return members;

    }
}
