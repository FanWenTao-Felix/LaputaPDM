import Vue from 'vue'
import Vuex from 'vuex'

import d2admin from './modules/d2admin'
import common from './modules/common'
import tags from './modules/tags'
import getters from './getters'
import user from './modules/user'
import logs from './modules/logs'
Vue.use(Vuex)

export default new Vuex.Store({
  modules: {
    d2admin,
    tags,
    common,
    user,
    logs
  },
  getters
})
