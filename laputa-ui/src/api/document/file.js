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

import request from '@/plugin/axios'

export function fetchList (query) {
  return request({
    url: '/doc/doc-file/page',
    method: 'get',
    params: query
  })
}


export function addObj (obj) {
  return request({
    url: '/doc/doc-file',
    method: 'post',
    data: obj
  })
}


export function getAllFoldersApi (data) {
  return request({
    url: './data/folder-list.json',
    data
  })
}

export function getHisFileListApi (data) {
  return request({
    url: './data/file-list-his.json',
    data
  })
}


export function getFileListApi (data) {
  return request({
    url: './data/file-list.json',
    data
  })
}



export function getObj (id) {
  return request({
    url: '/doc/doc-file/' + id,
    method: 'get'
  })
}

