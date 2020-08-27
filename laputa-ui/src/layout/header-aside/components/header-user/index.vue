<template>
  <div>

  <el-dropdown size="small" class="d2-mr">
    <img
            v-if="userInfo.avatar"
            id="thumbnail"
            class="top-bar__img">
<!--    <span class="btn-text">{{userInfo.username ? `您好 ${userInfo.username}` : '未登录'}}</span>-->
    <el-dropdown-menu slot="dropdown">
      <el-dropdown-item divided>
        <router-link to="/">首页</router-link>
      </el-dropdown-item>
      <el-dropdown-item divided>
        <router-link to="/user/info">{{userInfo.username ? `${userInfo.username}` : '未登录'}}</router-link>
      </el-dropdown-item>

      <el-dropdown-item  divided @click.native="logout">
        <d2-icon name="power-off" class="d2-mr-5"/>
        退出
      </el-dropdown-item>
    </el-dropdown-menu>
  </el-dropdown>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
import { handleImg } from '@/util/util'

export default {
  computed: {
    ...mapGetters([
      'userInfo'
    ])
  },
  created () {
    handleImg(this.userInfo.avatar, 'thumbnail')
    // console.info(this.userInfo.avatar)
    this.$store.dispatch('GetAvatar', this.userInfo.avatar)
  },
  methods: {
    /**
     * @description 登出
     */
    logout () {

      this.$confirm('是否退出系统, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.$store.dispatch('LogOut').then(() => {
          this.$router.push({ path: '/login' })
        })
      })
    },
    handleClick () {
      this.$router.push({
        name: '/user/info'
      })
    }
  }
}
</script>
<style lang="scss">
  .top-bar__img {
    margin: 0 8px 0 5px;
    padding: 2px;
    width: 30px;
    height: 30px;
    border-radius: 100%;
    box-sizing: border-box;
    border: 1px solid #eee;
    vertical-align: middle;
  }

</style>
