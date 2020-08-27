<template>
  <div
    class="d2-layout-header-aside-group"
    :style="styleLayoutMainGroup"
    :class="{grayMode: grayActive}">
    <!-- 半透明遮罩 -->
    <div class="d2-layout-header-aside-mask"></div>
    <!-- 主体内容 -->
    <div class="d2-layout-header-aside-content" flex="dir:top">
      <!-- 顶栏 -->
      <div
        class="d2-theme-header"
        :style="{
          opacity: this.searchActive ? 0.5 : 1
        }"
        flex-box="0"
        flex>
        <div class="logo-group" :style="{width: asideCollapse ? asideWidthCollapse : asideWidth}" flex-box="0">
          <img v-if="asideCollapse" :src="`${$baseUrl}image/theme/${themeActiveSetting.name}/logo/logo.png`">
          <div v-else class="pox">
            产品数据管理系统

          </div>

        </div>
        <div class="toggle-aside-btn" @click="handleToggleAside" flex-box="0">
          <d2-icon name="bars"/>
        </div>
        <d2-menu-header flex-box="1"/>
        <!-- 顶栏右侧 -->
        <div class="d2-header-right" flex-box="0">
          <!-- 如果你只想在开发环境显示这个按钮请添加 v-if="$env === 'development'" -->
          <d2-header-search @click="handleSearchClick"/>
          <d2-header-log/>
          <d2-header-info/>
<!--          <d2-header-fullscreen/>-->
<!--          <d2-header-theme v-if="$env === 'development'" />-->
<!--          <d2-header-size/>-->
<!--          <d2-header-locales/>-->
<!--          <d2-header-color/>-->
          <d2-header-user/>
        </div>
      </div>
      <!-- 下面 主体 -->
      <div class="d2-theme-container" flex-box="1" flex>
        <!-- 主体 侧边栏 -->
        <div
          flex-box="0"
          ref="aside"
          class="d2-theme-container-aside"
          :style="{
            width: asideCollapse ? asideWidthCollapse : asideWidth,
            opacity: this.searchActive ? 0.5 : 1
          }">
          <d2-menu-side/>
        </div>

        <!-- 主体 -->
        <div class="d2-theme-container-main" flex-box="1" flex>
          <!-- 搜索 -->
          <transition name="fade-scale">
            <div v-if="searchActive" class="d2-theme-container-main-layer" flex>
              <d2-panel-search
                ref="panelSearch"
                @close="searchPanelClose"/>
            </div>
          </transition>
          <!-- 内容 -->
          <transition name="fade-scale">
            <div v-if="!searchActive" class="d2-theme-container-main-layer" flex="dir:top">
              <!-- tab -->
              <div class="d2-theme-container-main-header" flex-box="0">
                <d2-tabs/>
              </div>
              <!-- 页面 -->
              <div class="d2-theme-container-main-body" flex-box="1">
                <transition :name="transitionActive ? 'fade-transverse' : ''">
                  <keep-alive :include="keepAlive">
                    <router-view/>
                  </keep-alive>
                </transition>
              </div>
            </div>
          </transition>

<!--          <right-panel>-->
<!--            试试看的-->
<!--          </right-panel>-->
        </div>
      </div>

    </div>
  </div>
</template>

<script>
import d2MenuSide from './components/menu-side'
import d2MenuHeader from './components/menu-header'
import d2Tabs from './components/tabs'
// import d2HeaderFullscreen from './components/header-fullscreen'
// import d2HeaderLocales from './components/header-locales'
// import d2HeaderColor from './components/header-color'
// import d2HeaderSize from './components/header-size'
import d2HeaderSearch from './components/header-search'

// import d2HeaderTheme from './components/header-theme'
import d2HeaderUser from './components/header-user'
import d2HeaderLog from './components/header-log'
import d2HeaderInfo from './components/header-info'
import { mapState, mapGetters, mapActions } from 'vuex'
import { getStore } from '@/util/store.js'
import { validatenull } from '@/util/validate'
// import { frameInRoutes } from '@/router/routes'
import mixinSearch from './mixins/search'
import RightPanel from '@/components/RightPanel'

// import store from '@/store'
// import * as SockJS from 'sockjs-client'
// import Stomp from 'stomp-websocket'

export default {
  name: 'd2-layout-header-aside',
  mixins: [
    mixinSearch
  ],
  components: {
    d2MenuSide,
    d2MenuHeader,
    d2Tabs,
    // d2HeaderFullscreen,
    // d2HeaderLocales,
    // d2HeaderColor,
    // d2HeaderSize,
    d2HeaderSearch,
    // d2HeaderTheme,
    d2HeaderUser,
    d2HeaderInfo,
    d2HeaderLog,
    RightPanel
  },
  data () {
    return {
      // [侧边栏宽度] 正常状态
      asideWidth: '200px',
      // [侧边栏宽度] 折叠状态
      asideWidthCollapse: '65px',
      // 刷新token锁
      refreshLock: false,
      // 刷新token的时间
      refreshTime: '',
      nodes: [],
      websocket: null

    }
  },
  created () {
    // 实时检测刷新token
    this.refreshToken()
    this.$store.dispatch('GetMenu').then(data => {
      if (data.length === 0) return

      // console.info('GetMenu data:', JSON.stringify(data))
      // 处理路由 得到每一级的路由设置
      // console.info('asideSet', JSON.stringify(asideSet))
      // this.$store.commit('d2admin/page/init', routes)

      // 设置用户菜单
      // this.$store.commit('user/SET_MENU_ALL', asideSet, { root: true })
      // 设置顶栏菜单
      this.$store.commit('d2admin/menu/headerSet', data)
      // 设置侧边栏菜单
      // const _side = data.filter(menu => menu.path === '/admin')
      // console.info('_side', JSON.stringify(_side))
      // this.$store.commit('d2admin/menu/asideSet', _side.length > 0 ? _side[0].children : [])
      const _side = data
      this.$store.commit('d2admin/menu/asideSet', _side.length > 0 ? _side : [])

      // 初始化菜单搜索功能
      this.$store.commit('d2admin/search/init', data)

      // this.initWebSocket()

      // this.initActWebSocket()

    })


  },
  destroyed () {
    clearInterval(this.refreshTime)
    clearInterval(this.timer)
    // this.websocket.close() //离开路由之后断开websocket连接
    /*
      * 默认关闭websocket，如需工作流通知，则开启
      // *
      */
    // this.disconnect()
  },
  computed: {
    ...mapGetters([
      'userInfo'
    ]),
    ...mapState('d2admin', {
      keepAlive: state => state.page.keepAlive,
      grayActive: state => state.gray.active,
      transitionActive: state => state.transition.active,
      asideCollapse: state => state.menu.asideCollapse
    }),
    ...mapGetters('d2admin', {
      themeActiveSetting: 'theme/activeSetting'
    }),
    /**
     * @description 最外层容器的背景图片样式
     */
    styleLayoutMainGroup () {
      return {
        ...this.themeActiveSetting.backgroundImage ? {
          backgroundImage: `url('${this.$baseUrl}${this.themeActiveSetting.backgroundImage}')`
        } : {}
      }
    }
  },
  methods: {
    ...mapActions('d2admin/menu', [
      'asideCollapseToggle'
    ]),
    // 实时检测刷新token
    refreshToken () {

      this.refreshTime = setInterval(() => {
        const token = getStore({
          name: 'access_token',
          debug: true
        })

        if (validatenull(token)) {
          return
        }

        if (this.expires_in <= 1000 && !this.refreshLock) {
          this.refreshLock = true
          // console.info('refreshToken', token)
          this.$store.dispatch('RefreshToken').catch(() => {
            clearInterval(this.refreshTime)
          })
          this.refreshLock = false
        }
        this.$store.commit('SET_EXPIRES_IN', this.expires_in - 10)
      }, 60000)
    },
    initWebSocket () { //初始化weosocket
      const wsuri = 'ws://127.0.0.1:6010/message/' + 'longmao'
      this.websocket = new WebSocket(wsuri)
      this.websocket.onmessage = this.websocketonmessage
      this.websocket.onopen = this.websocketonopen
      this.websocket.onerror = this.websocketonerror
      this.websocket.onclose = this.websocketclose
    },
    websocketonopen () { //连接建立之后执行send方法发送数据
      const actions = { 'test': '12345' }
      this.websocketsend(JSON.stringify(actions))
    },
    websocketonerror () { //连接建立失败重连
      // this.initWebSocket()
      // setInterval(() => {
      //   this.initWebSocket()
      // }, 50000)
    },
    websocketonmessage (e) { //数据接收
      // const redata = JSON.parse(e.data)
      alert(e.data)
    },
    websocketsend (data) { //数据发送
      this.websocket.send(data)
    },
    websocketclose (e) { //关闭
      console.log('断开连接', e)
    },
    // initActWebSocket () {
    //   // this.connection()
    //   const self = this
    //   // 断开重连机制,尝试发送消息,捕获异常发生时重连
    //   this.timer = setInterval(() => {
    //     try {
    //       self.stompClient.send('test')
    //     } catch (err) {
    //       console.log('断线了: ' + err)
    //       // self.connection()
    //     }
    //   }, 5000)
    // },
    // connection () {
    //   const token = store.getters.access_token
    //   const TENANT_ID = getStore({ name: 'tenantId' }) ? getStore({ name: 'tenantId' }) : '1'
    //   console.log('token:' + token)
    //   const headers = {
    //     'Authorization': 'Bearer ' + token
    //   }
    //   // 建立连接对象
    //   this.socket = new SockJS('/act/ws')// 连接服务端提供的通信接口，连接以后才可以订阅广播消息和个人消息
    //   // 获取STOMP子协议的客户端对象
    //   this.stompClient = Stomp.over(this.socket)
    //   this.stompClient.debug = null
    //   // 向服务器发起websocket连接
    //   this.stompClient.connect(headers, () => {
    //     this.stompClient.subscribe('/task/' + this.userInfo.name + '-' + TENANT_ID + '/remind', (msg) => { // 订阅服务端提供的某个topic;
    //       this.$notify({
    //         title: '协同提醒',
    //         type: 'warning',
    //         dangerouslyUseHTMLString: true,
    //         message: msg.body + '任务，请及时处理',
    //         offset: 60
    //       })
    //     })
    //   }, (err) => {
    //     this.$notify({
    //       title: '协同提醒',
    //       type: 'danger',
    //       dangerouslyUseHTMLString: true,
    //       message: '任务错误，' + err.body,
    //       offset: 60
    //     })
    //   })
    // },
    // disconnect () {
    //   if (this.stompClient != null) {
    //     this.stompClient.disconnect()
    //     console.log('Disconnected')
    //   }
    // },
    /**
     * 接收点击切换侧边栏的按钮
     */
    sendMessage (text) {
      if (text.length > 0) {
        this.newMessagesCount = this.isChatOpen ? this.newMessagesCount : this.newMessagesCount + 1
        this.onMessageWasSent({ author: 'support', type: 'text', data: { text }})
      }
    },
    onMessageWasSent (message) {
      // called when the user sends a message
      this.messageList = [ ...this.messageList, message ]
    },

    handleToggleAside () {
      this.asideCollapseToggle()
    }

  }
}
</script>

<style lang="scss">
  .pox{
    font-size: 20px;
    display: inline-block; /*一定要将div设置为inline-block*/
    vertical-align: middle;/*设置该元素在父元素中的位置*/
    line-height: 70px;
    text-align: center;
  }
// 注册主题
@import '~@/assets/style/theme/register.scss';
</style>
