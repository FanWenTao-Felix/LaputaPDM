import { getStore, setStore } from '@/util/store'
import { validatenull } from '@/util/validate'
import { getUserInfo, loginByMobile, loginBySocial, loginByUsername, logout, refreshToken } from '@/api/login'
import { encryption } from '@/util/util'
import webiste from '@/const/website'
import { GetMenu } from '@/api/admin/menu'
import { GetFile } from '@/api/admin/sys-file'

// import request from '@/plugin/axios'

function menuRegular (ele, menu) {
  const constmenu = webiste.menu
  const propsConfig = constmenu.props

  const propsDefault = {
    label: propsConfig.label || 'name',
    path: propsConfig.path || 'path',
    icon: propsConfig.icon || 'icon',
    fontIcon: propsConfig.fontIcon || 'fontIcon',
    title: 'title',
    children: propsConfig.children || 'children'
  }
  // console.info('addpath ele:', JSON.stringify(ele))
  const icon = ele[propsDefault.icon]
  menu[propsDefault.icon] = validatenull(icon) ? constmenu.iconDefault : icon
  const fontIcon = ele[propsDefault.fontIcon]
  menu[propsDefault.fontIcon] = validatenull(fontIcon) ? constmenu.fontIconDefault : fontIcon

  menu[propsDefault.title] = ele[propsDefault.label]
  const isChild = ele[propsDefault.children] && ele[propsDefault.children].length !== 0

  if (!isChild) {
    menu[propsDefault.path] = ele[propsDefault.path]
  } else {
    menu[propsDefault.path] = ele[propsDefault.path]
    menu[propsDefault.children] = []
    // menu[propsDefault.children].splice(0, menu[propsDefault.children].length)
    ele[propsDefault.children].forEach(child => {
      const newChild = {}

      menuRegular(child, newChild)
      menu.children.push(newChild)
    })

  }
  // console.info('menuRegular menu:', JSON.stringify(menu))
  // menus.push(menu)
}

const user = {
  state: {
    avatarUrl: '',
    userInfo: {},
    permissions: {},
    roles: [],
    menu: getStore({
      name: 'menu'
    }) || [],
    menuAll: [],
    expires_in: getStore({
      name: 'expires_in'
    }) || '',
    access_token: getStore({
      name: 'access_token'
    }) || '',
    refresh_token: getStore({
      name: 'refresh_token'
    }) || ''
  },
  actions: {
    // 根据用户名登录
    LoginByUsername ({ commit }, userInfo) {
      const user = encryption({
        data: userInfo,
        key: 'laputapdmslaputa',
        param: ['password']
      })
      return new Promise((resolve, reject) => {
        loginByUsername(user.username, user.password, user.code, user.randomStr).then(response => {
          const data = response.data
          console.info('data:', response)
          commit('SET_ACCESS_TOKEN', data.access_token)
          commit('SET_REFRESH_TOKEN', data.refresh_token)
          commit('SET_EXPIRES_IN', data.expires_in)
          commit('CLEAR_LOCK')
          resolve()
        }).catch(error => {
          reject(error)
        })
      })
    },
    // 根据手机号登录
    LoginByPhone ({ commit }, userInfo) {
      return new Promise((resolve, reject) => {
        loginByMobile(userInfo.mobile, userInfo.code).then(response => {
          const data = response.data
          commit('SET_ACCESS_TOKEN', data.access_token)
          commit('SET_REFRESH_TOKEN', data.refresh_token)
          commit('SET_EXPIRES_IN', data.expires_in)
          commit('CLEAR_LOCK')
          resolve()
        }).catch(error => {
          reject(error)
        })
      })
    },
    // 根据OpenId登录
    LoginBySocial ({ commit }, param) {
      return new Promise((resolve, reject) => {
        loginBySocial(param.state, param.code).then(response => {
          const data = response.data
          commit('SET_ACCESS_TOKEN', data.access_token)
          commit('SET_REFRESH_TOKEN', data.refresh_token)
          commit('SET_EXPIRES_IN', data.expires_in)
          commit('CLEAR_LOCK')
          resolve()
        }).catch(error => {
          reject(error)
        })
      })
    },
    GetUserInfo ({ commit }) {
      return new Promise((resolve, reject) => {
        getUserInfo().then((res) => {
          const data = res.data.data || {}
          commit('SET_USER_INFO', data.sysUser)
          commit('SET_ROLES', data.roles || [])
          commit('SET_PERMISSIONS', data.permissions || [])
          resolve(data)
          // request({
          //   url: '/admin/sys-file/' + data.sysUser.avatar,
          //   method: 'get',
          //   responseType: 'blob'
          // }).then((response) => { // 处理返回的文件流
          //   const blob = response.data
          //
          //   data.sysUser.avatar = URL.createObjectURL(blob)
          //   // console.info('img:' + JSON.stringify(img.src))
          //   window.setTimeout(function () {
          //     window.URL.revokeObjectURL(blob)
          //   }, 0)
          // })
        }).catch((error) => {
          reject(error)
        })
      })
    },
    // 刷新token
    RefreshToken ({ commit, state }) {
      return new Promise((resolve, reject) => {
        refreshToken(state.refresh_token).then(response => {
          const data = response.data
          commit('SET_ACCESS_TOKEN', data.access_token)
          commit('SET_REFRESH_TOKEN', data.refresh_token)
          commit('SET_EXPIRES_IN', data.expires_in)
          commit('CLEAR_LOCK')
          resolve()
        }).catch(error => {
          reject(error)
        })
      })
    },
    // 登出
    LogOut ({ commit }) {
      return new Promise((resolve, reject) => {
        logout().then(() => {
          commit('SET_MENU', [])
          commit('SET_PERMISSIONS', [])
          commit('SET_USER_INFO', {})
          commit('SET_ACCESS_TOKEN', '')
          commit('SET_REFRESH_TOKEN', '')
          commit('SET_EXPIRES_IN', '')
          commit('SET_ROLES', [])
          commit('DEL_ALL_TAG')
          commit('CLEAR_LOCK')
          resolve()
        }).catch(error => {
          reject(error)
        })
      })
    },
    // 注销session
    FedLogOut ({ commit }) {
      return new Promise(resolve => {
        commit('SET_MENU', [])
        commit('SET_PERMISSIONS', [])
        commit('SET_USER_INFO', {})
        commit('SET_ACCESS_TOKEN', '')
        commit('SET_REFRESH_TOKEN', '')
        commit('SET_ROLES', [])
        commit('DEL_ALL_TAG')
        commit('CLEAR_LOCK')
        resolve()
      })
    },
    // 获取头像
    GetAvatar ({
      commit
    }, avatar) {
      return new Promise(resolve => {
        // console.info('avatar:', avatar)
        GetFile(avatar).then((res) => {
          const avatarUrl = res.data

          // console.info('avatar:', avatarUrl)
          commit('SET_USER_AVATAR', avatarUrl)
          resolve()
        })
      })
    },
    // 获取系统菜单
    GetMenu ({
      commit
    }, type) {
      return new Promise(resolve => {
        GetMenu().then((res) => {
          const menu = res.data.data
          // const menu = deepClone(data)
          // const asideSet = []
          const newMenus = []
          menu.forEach(m => {
            const newMenu = {}
            menuRegular(m, newMenu)
            newMenus.push(newMenu)
          })
          // console.info('menu', JSON.stringify(menu))
          // console.info('newMenu', JSON.stringify(newMenus))
          // menu.forEach(x => {
          //   const children = []
          //   if (x.children) {
          //     x.children.filter(y => {
          //       if (y.children && y.children.length > 0) {
          //         // console.info('y', JSON.stringify(y.children))
          //         const grandChildren = []
          //         y.children.filter(z => {
          //           const grandchild = {
          //             path: z.path,
          //             title: z.name,
          //             icon: z.icon
          //           }
          //           grandChildren.push(grandchild)
          //         })
          //
          //         const child = {
          //           title: y.name,
          //           icon: y.icon,
          //           children: grandChildren
          //         }
          //
          //         // const child = y
          //         // child.title = y.name
          //         children.push(child)
          //       } else {
          //         const child = {
          //           path: y.path,
          //           title: y.name,
          //           icon: y.icon
          //         }
          //
          //         // const child = y
          //         // child.title = y.name
          //         children.push(child)
          //       }
          //
          //     })
          //     const v1 = {
          //       path: x.path,
          //       title: x.name,
          //       icon: x.icon,
          //       children: children
          //     }
          //     return asideSet.push(v1)
          //   } else {
          //     const v2 = {
          //       path: x.path,
          //       title: x.name,
          //       icon: x.icon
          //     }
          //
          //     return asideSet.push(v2)
          //   }
          // })

          // console.info('asideSet', JSON.stringify(asideSet))
          commit('SET_MENU', { type, newMenus })
          resolve(newMenus)
        })
      })
    }

  },
  mutations: {
    SET_ACCESS_TOKEN: (state, access_token) => {
      state.access_token = access_token
      setStore({
        name: 'access_token',
        content: state.access_token,
        type: 'session'
      })
    },
    SET_EXPIRES_IN: (state, expires_in) => {
      state.expires_in = expires_in
      setStore({
        name: 'expires_in',
        content: state.expires_in,
        type: 'session'
      })
    },
    SET_REFRESH_TOKEN: (state, rfToken) => {
      state.refresh_token = rfToken
      setStore({
        name: 'refresh_token',
        content: state.refresh_token,
        type: 'session'
      })
    },
    SET_USER_INFO: (state, userInfo) => {
      state.userInfo = userInfo
    },
    SET_USER_AVATAR: (state, avatar) => {
      state.avatarUrl = avatar
    },
    SET_MENU: (state, params = {}) => {
      const { menu, type } = params
      if (type !== false) state.menu = menu
      setStore({
        name: 'menu',
        content: menu,
        type: 'session'
      })
    },
    SET_ROLES: (state, roles) => {
      state.roles = roles
    },
    SET_PERMISSIONS: (state, permissions) => {
      const list = {}
      for (let i = 0; i < permissions.length; i++) {
        list[permissions[i]] = true
      }
      state.permissions = list
    }
  }

}
export default user
