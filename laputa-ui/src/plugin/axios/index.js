import store from '@/store'
import axios from 'axios'
import errorCode from '@/const/errorCode'
import router from '@/router/index'
import { serialize } from '@/util/util'
import { getStore } from '@/util/store'
import NProgress from 'nprogress' // progress bar
import { Message } from 'element-ui'
import util from '@/libs/util'

// 创建一个错误
function errorCreate (msg) {
  const error = new Error(msg)
  errorLog(error)
  throw error
}

// 记录和显示错误
function errorLog (error) {
  // 添加到日志
  store.dispatch('d2admin/log/push', {
    message: '数据请求异常',
    type: 'danger',
    meta: {
      error
    }
  })
  // 打印到控制台
  if (process.env.NODE_ENV === 'development') {
    util.log.danger('>>>>>> Error >>>>>>')
    console.log(error)
  }
  // 显示提示
  Message({
    message: error.message,
    type: 'error',
    duration: 5 * 1000
  })
}

// 创建一个 axios 实例
const service = axios.create({
  baseURL: process.env.VUE_APP_API,
  timeout: 5000 // 请求超时时间
})

// 请求拦截器
service.interceptors.request.use(
  config => {
    NProgress.start() // start progress bar
    const TENANT_ID = getStore({ name: 'tenantId' })
    const isToken = (config.headers || {}).isToken === false
    const token = store.getters.access_token
    if (token && !isToken) {
      config.headers['Authorization'] = 'Bearer ' + token// token
    }
    if (TENANT_ID) {
      config.headers['TENANT-ID'] = TENANT_ID // 租户ID
    }

    // headers中配置serialize为true开启序列化
    if (config.method === 'post' && config.headers.serialize) {
      config.data = serialize(config.data)
      delete config.data.serialize
    }
    return config
  }, error => {
    return Promise.reject(error)
  })

// 响应拦截器
service.interceptors.response.use(
  res => {
    NProgress.done()
    const status = Number(res.status) || 200
    const message = res.data.msg || errorCode[status] || errorCode['default']
    if (status === 401) {
      Message({
        message: message,
        type: 'error'
      })
      store.dispatch('FedLogOut').then(() => {
        router.push({ path: '/login' })
      })
      return
    }

    if (status !== 200 || res.data.code === 1) {
      Message({
        message: message,
        type: 'error'
      })
      return Promise.reject(new Error(message))
    }

    return res
  }, error => {
    NProgress.done()
    return Promise.reject(new Error(error))
  })

export default service
