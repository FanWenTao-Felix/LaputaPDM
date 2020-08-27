// Vue
import Vue from 'vue'
import i18n from './i18n'
import App from './App'
// 核心插件
import d2Admin from '@/plugin/d2admin'
// store
import store from '@/store/index'

// 菜单和路由设置
import router from './router'
import menuHeader from '@/menu/header'
import menuAside from '@/menu/aside'
import { frameInRoutes } from '@/router/routes'
import './icons' // icon

import * as urls from '@/config/env'

import * as filters from './filters'
// import VoerroTagsInput from '@voerro/vue-tagsinput'
import InputTag from 'vue-input-tag'
// 同时使用 DataTables 和 DataTablesServer
import VueDataTables from 'vue-data-tables'
import D2Crud from '@d2-projects/d2-crud'

import wl from 'wl-vue-select'
import 'wl-vue-select/lib/wl-vue-select.css'

import '@/assets/iconfont/iconfont.js'
import '@/assets/iconfont/iconfont.css'

// css files
import 'vue2-admin-lte/src/lib/css'

// js files
import 'vue2-admin-lte/src/lib/script'


// import Modeler from '@processmaker/modeler'
//
//
//
//
//
//
// Vue.use(Modeler)

Vue.use(wl)
Vue.use(VueDataTables)

Vue.component('input-tag', InputTag)

// Vue.use(ElementUI)
Vue.use(D2Crud, { size: 'mini' })




// 核心插件
Vue.use(d2Admin)
// Vue.use(VueAxios, axios)
// 加载相关url地址
Object.keys(urls).forEach(key => {
  Vue.prototype[key] = urls[key]
})

// 全局filter
Object.keys(filters).forEach(key => {
  Vue.filter(key, filters[key])
})

// Vue.use(Avue, { locale: 'zh-CN' })

new Vue({
  router,
  store,
  i18n,
  render: h => h(App),
  created () {
    // 处理路由 得到每一级的路由设置
    this.$store.commit('d2admin/page/init', frameInRoutes)
    // 设置顶栏菜单
    this.$store.commit('d2admin/menu/headerSet', menuHeader)
    // 设置侧边栏菜单
    this.$store.commit('d2admin/menu/asideSet', menuAside)
    // 初始化菜单搜索功能
    this.$store.commit('d2admin/search/init', menuHeader)
  },
  watch: {
    // 监听路由 控制侧边栏显示
    // 检测路由变化切换侧边栏内容
    '$route.matched': {
      handler (matched) {
        // if (matched.length > 0) {
        //   matched.filter(m => console.log('m:' + m.path))
        //
        // }

        if (matched.length > 0) {
          const allMenu = this.$store.state.d2admin.menu.header
          // console.info('allmenu', JSON.stringify(allMenu))
          // console.info('matched', JSON.stringify(matched[0].path))
          if (allMenu[0].children) {
            const child = allMenu[0].children
            // console.info('child', JSON.stringify(child))
            // const _side = allMenu.filter(menu => menu.path === matched[0].path)
            // console.info('_side', JSON.stringify(_side))
            // console.info('child', JSON.stringify(child))
            const _side = child.children
            if (_side) {
              this.$store.commit('d2admin/menu/asideSet', _side.length > 0 ? _side[0].children : [])
            }

          }

        }
      },
      immediate: true
    }

  },
  mounted () {
    // 展示系统信息
    this.$store.commit('d2admin/releases/versionShow')
    // 用户登录后从数据库加载一系列的设置
    this.$store.dispatch('d2admin/account/load')
    // 获取并记录用户 UA
    this.$store.commit('d2admin/ua/get')
    // 初始化全屏监听
    this.$store.dispatch('d2admin/fullscreen/listen')
  }
}).$mount('#app')
