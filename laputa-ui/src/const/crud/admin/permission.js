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

  index: true,
  indexLabel: '序号',
  tableProps: {
    border: false,
    stripe: true,
    sortable: false,
    defaultSort: {
      prop: 'roleId',
      order: 'ascending'
    }
  },
  column: [{
    label: '资源名',
    prop: 'roleName',
    width: 120,
    span: 24,
    align: 'center'
  }]
}
