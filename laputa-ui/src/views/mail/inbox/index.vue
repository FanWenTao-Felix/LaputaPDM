<template>
    <d2-container>

        <div class="filter-container app-container">

            <el-button  @click="reply()" type="primary" class="tool-item filter-item btn-reply">
                <svg-icon icon-class="reply"  />
            </el-button>
            <el-button  @click="reply(true)" type="primary" class="tool-item filter-item btn-reply-all">
                 <svg-icon icon-class="reply-all"/>
            </el-button>
            <el-button  @click="forward" type="primary" icon="el-icon-share" class="tool-item filter-item btn-forward"></el-button>
            <el-button  type="danger" icon="el-icon-delete" class="tool-item filter-item btn-del" v-on:click="handleDelete()"></el-button>
            <el-button  type="primary" class="el-icon-tool-item filter-item btn-reload" v-on:click="initPage">
                 <svg-icon icon-class="reload"/>
            </el-button>

            <el-dropdown @command="handleMark" split-button type="primary" menu-align="start" class="tool-item filter-item">
                标记为
                <el-dropdown-menu slot="dropdown">
                    <el-dropdown-item command="star">
                         <svg-icon icon-class="favorite-star"  />星标邮件</el-dropdown-item>
                    <el-dropdown-item v-for="label in labelList" :key="label.id" :command="label.id + ''">
                         <svg-icon icon-class="label"  />{{label.name}}</el-dropdown-item>
                </el-dropdown-menu>
            </el-dropdown>
            <el-input @keyup.enter.native="handleFilter" style="width: 300px; padding: 10px;" class="filter-item" placeholder="标题" v-model="listQuery.title">
            </el-input>

            <el-select clearable style="width: 120px; padding: 10px;" class="filter-item" v-model="listQuery.status" placeholder="状态">
                <el-option v-for="status in statusOptions" :key="status.value" :label="status.showValue" :value="status.value">
                </el-option>
            </el-select>

            <el-button class="filter-item" type="primary" icon="el-icon-search" @click="handleFilter">搜索</el-button>
            <el-button class="filter-item"  icon="el-icon-document" @click="handleDownload">导出</el-button>
        </div>

        <el-table :key='tableKey' :data="list" ref="multipleTable" @sort-change="customSort" @selection-change="handleSelectionChange" v-loading.body="listLoading" border highlight-current-row style="width: 100%">

            <el-table-column type="selection" min-width="30px">
            </el-table-column>

            <el-table-column align="left" width="90px" label="信息">
                <template slot-scope="scope">
<!--                    <svg-icon icon-class="attachment" className='attachment-icon'/>-->
                    <svg-icon @click.native="toggleStar(scope.row)" :icon-class="scope.row.isStar? 'favourite-o':'favourite'" />
                    <svg-icon v-if="scope.row.isHaveFile" style="padding: 5px;" icon-class="attachment" />
                    <svg-icon v-if="scope.row.isHaveAudio" style="padding: 5px;" icon-class="voice" />
                </template>
            </el-table-column>

            <el-table-column prop="status"  class-name="status-col" label="状态" width="80px">
                <template slot-scope="scope">
                    <el-tag :type="scope.row.status | statusTypeFilter">{{scope.row.status | statusShowFilter}}</el-tag>
                </template>
            </el-table-column>

            <el-table-column prop="sendName" sortable="custom" align="center" label="发件人">
                <template slot-scope="scope">
                    <el-tooltip class="item" effect="dark" :content="scope.row.sendMail" placement="top">
                        <span>{{scope.row.sendName}}</span>
                    </el-tooltip>
                </template>
            </el-table-column>

            <el-table-column prop="title" sortable="custom" label="主题" :show-overflow-tooltip="true" min-width="400px">
                <template slot-scope="scope">
                    <span class="link-type" @click="goToDetail(scope.row.id)">{{scope.row.title}}</span>
                    <el-tag  size="small" style="margin-left: 5px" v-for="label in scope.row.labelList" :key="label.guid">{{label.name}}</el-tag>
                </template>
            </el-table-column>

            <el-table-column prop="receiveDate" sortable="custom" align="center" label="接收时间" width="160px">
                <template slot-scope="scope">
                    <span>{{scope.row.receiveDate | parseTime('{y}-{m}-{d} {h}:{i}')}}</span>
                </template>
            </el-table-column>

            <el-table-column prop="readDate" sortable="custom" align="center" label="阅读时间" width="160px">
                <template slot-scope="scope">
                    <span>{{scope.row.readDate | parseTime('{y}-{m}-{d} {h}:{i}')}}</span>
                </template>
            </el-table-column>
        </el-table>

        <div v-show="!listLoading" class="pagination-container">
            <el-pagination @size-change="handleSizeChange" @current-change="handleCurrentChange" :current-page.sync="listQuery.page" :page-sizes="[10,20,30, 50]" :page-size="listQuery.limit" layout="total, sizes, prev, pager, next, jumper" :total="total">
            </el-pagination>
        </div>

    </d2-container>
</template>

<script>

import { fetchList, delReceiveMail } from '@/api/mail/inbox'
import { toggleStar, markLabel } from '@/api/mail/label'

import { parseTime } from '@/util/date'

export default {
  name: 'inbox',
  data () {
    return {
      list: null,
      total: null,
      listLoading: true,
      listQuery: {
        page: 1,
        limit: 20,
        title: undefined,
        status: undefined,
        sort: '',
        order: ''
      },
      statusOptions: [
        {
          value: 0,
          showValue: '未读'
        },
        {
          value: 1,
          showValue: '已读'
        },
        {
          value: 2,
          showValue: '已回复'
        },
        {
          value: 3,
          showValue: '已转发'
        }
      ],
      multipleSelection: [],
      tableKey: 0,
      labelList: []
    }
  },
  created () {
    this.initPage()
  },
  filters: {
    statusTypeFilter (status) {
      const statusMap = {
        0: 'danger',
        1: 'primary',
        2: 'success',
        3: 'info'
      }
      return statusMap[status]
    },
    statusShowFilter (status) {
      const statusMap = {
        0: '未读',
        1: '已读',
        2: '已回复',
        3: '已转发'
      }
      return statusMap[status]
    }
  },
  methods: {
    initPage () {
      this.getList()
      this.getLabelList()
    },
    getList () {
      this.listLoading = true
      fetchList(this.listQuery).then(response => {
        // console.info('resp:' + JSON.stringify(response))
        this.list = response.data.items
        this.total = response.data.total
        this.listLoading = false
      })
    },
    getLabelList () {
      fetchList().then(res => {
        this.labelList = res.data.labelList
      })
    },
    handleFilter () {
      this.getList()
    },
    handleSizeChange (val) {
      this.listQuery.limit = val
      this.getList()
    },
    handleCurrentChange (val) {
      this.listQuery.page = val
      this.getList()
    },
    customSort (sortObj) {
      this.listQuery.sort = sortObj.prop
      this.listQuery.order = sortObj.order
      this.getList()
    },
    timeFilter (time) {
      if (!time[0]) {
        this.listQuery.start = undefined
        this.listQuery.end = undefined
        return
      }
      this.listQuery.start = parseInt(+time[0] / 1000)
      this.listQuery.end = parseInt((+time[1] + 3600 * 1000 * 24) / 1000)
    },
    goToDetail (id) {
      // this.$store.commit('SET_MAIL_ID', id)
      // this.$store.commit('SET_MAIL_TYPE', 'receive')
      // console.info('id:' + id)
      this.$router.push(
        {
          path: '/mail/detail',
          query: {
            mailId: id,
            type: 'receive'
          }
        })
      // this.$router.push({path: '/mail/detail', params: { mailId: id }})
    },
    reply (isALL) {
      const selectedLen = this.multipleSelection.length || 0
      if (selectedLen !== 1) {
        this.$message('请选择一封邮件进行回复')
        return
      }
      this.$store.commit('SET_MAIL_ID', this.multipleSelection[0].id)
      if (isALL) {
        this.$store.commit('SET_PAGE_TYPE', 'replyAll')
      } else {
        this.$store.commit('SET_PAGE_TYPE', 'reply')
      }
      this.$store.commit('SET_MAIL_TYPE', 'receive')
      this.$router.push({ path: '/mail/send' })
    },
    forward () {
      const selectedLen = this.multipleSelection.length || 0
      if (selectedLen !== 1) {
        this.$message('请选择一封邮件进行转发')
        return
      }
      this.$store.commit('SET_MAIL_ID', this.multipleSelection[0].id)
      this.$store.commit('SET_PAGE_TYPE', 'forward')
      this.$store.commit('SET_MAIL_TYPE', 'receive')
      this.$router.push({ path: '/mail_send/index' })
    },
    handleSelectionChange (val) {
      this.multipleSelection = val
    },
    handleDelete () {
      const selectedLen = this.multipleSelection.length || 0
      if (selectedLen < 1) {
        this.$message('请选择邮件进行删除')
        return
      }
      this.$confirm('是否删除这' + selectedLen + '封邮件?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        const idArr = []
        this.multipleSelection.forEach(item => idArr.push(item.id))
        delReceiveMail(idArr).subscribe({
          next: () => {
            this.$message({
              message: '删除成功',
              type: 'success',
              duration: 2000
            })
            this.getList()
          },
          error: () => this.$message({
            showClose: true,
            message: '删除失败',
            type: 'error'
          })
        })
      }).catch(() => {
        this.$message('操作已取消')
      })
    },
    handleDownload () {
      require.ensure([], () => {
      })
    },
    formatJson (filterVal, jsonData) {
      return jsonData.map(v => filterVal.map(j => {
        if (~j.indexOf('Date')) {
          return parseTime(v[j])
        } else {
          return v[j]
        }
      }))
    },
    toggleStar (row) {
      const idArr = []
      if (row) {
        idArr.push(row.id)
      } else {
        const selectedLen = this.multipleSelection.length || 0
        if (selectedLen < 1) {
          this.$message('请选择邮件进行标记')
          return
        }
        this.multipleSelection.forEach(item => idArr.push(item.id))
      }
      toggleStar(idArr).subscribe({
        next: () => {
          if (row) {
            row.isStar = !row.isStar
          } else {
            this.multipleSelection.forEach(item => item.isStar = true)
          }
        }
      })
    },
    handleMark (labelId) {
      if (labelId === 'star') {
        this.toggleStar()
      } else {
        const selectedLen = this.multipleSelection.length || 0
        if (selectedLen < 1) {
          this.$message('请选择邮件进行标记')
          return
        }
        const idArr = []
        this.multipleSelection.forEach(item => idArr.push(item.id))
        markLabel(labelId, idArr).subscribe({
          next: () => this.getList()
        })
      }
    }
  }
}
</script>

<style lang="scss">
@import '~@/assets/style/btn.scss';
.app-container {
    padding: 20px;
}
.filter-container {
    padding-bottom: 10px;
    .filter-item {
        display: inline-block;
        vertical-align: middle;
        margin-bottom: 10px;
    }
}

.attachment-icon {
    color: red;
}

</style>
