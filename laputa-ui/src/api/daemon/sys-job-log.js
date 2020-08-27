import request from '@/plugin/axios'

export function fetchList(query) {
  return request({
    url: '/job/sys-job-log/page',
    method: 'get',
    params: query
  })
}

