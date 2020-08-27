package com.laputa.pdm.message.api.dto;

import com.google.common.base.Strings;

import java.util.HashSet;
import java.util.Set;

/**
 * 群添加的Model
 *
 * @author Sommer 20200212
 * @version 1.0.0
 */
public class GroupCreateModel {

    private String name;

    private String desc;

    private String picture;

    private Set<String> users = new HashSet<>();

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public Set<String> getUsers() {
        return users;
    }

    public void setUsers(Set<String> users) {
        this.users = users;
    }

    public static boolean check(GroupCreateModel model) {
        return !(Strings.isNullOrEmpty(model.name)
                || Strings.isNullOrEmpty(model.desc)
                || Strings.isNullOrEmpty(model.picture)
                || model.users == null
                || model.users.size() == 0);
    }
}
