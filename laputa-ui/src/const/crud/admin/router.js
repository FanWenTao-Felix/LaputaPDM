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
  align: 'center',
  viewBtn: true,
  addBtn: false,
  editBtn: false,
  tableProps: {
    border: true,
    stripe: true,
    defaultSort: {
      prop: 'id',
      order: 'ascending'
    }
  },
  column: [{
    label: '路由ID',
    prop: 'routeId',
    align: 'center'
  }, {
    label: '路由名',
    prop: 'routeName',
    align: 'center'
  }, {
    label: '断言',
    prop: 'predicates',
    align: 'center',
    'overHidden': true
  }, {
    label: '过滤器',
    prop: 'filters',
    align: 'center',
    'overHidden': true
  }, {
    label: '路径',
    prop: 'uri',
    align: 'center'
  }, {
    label: '创建时间',
    prop: 'createTime',
    align: 'center'
  }]
}
