/*
 *    Copyright (c) 2018-2025, sommer All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * Redistributions of source code must retain the above copyright notice,
 * this list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright
 * notice, this list of conditions and the following disclaimer in the
 * documentation and/or other materials provided with the distribution.
 * Neither the name of the laputapdm.com developer nor the names of its
 * contributors may be used to endorse or promote products derived from
 * this software without specific prior written permission.
 * Author: sommer (sommer_jiang@163.com)
 */

export const tableOption = {
  selection: true,
  border: true,
  index: true,
  stripe: true,
  menuAlign: 'center',
  align: 'center',
  addBtn: false,
  editBtn: false,
  delBtn: false,
  options: {
    border: true,
    stripe: true
  },
  rowHandle: {
    columnHeader: '操作',
    edit: {
      icon: 'el-icon-edit',
      type: 'primary',
      text: '编辑',
      size: 'mini'
    },
    custom: [
      {
        text: '删除',
        type: 'danger',
        size: 'mini',
        icon: 'el-icon-delete',
        emit: 'rowDel'
      }
    ]
  },
  column: [{
    title: 'ID',
    key: 'id',
    width: 40,
    align: 'center'
  }, {
    title: '表名称',
    key: 'name',
    width: 180,
    align: 'center'
  }, {
    title: '链接',
    key: 'url',
    showOverflowTooltip: true,
    align: 'center'
  }, {
    title: '用户名',
    key: 'username',
    width: 100,
    align: 'center'
  }, {
    title: '密码',
    key: 'password',
    showOverflowTooltip: true,
    width: 180,
    align: 'center'
  }, {
    title: '创建时间',
    width: 120,
    showOverflowTooltip: true,
    key: 'createDate',
    align: 'center'
  }]
}

export const formOption = {
  labelWidth: '120px',
  labelPosition: 'left',
  saveLoading: false
}

export const formBatchOption = {
  submitText: '生成',
  column: [
    {
      title: '表名称',
      value: 'tableName',
      disabled: true,
      minRows: 2,
      type: 'textarea',
      row: true,
      span: 24
    },
    {
      title: '包名',
      value: 'packageName',
      placeholder: '可为空，加载系统默认配置'
    }, {
      title: '作者',
      value: 'author',
      placeholder: '可为空，加载系统默认配置'
    }, {
      title: '模块',
      value: 'moduleName',
      placeholder: '可为空，加载系统默认配置'
    }, {
      title: '注释',
      value: 'comments',
      placeholder: '可为空，加载表备注'
    }
  ]
}

export const tableDsOption = {
  editTemplate: {
    id: {
      title: '主键',
      value: ''
    },
    name: {
      title: '名称',
      value: ''
    },
    url: {
      title: '数据库链接',
      value: ''
    },
    username: {
      title: '用户名',
      value: ''
    },
    password: {
      title: '密码',
      value: ''
    },
    createDate: {
      title: '创建时间',
      value: ''
    },
    updateDate: {
      title: '更新时间',
      value: ''
    }
  },
  addTemplate: {

    name: {
      title: '名称',
      value: ''
    },
    url: {
      title: '数据库链接',
      value: 'jdbc:mysql://laputa-mysql:3306/?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8'
    },
    username: {
      title: '用户名',
      value: ''
    },
    password: {
      title: '密码',
      value: ''
    }
  },
  addRules: {

    name: [{ required: true, message: '请输入姓名', trigger: 'blur' },
      { max: 32, message: '长度在 32 个字符', trigger: 'blur' }],
    url: [{ required: true, message: '请输入jdbcUrl', trigger: 'blur' },
      { max: 256, message: '长度在 256 个字符内', trigger: 'blur' }],
    password: [{ required: true, message: '请输入密码', trigger: 'blur' },
      { max: 32, message: '长度在 32 个字符', trigger: 'blur' }],
    username: [{ required: true, message: '请输入用户名', trigger: 'blur' },
      { max: 32, message: '长度在 32 个字符', trigger: 'blur' }]
  },
  column: [
    {
      title: '主键',
      prop: 'id',
      hide: true,
      addDisplay: false,
      editDisplay: false
    },
    {
      title: '名称',
      prop: 'name',
      rules: [
        { required: true, message: '请输入名称', trigger: 'blur' },
        { max: 32, message: '长度在 32 个字符', trigger: 'blur' }
      ]
    },
    {
      title: 'jdbcUrl',
      prop: 'url',
      type: 'textarea',
      span: 24,
      row: true,
      minRows: 2,
      overHidden: true,
      rules: [
        { required: true, message: '请输入jdbcUrl', trigger: 'blur' },
        { max: 256, message: '长度在 256 个字符内', trigger: 'blur' }
      ]
    },
    {
      title: '用户名',
      prop: 'username',
      rules: [
        { required: true, message: '请输入用户名', trigger: 'blur' },
        { max: 32, message: '长度在 32 个字符', trigger: 'blur' }
      ]
    },
    {
      title: '密码',
      prop: 'password',
      rules: [
        { required: true, message: '请输入密码', trigger: 'blur' },
        { max: 32, message: '长度在 32 个字符', trigger: 'blur' }
      ]
    },
    {
      title: '创建时间',
      prop: 'createDate',
      addDisplay: false,
      editDisplay: false,
      overHidden: true
    },
    {
      title: '更新时间',
      prop: 'updateDate',
      overHidden: true,
      addDisplay: false,
      editDisplay: false
    }
  ]
}
