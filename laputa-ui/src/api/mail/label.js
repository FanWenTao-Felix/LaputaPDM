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
import { Observable } from 'rxjs/Observable'

// 得到所有数据
export function getAll () {
  return request({
    url: './data/mail-inbox.json'
  })
}

export function fetchList () {
  return fetch({
    url: '/mail_label/list',
    method: 'get'
  })
}

export function add (labelDTO) {
  return Observable.create(observer => {
    setTimeout(observer.next(), 100)
  })
}

export function edit (labelDTO) {
  return Observable.create(observer => {
    setTimeout(observer.next(), 100)
  })
}

export function del (id) {
  return Observable.create(observer => {
    setTimeout(observer.next(), 20)
  })
}

export function toggleStar (idArr) {
  return Observable.create(observer => {
    setTimeout(observer.next(), 20)
  })
}

export function markLabel (idArr) {
  return Observable.create(observer => {
    setTimeout(observer.next(), 20)
  })
}
