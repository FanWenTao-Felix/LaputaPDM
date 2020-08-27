<template>
  <el-card class="box-card-component" style="margin-left:8px;">
    <div slot="header" class="box-card-header">
      <img src="/image/hokkido.jpeg">
    </div>
    <div style="position:relative;">
      <pan-thumb :image="avatar" class="panThumb" />
      <mallki class-name="mallki-text" :text=name />
      <div style="padding-top:35px;" class="progress-item">
        <span>ET65515验证</span>
        <el-progress :percentage="70" />
      </div>
      <div class="progress-item">
        <span>ET57348市场调研</span>
        <el-progress :percentage="18" />
      </div>
      <div class="progress-item">
        <span>ET5245产品规格化</span>
        <el-progress :percentage="12" />
      </div>
      <div class="progress-item">
        <span>ET6532试生产</span>
        <el-progress :percentage="100" status="success" />
      </div>
    </div>
  </el-card>
</template>

<script>
import { mapGetters } from 'vuex'
import PanThumb from '@/components/PanThumb'
import Mallki from '@/components/TextHoverEffect/Mallki'
import request from '@/plugin/axios'

export default {
  components: { PanThumb, Mallki },

  filters: {
    statusFilter (status) {
      const statusMap = {
        success: 'success',
        pending: 'danger'
      }
      return statusMap[status]
    }
  },
  data () {
    return {
      name: 'name',
      avatar: '',
      statisticsData: {
        article_count: 1024,
        pageviews_count: 1024
      }
    }
  },
  created () {
    // console.info('userinfo:', JSON.stringify(this.userInfo))
    this.name = this.userInfo.username
    request({
      url: '/admin/sys-file/' + this.userInfo.avatar,
      method: 'get',
      responseType: 'blob'
    }).then((response) => { // 处理返回的文件流
      const blob = response.data

      this.avatar = URL.createObjectURL(blob)
      console.info('avatar:', this.avatar)
    })


  },
  computed: {
    ...mapGetters([
      'userInfo'
    ])
  }
}
</script>

<style lang="scss" >
.box-card-component{
  .el-card__header {
    padding: 0px!important;
  }
}
</style>
<style lang="scss" scoped>
.box-card-component {
  .box-card-header {
    position: relative;
    height: 220px;
    img {
      width: 100%;
      height: 100%;
      transition: all 0.2s linear;
      &:hover {
        transform: scale(1.1, 1.1);
        filter: contrast(130%);
      }
    }
  }
  .mallki-text {
    position: absolute;
    top: 0px;
    right: 0px;
    font-size: 20px;
    font-weight: bold;
  }
  .panThumb {
    z-index: 100;
    height: 70px!important;
    width: 70px!important;
    position: absolute!important;
    top: -45px;
    left: 0px;
    border: 5px solid #ffffff;
    background-color: #fff;
    margin: auto;
    box-shadow: none!important;
     .pan-info {
      box-shadow: none!important;
    }
  }
  .progress-item {
    margin-bottom: 10px;
    font-size: 14px;
  }
  @media only screen and (max-width: 1510px){
    .mallki-text{
      display: none;
    }
  }
}
</style>
