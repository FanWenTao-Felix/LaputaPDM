<template>
  <div class="app-container">
    <d2-container>
    <div v-if="user">
      <el-row :gutter="20">

        <el-col :span="6" :xs="24">
          <user-card :user="user" />
        </el-col>

        <el-col :span="18" :xs="24">
          <el-card>
            <el-tabs v-model="activeTab">
              <el-tab-pane label="活动" name="activity">
                <activity />
              </el-tab-pane>
              <el-tab-pane label="时间线" name="timeline">
                <timeline />
              </el-tab-pane>
              <el-tab-pane label="账户" name="account">
                <account :user="user" />
              </el-tab-pane>
            </el-tabs>
          </el-card>
        </el-col>

      </el-row>
    </div>
    </d2-container>
  </div>
</template>

<script>

import UserCard from './components/UserCard'
import Activity from './components/Activity'
import Timeline from './components/Timeline'
import Account from './components/Account'
import { mapState } from 'vuex'
export default {
  name: 'Profile',
  components: { UserCard, Activity, Timeline, Account },
  data () {
    return {
      activeTab: 'activity'
    }
  },
  computed: {
    ...mapState({
      user: state => state.user
    })
  },
  created () {
    this.getUser()
  },
  methods: {
    getUser () {

      console.info('user:', JSON.stringify(this.user))
    }
  }
}
</script>
