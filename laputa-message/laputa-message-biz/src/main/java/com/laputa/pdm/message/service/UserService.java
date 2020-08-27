package com.laputa.pdm.message.service;


import com.google.common.base.Strings;
import com.laputa.pdm.message.api.entity.MsgUser;
import com.laputa.pdm.message.api.entity.MsgUserContacts;
import com.laputa.pdm.message.mapper.MsgUserContactsMapper;
import com.laputa.pdm.message.mapper.MsgUserMapper;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import org.springframework.web.multipart.MultipartFile;


import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
@Slf4j

public class UserService {

	@Autowired
	MsgUserMapper userDao;

	@Autowired
	MsgUserContactsMapper userContactsMapper;

	/**
	 * 给当前的账户绑定PushId
	 *
	 * @param user   自己的User
	 * @param pushId 自己设备的PushId
	 * @return MsgUser
	 */
	@Transactional
	public  MsgUser bindPushId(MsgUser user, String pushId) {
		if (Strings.isNullOrEmpty(pushId)) {
			return null;
		}

		// 第一步，查询是否有其他账户绑定了这个设备
		// 取消绑定，避免推送混乱
		// 查询的列表不能包括自己
		List <MsgUser> userList = userDao.findUsersByPushIdEqualsAndUserIdEquals(pushId.toLowerCase(),user.getUserId());

		for (MsgUser u : userList) {
			// 更新为null
			u.setPushId(null);
			userDao.insert(u);
		}


		if (pushId.equalsIgnoreCase(user.getPushId())) {
			// 如果当前需要绑定的设备Id，之前已经绑定过了
			// 那么不需要额外绑定
			return user;
		} else {

			// 更新新的设备Id
			user.setPushId(pushId);
		int id = 	userDao.insert(user);
			return userDao.selectById(id);
		}
	}




	// 通过Token字段查询用户信息
	// 只能自己使用，查询的信息是个人信息，非他人信息
	public  MsgUser findByToken(String token) {
		return userDao.findUserByTokenEquals(token);

	}


	// 通过Name找到User
	public  MsgUser findByName(String name) {
		return userDao.findUserByUserNameEquals(name);
	}

	// 通过id找到User
	public  MsgUser findById(Long id) {
		// 通过Id查询，更方便
		return userDao.selectById(id);

	}

	/**
	 * 更新用户信息到数据库
	 *
	 * @param user MsgUser
	 * @return MsgUser
	 */
	public  MsgUser update(MsgUser user) {
		userDao.insert(user);
		return user;
	}


	/**
	 * 获取我的联系人的列表
	 *
	 * @param self MsgUser
	 * @return List<MsgUser>
	 */
	public  List<MsgUser> contacts(MsgUser self) {
		List<MsgUserContacts> flows  =    userDao.findUserFollowsByOriginIdEquals(self.getUserId());
		// 使用简写方式
		return flows.stream()
				.map(MsgUserContacts::getTarget)
				.collect(Collectors.toList());

	}

	/**
	 * 关注人的操作
	 *
	 * @param origin 发起者
	 * @param target 被关注的人
	 * @param alias  备注名
	 * @return 被关注的人的信息
	 */
	public  MsgUser follow(final MsgUser origin, final MsgUser target, final String alias) {
		MsgUserContacts follow = getUserFollow(origin, target);
		if (follow != null) {
			// 已关注，直接返回
			return follow.getTarget();
		}
		// 我关注人的时候，同时他也关注我，
		// 所有需要添加两条UserFollow数据
		MsgUserContacts originFollow = new MsgUserContacts();
		originFollow.setOrigin(origin);
		originFollow.setTarget(target);
		// 备注是我对他的备注，他对我默认没有备注
		originFollow.setAlias(alias);

		// 发起者是他，我是被关注的人的记录
		MsgUserContacts targetFollow = new MsgUserContacts();
		targetFollow.setOrigin(target);
		targetFollow.setTarget(origin);

		userContactsMapper.insert(originFollow);
		userContactsMapper.insert(targetFollow);
		return  target;

	}


	/**
	 * 查询两个人是否已经关注
	 *
	 * @param origin 发起者
	 * @param target 被关注人
	 * @return 返回中间类UserFollow
	 */
	public  MsgUserContacts getUserFollow(final MsgUser origin, final MsgUser target) {
		MsgUserContacts userFollow = userContactsMapper.findUserFollowByOriginIdEqualsAndTargetIdEquals(origin.getUserId(), target.getUserId());
		return userFollow;
	}

	/**
	 * 搜索联系人的实现
	 *
	 * @param name 查询的name，允许为空
	 * @return 查询到的用户集合，如果name为空，则返回最近的用户
	 */
	@SuppressWarnings("unchecked")
	public  List<MsgUser> search(String name) {
		// 保证不能为null的情况，减少后面的一下判断和额外的错误
		if (Strings.isNullOrEmpty(name)) {
			name = "";
		}
		final String searchName = "%" + name + "%"; // 模糊匹配
		List<MsgUser> users = userDao.findUsersByNameLikeLimes(searchName);
		return users;
	}
}
