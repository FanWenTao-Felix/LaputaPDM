package com.laputa.pdm.common.core.util;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * @author qiujuer Email:qiujuer@live.cn
 * @version 1.0.0
 */
public class ResponseUtil {
    // 成功
    public static final int SUCCEED = 1;
    // 未知错误
    public static final int ERROR_UNKNOWN = 0;

    // 没有找到用户信息
    public static final int ERROR_NOT_FOUND_USER = 4041;
    // 没有找到群信息
    public static final int ERROR_NOT_FOUND_GROUP = 4042;
    // 没有找到群成员信息
    public static final int ERROR_NOT_FOUND_GROUP_MEMBER = 4043;

    // 创建用户失败
    public static final int ERROR_CREATE_USER = 3001;
    // 创建群失败
    public static final int ERROR_CREATE_GROUP = 3002;
    // 创建群成员失败
    public static final int ERROR_CREATE_MESSAGE = 3003;

    // 请求参数错误
    public static final int ERROR_PARAMETERS = 4001;
    // 请求参数错误-已存在账户
    public static final int ERROR_PARAMETERS_EXIST_ACCOUNT = 4002;
    // 请求参数错误-已存在名称
    public static final int ERROR_PARAMETERS_EXIST_NAME = 4003;

    // 服务器错误
    public static final int ERROR_SERVICE = 5001;

    // 账户Token错误，需要重新登录
    public static final int ERROR_ACCOUNT_TOKEN = 2001;
    // 账户登录失败
    public static final int ERROR_ACCOUNT_LOGIN = 2002;
    // 账户注册失败
    public static final int ERROR_ACCOUNT_REGISTER = 2003;
    // 没有权限操作
    public static final int ERROR_ACCOUNT_NO_PERMISSION = 2010;



    public static <M> R<M> buildOk() {
        return new R<M>();
    }

    public static <M> R<M> buildOk(M result) {
        return new R<M>(result);
    }

    public static <M> R<M> buildParameterError() {
        return new R<M>(ERROR_PARAMETERS, "Parameters Error.");
    }

    public static <M> R<M> buildHaveAccountError() {
        return new R<M>(ERROR_PARAMETERS_EXIST_ACCOUNT, "Already have this account.");
    }

    public static <M> R<M> buildHaveNameError() {
        return new R<M>(ERROR_PARAMETERS_EXIST_NAME, "Already have this name.");
    }

    public static <M> R<M> buildServiceError() {
        return new R<M>(ERROR_SERVICE, "Service Error.");
    }

    public static <M> R<M> buildServiceError(String message) {
        return new R<M>(ERROR_SERVICE, message);
    }


    public static <M> R<M> buildNotFoundUserError(String str) {
        return new R<M>(ERROR_NOT_FOUND_USER, str != null ? str : "Not Found User.");
    }

    public static <M> R<M> buildNotFoundGroupError(String str) {
        return new R<M>(ERROR_NOT_FOUND_GROUP, str != null ? str : "Not Found Group.");
    }

    public static <M> R<M> buildNotFoundGroupMemberError(String str) {
        return new R<M>(ERROR_NOT_FOUND_GROUP_MEMBER, str != null ? str : "Not Found GroupMember.");
    }

    public static <M> R<M> buildAccountError() {
        return new R<M>(ERROR_ACCOUNT_TOKEN, "Account Error; you need login.");
    }

    public static <M> R<M> buildLoginError() {
        return new R<M>(ERROR_ACCOUNT_LOGIN, "Account or password error.");
    }

    public static <M> R<M> buildRegisterError() {
        return new R<M>(ERROR_ACCOUNT_REGISTER, "Have this account.");
    }

    public static <M> R<M> buildNoPermissionError() {
        return new R<M>(ERROR_ACCOUNT_NO_PERMISSION, "You do not have permission to operate.");
    }

    public static <M> R<M> buildCreateError(int type) {
        return new R<M>(type, "Create failed.");
    }

}
