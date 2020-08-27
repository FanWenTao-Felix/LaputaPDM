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

// 得到所有数据
export function getAll () {
  return request({
    url: './data/mail-inbox.json'
  })
}
export function mailSendAPI () {
  return request({
    url: './data/mail-inbox.json'
  })
}

export function sendMail (mailDTO) {
 
}

export function saveAsDraft (mailDTO) {
 
}

export function delMail (id) {
  return request({
    url: './data/mail-inbox.json'
  })
}
export function fetchDetail (query) {
  return request({
    url: './data/mail-detail.json'
  })
}


export function fetchUnReadList (query) {
  return request({
    url: './data/mail-inbox.json'
  })
}

export function fetchList (query) {
  return request({
    url: './data/mail-inbox.json'
  })
}
