import { validatenull } from './validate'
import request from '@/plugin/axios'
import * as CryptoJS from 'crypto-js'

// 表单序列化
export const serialize = data => {
  const list = []
  Object.keys(data).forEach(ele => {
    list.push(`${ele}=${data[ele]}`)
  })
  return list.join('&')
}
export const getObjType = obj => {
  var toString = Object.prototype.toString
  var map = {
    '[object Boolean]': 'boolean',
    '[object Number]': 'number',
    '[object String]': 'string',
    '[object Function]': 'function',
    '[object Array]': 'array',
    '[object Date]': 'date',
    '[object RegExp]': 'regExp',
    '[object Undefined]': 'undefined',
    '[object Null]': 'null',
    '[object Object]': 'object'
  }
  if (obj instanceof Element) {
    return 'element'
  }
  return map[toString.call(obj)]
}
/**
 * 对象深拷贝
 */
export const deepClone = data => {
  var type = getObjType(data)
  var obj
  if (type === 'array') {
    obj = []
  } else if (type === 'object') {
    obj = {}
  } else {
    // 不再具有下一层次
    return data
  }
  if (type === 'array') {
    for (var i = 0, len = data.length; i < len; i++) {
      obj.push(deepClone(data[i]))
    }
  } else if (type === 'object') {
    for (var key in data) {
      obj[key] = deepClone(data[key])
    }
  }
  return obj
}
/**
 * 判断路由是否相等
 */
export const diff = (obj1, obj2) => {
  delete obj1.close
  var o1 = obj1 instanceof Object
  var o2 = obj2 instanceof Object
  if (!o1 || !o2) { /*  判断不是对象  */
    return obj1 === obj2
  }

  if (Object.keys(obj1).length !== Object.keys(obj2).length) {
    return false
    // Object.keys() 返回一个由对象的自身可枚举属性(key值)组成的数组,例如：数组返回下表：let arr = ["a", "b", "c"];console.log(Object.keys(arr))->0,1,2;
  }

  for (var attr in obj1) {
    var t1 = obj1[attr] instanceof Object
    var t2 = obj2[attr] instanceof Object
    if (t1 && t2) {
      return diff(obj1[attr], obj2[attr])
    } else if (obj1[attr] !== obj2[attr]) {
      return false
    }
  }
  return true
}
/**
 * 设置灰度模式
 */
export const toggleGrayMode = (status) => {
  if (status) {
    document.body.className = document.body.className + ' grayMode'
  } else {
    document.body.className = document.body.className.replace(' grayMode', '')
  }
}
/**
 * 设置主题
 */
export const setTheme = (name) => {
  document.body.className = name
}

/**
 *加密处理
 */
export const encryption = (params) => {
  let {
    data,
    type,
    param,
    key
  } = params
  const result = JSON.parse(JSON.stringify(data))
  if (type === 'Base64') {
    param.forEach(ele => {
      result[ele] = btoa(result[ele])
    })
  } else {
    param.forEach(ele => {
      var data = result[ele]
      key = CryptoJS.enc.Latin1.parse(key)
      var iv = key
      // 加密
      var encrypted = CryptoJS.AES.encrypt(
        data,
        key, {
          iv: iv,
          mode: CryptoJS.mode.CBC,
          padding: CryptoJS.pad.ZeroPadding
        })
      result[ele] = encrypted.toString()
    })
  }
  return result
}


/**
 * 浏览器判断是否全屏
 */
export const fullscreenToggel = () => {
  if (fullscreenEnable()) {
    exitFullScreen()
  } else {
    reqFullScreen()
  }
}
/**
 * esc监听全屏
 */
export const listenfullscreen = (callback) => {
  function listen () {
    callback()
  }

  document.addEventListener('fullscreenchange', function () {
    listen()
  })
  document.addEventListener('mozfullscreenchange', function () {
    listen()
  })
  document.addEventListener('webkitfullscreenchange', function () {
    listen()
  })
  document.addEventListener('msfullscreenchange', function () {
    listen()
  })
}
/**
 * 浏览器判断是否全屏
 */
export const fullscreenEnable = () => {
  return document.isFullScreen || document.mozIsFullScreen || document.webkitIsFullScreen
}

/**
 * 浏览器全屏
 */
export const reqFullScreen = () => {
  if (document.documentElement.requestFullScreen) {
    document.documentElement.requestFullScreen()
  } else if (document.documentElement.webkitRequestFullScreen) {
    document.documentElement.webkitRequestFullScreen()
  } else if (document.documentElement.mozRequestFullScreen) {
    document.documentElement.mozRequestFullScreen()
  }
}
/**
 * 浏览器退出全屏
 */
export const exitFullScreen = () => {
  if (document.documentElement.requestFullScreen) {
    document.exitFullScreen()
  } else if (document.documentElement.webkitRequestFullScreen) {
    document.webkitCancelFullScreen()
  } else if (document.documentElement.mozRequestFullScreen) {
    document.mozCancelFullScreen()
  }
}
/**
 * 递归寻找子类的父类
 */

export const findParent = (menu, id) => {
  for (let i = 0; i < menu.length; i++) {
    if (menu[i].children.length !== 0) {
      for (let j = 0; j < menu[i].children.length; j++) {
        if (menu[i].children[j].id === id) {
          return menu[i]
        } else {
          if (menu[i].children[j].children.length !== 0) {
            return findParent(menu[i].children[j].children, id)
          }
        }
      }
    }
  }
}

/**
 * 动态插入css
 */

export const loadStyle = url => {
  const link = document.createElement('link')
  link.type = 'text/css'
  link.rel = 'stylesheet'
  link.href = url
  const head = document.getElementsByTagName('head')[0]
  head.appendChild(link)
}
/**
 * 判断路由是否相等
 */
export const isObjectValueEqual = (a, b) => {
  let result = true
  Object.keys(a).forEach(ele => {
    const type = typeof (a[ele])
    if (type === 'string' && a[ele] !== b[ele]) result = false
    else if (type === 'object' && JSON.stringify(a[ele]) !== JSON.stringify(b[ele])) result = false
  })
  return result
}
/**
 * 根据字典的value显示label
 */
export const findByvalue = (dic, value) => {
  let result = ''
  if (validatenull(dic)) return value
  if (typeof (value) === 'string' || typeof (value) === 'number' || typeof (value) === 'boolean') {
    let index = 0
    index = findArray(dic, value)
    if (index !== -1) {
      result = dic[index].label
    } else {
      result = value
    }
  } else if (value instanceof Array) {
    result = []
    let index = 0
    value.forEach(ele => {
      index = findArray(dic, ele)
      if (index !== -1) {
        result.push(dic[index].label)
      } else {
        result.push(value)
      }
    })
    result = result.toString()
  }
  return result
}
/**
 * 根据字典的value查找对应的index
 */
export const findArray = (dic, value) => {
  for (let i = 0; i < dic.length; i++) {
    if (dic[i].value === value) {
      return i
    }
  }
  return -1
}
/**
 * 生成随机len位数字
 */
export const randomLenNum = (len, date) => {
  let random = ''
  random = Math.ceil(Math.random() * 100000000000000).toString().substr(0, len || 4)
  if (date) random = random + Date.now()
  return random
}
/**
 * 打开小窗口
 */
export const openWindow = (url, title, w, h) => {
  // Fixes dual-screen position                            Most browsers       Firefox
  const dualScreenLeft = window.screenLeft !== undefined ? window.screenLeft : screen.left
  const dualScreenTop = window.screenTop !== undefined ? window.screenTop : screen.top

  const width = window.innerWidth ? window.innerWidth : document.documentElement.clientWidth ? document.documentElement.clientWidth : screen.width
  const height = window.innerHeight ? window.innerHeight : document.documentElement.clientHeight ? document.documentElement.clientHeight : screen.height

  const left = ((width / 2) - (w / 2)) + dualScreenLeft
  const top = ((height / 2) - (h / 2)) + dualScreenTop
  const newWindow = window.open(url, title, 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=yes, copyhistory=no, width=' + w + ', height=' + h + ', top=' + top + ', left=' + left)

  // Puts focus on the newWindow
  if (window.focus) {
    newWindow.focus()
  }
}

/**
 *  <img> <a> src 处理
 * @returns {PromiseLike<T | never> | Promise<T | never>}
 */
export function handleImg (fileName, id) {
  return validatenull(fileName) ? null : request({
    url: '/admin/sys-file/' + fileName,
    method: 'get',
    responseType: 'blob'
  }).then((response) => { // 处理返回的文件流
    const blob = response.data
    const img = document.getElementById(id)
    img.src = URL.createObjectURL(blob)
    // console.info('img:' + JSON.stringify(img.src))
    window.setTimeout(function () {
      window.URL.revokeObjectURL(blob)
    }, 0)
  })
}



export function handleDown (filename, bucket, original) {
  return request({
    url: '/doc/doc-file/' + bucket + '/' + filename,
    method: 'get',
    responseType: 'blob'
  }).then((response) => { // 处理返回的文件流
    const blob = response.data
    const link = document.createElement('a')
    link.href = URL.createObjectURL(blob)
    // link.download = filename
    link.download = original
    document.body.appendChild(link)
    link.click()
    window.setTimeout(function () {
      URL.revokeObjectURL(blob)
      document.body.removeChild(link)
    }, 0)
  })
}

export function getQueryString (url, paraName) {
  const arrObj = url.split('?')
  if (arrObj.length > 1) {
    const arrPara = arrObj[1].split('&')
    let arr
    for (let i = 0; i < arrPara.length; i++) {
      arr = arrPara[i].split('=')
      // eslint-disable-next-line eqeqeq
      if (arr != null && arr[0] == paraName) {
        return arr[1]
      }
    }
    return ''
  } else {
    return ''
  }
}
/**
 * 将数组转化成树结构 array to tree
 * @param {*} array 数据源
 * @param {*} options 字段名配置项
 */
export function arrayToTree (
  array = [],
  options = { id: 'id', pid: 'pid', children: 'children' },
) {
  const array_ = [] // 创建储存剔除叶子节点后的骨架节点数组
  const unique = {} // 创建盒子辅助本轮children合并去重
  const root_pid = [
    0,
    '0',
    undefined,
    'undefined',
    null,
    'null',
    '00000000-0000-0000-0000-000000000000'
  ] // 可能存在的根节点pid形式
  array.forEach(item => {
    // 筛选可以插入当前节点的所有子节点
    const children_array = array.filter(
      it => it[options.pid] === item[options.id]
    )
    if (item[options.children] && item[options.children] instanceof Array && item[options.children].length > 0) {
      // 去重合并数组
      item[options.children].map(i => (unique[i[options.id]] = 1))
      item[options.children].push(
        ...children_array.filter(i => unique[i[options.id]] !== 1)
      )
    } else {
      item[options.children] = children_array
    }
    // 当children_array有数据时插入下一轮array_，当无数据时将最后留下来的根节点树形插入数组
    const has_children = children_array.length > 0
    if (
      has_children ||
      (!has_children && root_pid.includes(item[options.pid]))
    ) {
      array_.push(item)
    }
  })
  // 当数组内仅有根节点时退出，否组继续处理 最终递归深度次
  if (!array_.every(item => root_pid.includes(item[options.pid]))) {
    return arrayToTree(array_, options)
  } else {
    return array_
  }
}

/**
 * 防抖函数
 * @param {*} func 防抖后要执行的回调
 * @param {*} wait 等待时间
 * @param {*} immediate
 */
export function debounce (func, wait, immediate) {
  let timeout, args, context, timestamp, result

  const later = function () {
    // 据上一次触发时间间隔
    const last = +new Date() - timestamp

    // 上次被包装函数被调用时间间隔last小于设定时间间隔wait
    if (last < wait && last > 0) {
      timeout = setTimeout(later, wait - last)
    } else {
      timeout = null
      // 如果设定为immediate===true，因为开始边界已经调用过了此处无需调用
      if (!immediate) {
        result = func.apply(context, args)
        if (!timeout) context = args = null
      }
    }
  }

  return function (...args) {
    context = this
    timestamp = +new Date()
    const callNow = immediate && !timeout
    // 如果延时不存在，重新设定延时
    if (!timeout) timeout = setTimeout(later, wait)
    if (callNow) {
      result = func.apply(context, args)
      context = args = null
    }

    return result
  }
}
/**
 * 从坐标值拼接指定字段到祖先元素
 * @param {*} data 一维数据源
 * @param {*} coordinate 坐标值数据
 * @param {*} options 配置项
 */
export function splicParentsUntil (data, coordinate, options = {
  Splic: 'name', // 所要拼接字段
  Connector: '\\', // 连接符
  Id: 'id', // 数据源匹配字段
  Parents: 'parents',
  IdentityId: 'identityid'
}) {
  const coordinate_item = data.find(i => i[options.Id] === coordinate[options.Id])
  console.info('coordinate_item:' + JSON.stringify(coordinate_item))
  if (!coordinate_item) return ''
  console.info('options:' + JSON.stringify(options))
  if (!coordinate_item[options.Parents]) {

    return coordinate_item[options.Splic]
  }

  const _parents = coordinate_item[options.Parents]
    .substring(1, coordinate_item[options.Parents].length - 1)
    .split(',')
    .filter(i => !!i)
  let splic_parents = ''
  _parents.forEach(i => {
    const _parent = data.find(t => t[options.IdentityId] === i)
    if (_parent) {
      console.info('_parent:' + JSON.stringify(_parent))
    }

    if (_parent) {
      splic_parents += `${_parent[options.Splic]}${options.Connector}`
    }

  })
  return splic_parents + coordinate_item[options.Splic]
}

/**
 * 处理下载接口返回的文件流数据
 * @param {*} res http请求返回数据
 */
export function download (res) {
  // 错误处理
  if (res.data.type === 'application/json') {
    const reader = new FileReader()
    reader.readAsText(res.data, 'utf-8')
    reader.onload = function () {
      const json_data = JSON.parse(reader.result)
      Message({
        showClose: true,
        message: json_data.Message,
        type: 'error'
      })
    }
    return
  }
  // 下载处理
  const filename = 'content-disposition' in res.headers
    ? decodeURIComponent(
      res.headers['content-disposition']
        .split(';')[1]
        .split('=')[1]
        .replace(/"/g, '')
    ) : '下载文件'
  try {
    if (window.navigator.msSaveOrOpenBlob) {
      navigator.msSaveBlob(res.data, filename);
    } else {
      let blob = new Blob([res.data], {
        type: 'application/vnd.ms-excel'
      })
      let url = URL.createObjectURL(blob);
      let link = document.createElement('a');
      link.setAttribute('href', url);
      link.setAttribute('download', filename);
      link.style.display = 'none';
      document.body.appendChild(link);
      link.click();
      URL.revokeObjectURL(url); // 释放URL 对象
      document.body.removeChild(link);
    }
  } catch (err) {
    // console.log(err)
  }
}
