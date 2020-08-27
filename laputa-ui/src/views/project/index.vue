<!--
  -    Copyright (c) 2018-2025, sommer All rights reserved.
  -
  - Redistribution and use in source and binary forms, with or without
  - modification, are permitted provided that the following conditions are met:
  -
  - Redistributions of source code must retain the above copyright notice,
  - this list of conditions and the following disclaimer.
  - Redistributions in binary form must reproduce the above copyright
  - notice, this list of conditions and the following disclaimer in the
  - documentation and/or other materials provided with the distribution.
  - Neither the name of the laputapdm.com developer nor the names of its
  - contributors may be used to endorse or promote products derived from
  - this software without specific prior written permission.
  - Author: sommer (sommer_jiang@163.com)
  -->

<template>

        <d2-container>
                <template slot="header">
                    <el-form
                            :inline="true"
                            :model="listQuery"
                            size="mini"
                            style="margin-bottom: -18px;">
                        <el-form-item label="项目名" prop="productName">
                            <el-input @keyup.enter.native="handleFilter" style="width: 200px;" placeholder="项目名" v-model="listQuery.productName" clearable>
                            </el-input>
                        </el-form-item>
                        <el-form-item>
                            <el-button type="default" @click="handleFilter" icon="el-icon-search">搜 索</el-button>
                        </el-form-item>
                        <el-form-item style="float: right">
                            <el-button @click="handleCreate" type="primary" icon="el-icon-plus">新 增</el-button>
                        </el-form-item>
                    </el-form>
                </template>
                <data-tables
                        :data="groupList"
                        :action-col="actionCol"
                        :table-props="tableProps"
                        :pagination-props="{ pageSizes: [10, 15, 20] }"
                        v-loading="listLoading">
                    <el-table-column type="selection" width="55">
                    </el-table-column>
                    <el-table-column width="200" align="center" label="项目名" show-overflow-tooltip>
                        <template slot-scope="scope">
                            <router-link :to="{ path: '/project/gantt',query:{id: scope.row.id} }" >  <a style="color:#0077c0;font-weight:bold;">{{scope.row.name}}</a></router-link>
                        </template>
                    </el-table-column>
<!--                    <el-table-column width="100" align="center" label="状态">-->
<!--                        <template slot-scope="scope">-->
<!--                            <el-tag  size="small" :type=getLabelType(scope.row.status)>{{ scope.row.status}}</el-tag>-->
<!--                        </template>-->
<!--                    </el-table-column>-->
                    <el-table-column width="100" align="center" prop="userName" label="项目经理" show-overflow-tooltip>
<!--                        <template slot-scope="scope">-->
<!--                            <a :href="scope.row.userName" target="_blank" style="color:#0077c0;text-decoration:underline">{{scope.row.userName}}</a>-->
<!--                        </template>-->
                    </el-table-column>
                    <el-table-column  :show-overflow-tooltip="true"  prop="createTime" width="120" align="center" label="开始时间">

                    </el-table-column>
                    <el-table-column width="120" align="center"  :show-overflow-tooltip="true" prop="endTime" label="结束时间">

                    </el-table-column>
                    <el-table-column  align="center"  :show-overflow-tooltip="true" prop="description" label="详情">

                    </el-table-column>

                    <el-table-column   align="left"  :show-overflow-tooltip="true" prop="progress" label="项目进度">
                        <template slot-scope="scope">
                        <div class="pro-status-col">
                            <!-- 不同文件类型图标区 -->
                            <div class="pro-status-progress">
                                <el-progress :text-inside="true" :stroke-width="20" :percentage="scope.row.progress" :status="scope.row.proStatus | progressTypeFilter" >
                                   </el-progress>
                            </div>
                            <!-- 不同文件类型 显示内容-->
                            <div class="pro-status-status">
                                <el-tag  size="small" :type="scope.row.proStatus | statusTypeFilter">{{scope.row.proStatus | statusShowFilter}}</el-tag>
                            </div>
                        </div>
                        </template>
                    </el-table-column>



                </data-tables>

            <!-- 新增或编辑项目弹框 -->
            <el-dialog :title="textMap[dialogStatus]" :visible.sync="dialogFormVisible" width="400px">
                <tree-transfer :title="title" :from_data='fromData' :to_data='toData' :defaultProps="{label:'label'}" :mode='mode' height='540px' filter openAll>
                </tree-transfer>
                <div slot="footer" class="dialog-footer">
                    <el-button @click="cancel('form')" icon="el-icon-close"></el-button>
                    <el-button v-if="dialogStatus=='create'" type="primary" @click="create('form')" icon="el-icon-check"></el-button>
                    <el-button v-else type="primary" @click="update('form')" icon="el-icon-check"></el-button>
                </div>
            </el-dialog>

        </d2-container>


</template>

<script>
import { addObj, delObj, fetchList, putObj, getAll } from '@/api/project/project'
import treeTransfer from 'el-tree-transfer' // 引入


import { mapGetters } from 'vuex'

export default {
  name: 'projectIndex',
  components: { treeTransfer }, // 注册
  data () {
    return {
      searchForm: {},

      tableProps: {
        border: false,
        stripe: false

      },
      actionCol: {
        props: {
          label: '操作',
          align: 'center'
        },
        buttons: [{
          props: {
            size: 'mini',
            round: '',
            icon: 'el-icon-edit',
            type: 'primary'
          },
          handler: row => {
            this.handleUpdate(row)
          }
        }, {
          props: {
            size: 'mini',
            round: '',
            icon: 'el-icon-delete',
            type: 'danger'
          },
          handler: row => {
            // console.info('row', JSON.stringify(row))
            this.deletes(row, row.index)
            // this.data.splice(this.data.indexOf(row), 1)
            // this.$message('delete success')
          }
        }]
      },
      dialogFormVisible: false,
      dialogDeptVisible: false,
      textMap: {
        update: '编辑用户组',
        create: '新增用户组'
      },
      dialogStatus: 'create',
      treeDeptData: [],
      checkedKeys: [],
      roleProps: {
        label: 'roleName',
        value: 'roleId'
      },
      defaultProps: {
        label: 'name',
        value: 'id'
      },
      listQuery: {
        page: 1,
        limit: 10
      },
      page: {
        total: 0, // 总页数
        currentPage: 1, // 当前页数
        pageSize: 20, // 每页显示多少条,
        isAsc: false// 是否倒序
      },
      groupList: [],
      listLoading: true,

      projectForm: {},
      title: '组名',
      mode: 'transfer', // transfer addressList
      toData: []
    }
  },
  computed: {
    ...mapGetters(['permissions'])
  },
  filters: {
    progressTypeFilter (status) {
      const statusMap = {
        0: 'primary',
        1: 'success',
        2: 'warning',
        3: 'exception'
      }
      return statusMap[status]
    },
    statusTypeFilter (status) {
      const statusMap = {
        0: 'primary',
        1: 'success',
        2: 'warning',
        3: 'danger'
      }
      return statusMap[status]
    },

    statusShowFilter (status) {
      const statusMap = {
        0: '进行中',
        1: '已完成',
        2: '延误中',
        3: '已停止'
      }
      return statusMap[status]
    }
  },
  created () {

    this.init()
  },
  methods: {
    init () {
      // this.getList(this.page)
      this.getAll()
    },
    cancel (formName) {
      this.dialogFormVisible = false
      this.$refs[formName].resetFields()
    },
    getLabelType (status) {
      if (status === '延误中') {
        return 'danger'
      } else if (status === '进行中') {
        return 'primary'
      } else if (status === '已暂停') {
        return 'warning'
      } else {
        return 'success'
      }

    },

    nodeClick (data) {
      this.page.page = 1
      this.getList(this.page, { deptId: data.id })
    },
    getList (page, params) {
      this.listLoading = true
      fetchList(Object.assign({
        current: page.currentPage,
        size: page.pageSize
      }, params, this.searchForm)).then(response => {
        this.groupList = response.data.data.records
        this.page.total = response.data.data.total
        this.listLoading = false
        // console.info('userList', JSON.stringify(this.userList))
      })
    },
    getAll () {
      getAll().then(response => {
        console.info('getall:' + JSON.stringify(response))
        this.groupList = response.data
        this.page.total = 1
        this.listLoading = false
      })
    },
    handleFilter (param) {
      this.searchForm = param
      this.getList(this.page, param)
    },
    handleRefreshChange () {
      this.getList(this.page)
    },
    handleCreate () {
      this.userForm = {}
      this.dialogFormVisible = true
    },
    handleOpenBefore (show, type) {
      window.boxType = type
      this.handleDept()
      if (['edit', 'views'].includes(type)) {
        this.role = []
        for (var i = 0; i < this.userForm.roleList.length; i++) {
          this.role[i] = this.userForm.roleList[i].roleId
        }

      } else if (type === 'add') {
        this.role = []
      }
      show()
    },
    handleUpdate (row) {
      console.log(row)

      this.userForm = row
      this.userForm.role = row.roleList
      this.dialogFormVisible = true
      this.dialogStatus = 'update'

    },
    create (row) {

      // delete this.form.role
      console.log('userform', this.userForm)
      addObj(this.userForm).then(() => {
        this.getList(this.page)
        this.dialogFormVisible = false
        this.$notify({
          title: '成功',
          message: '创建成功',
          type: 'success',
          duration: 2000
        })
      }).catch(e => {
        this.$notify({
          title: '失败',
          message: '失败:' + e,
          type: 'danger',
          duration: 2000
        })
      })
    },
    update (row, index, done, loading) {
      if (this.userForm.phone && this.userForm.phone.indexOf('*') > 0) {
        this.userForm.phone = undefined
      }
      putObj(this.userForm).then(() => {
        this.getList(this.page)
        done()
        this.$notify({
          title: '成功',
          message: '修改成功',
          type: 'success',
          duration: 2000
        })
      }).catch(() => {
        loading()
      })
    },
    deletes (row, index) {
      this.$confirm(
        '此操作将永久删除该项目(项目名:' + row.name + '), 是否继续?',
        '提示',
        {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }
      ).then(() => {
        delObj(row.projectId)
          .then(() => {
            this.list.splice(index, 1)
            this.$notify({
              title: '成功',
              message: '删除成功',
              type: 'success',
              duration: 2000
            })
          })
          .catch(e => {
            this.$notify({
              title: '失败',
              message: '删除失败:' + e.message,
              type: 'error',
              duration: 2000
            })
          })
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消删除'
        })
      })
    }
  }
}
</script>
<style lang="scss">
    .project_manager {
        height: 100%;

    }
    .pro-status-col {
        display: flex;
        >.pro-status-progress{
            flex: 5;
        }
        >.pro-status-status {
            flex: 1;
            padding: 5px;
        }
    }
</style>

