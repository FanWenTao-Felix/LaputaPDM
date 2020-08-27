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

import { rule } from '@/util/validateRules'

export const tableOption = {
  tableProps: {
    border: false,
    stripe: true,
    defaultSort: {
      prop: 'id',
      order: 'descending'
    }
  },
  // 省略 ...
  column: [
    {
      label: '名称',
      search: true,
      prop: 'publicName',
      rules: [
        { max: 30, message: '长度在 30 个字符', trigger: 'blur' },
        { validator: rule.validatorNameCn, trigger: 'blur' }
      ]
    },
    {
      label: '键',
      prop: 'publicKey',
      rules: [
        { required: true, message: '请输入键', trigger: 'blur' },
        { validator: rule.validatorKey, trigger: 'blur' }
      ]

    },
    {
      label: '值',
      overHidden: true,
      prop: 'publicValue',
      rules: [
        { required: true, message: '请输入值', trigger: 'blur' }
      ]
    },
    {
      label: '编码',
      prop: 'validateCode'
    },
    {
      label: '作用',
      prop: 'system',
      type: 'select',
      dicUrl: '/admin/dict/type/dict_type',
      addDisplay: false,
      editDisplay: false,
      search: true
    },
    {
      label: '状态',
      prop: 'status',
      width: 80,
      type: 'select',
      dicUrl: '/admin/dict/type/status_type'
    },
    {
      label: '类型',
      prop: 'publicType',
      width: 80,
      type: 'select',
      dicUrl: '/admin/dict/type/param_type',
      rules: [{
        required: true,
        message: '请选择类型',
        trigger: 'blur'
      }]
    }
    // 省略 ...
  ]
}
