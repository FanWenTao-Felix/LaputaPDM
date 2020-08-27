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
  border: true,
  index: true,
  indexLabel: '序号',
  stripe: true,
  menuAlign: 'center',
  menuWidth: 150,
  menuBtn: true,
  align: 'center',
  editBtn: false,
  delBtn: false,
  menuType: 'menu',
  searchShow: false,
  labelWidth: 120,
  column: [{
    fixed: true,
    label: '模型ID',
    prop: 'id',
    editDisabled: true,
    addDisplay: false
  }, {
    fixed: true,
    label: '模型标识',
    prop: 'key',
    editDisabled: true,
    rules: [{
      required: true,
      message: '请输入模型标识',
      trigger: 'blur'
    }]
  }, {
    label: '流程分类',
    prop: 'category',
    search: true,
    rules: [{
      required: true,
      message: '请输入流程分类',
      trigger: 'blur'
    }]
  }, {
    label: '模型名称',
    prop: 'name',
    rules: [{
      required: true,
      message: '请输入模型名称',
      trigger: 'blur'
    }]
  },
  {
    label: '版本号',
    prop: 'version',
    editDisabled: true,
    addDisplay: false
  }, {
    width: 80,
    label: '创建时间',
    prop: 'createTime',
    type: 'datetime',
    format: 'yyyy-MM-dd HH:mm',
    valueFormat: 'timestamp',
    editDisabled: true,
    addDisplay: false
  }, {
    width: 80,
    label: '最后更新时间',
    prop: 'lastUpdateTime',
    type: 'datetime',
    format: 'yyyy-MM-dd HH:mm',
    valueFormat: 'timestamp',
    editDisabled: true,
    addDisplay: false
  }]
}
