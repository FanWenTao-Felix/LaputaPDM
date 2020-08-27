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
      <el-alert
        title="路由配置是非常专业的事情，不建议非工程师操作"
        type="warning"/>

      <template slot="header">
        <el-form
                :inline="true"
                :model="listQuery"
                size="mini"
                style="margin-bottom: -18px;">

          <el-form-item style="float: right">
            <el-button @click="handleCreate" type="primary" icon="el-icon-plus">新 增</el-button>
          </el-form-item>
          <el-button class="u-right" @click="show_list=!show_list">
            <i class="iconfont icon-wl-list file-show-type" v-show="show_list" ></i>
            <i class="iconfont icon-wl-grid file-show-type" v-show="!show_list" ></i>
          </el-button >
        </el-form>
      </template>
      <vue-json-editor v-show="!show_list" v-model="json" :show-btns="false"/>
      <data-tables
              v-show="show_list"
              :data="tableData"
              :action-col="actionCol"
              :table-props="tableOption.tableProps"
              :pagination-props="{ pageSizes: [5, 10, 20] }"
              v-loading="tableLoading">
        <el-table-column v-for="title in tableOption.column" :prop="title.prop" :label="title.label" :key="title.label" sortable="custom">
        </el-table-column>

      </data-tables>
      <div v-show="!show_list" align="center">
        <el-button @click="edit()">更新</el-button>
      </div>
      <!-- 新增或编辑用户弹框 -->
      <el-dialog :title="textMap[dialogStatus]" :visible.sync="dialogFormVisible" width="400px">
        <el-form :model="routerForm" :rules="routerFormRules" ref="routerForm" label-width="100px">
          <el-form-item label="路由ID" prop="routeId">
            <el-input v-model="routerForm.routeId" placeholder="请输路由ID"></el-input>
          </el-form-item>
          <el-form-item label="路由名" prop="name">
            <el-input v-model="routerForm.routeName" placeholder="请输路由名"></el-input>
          </el-form-item>


          <el-form-item label="断言" prop="predicates">
            <el-input v-model="routerForm.predicates" placeholder="路由器断言"></el-input>
          </el-form-item>

          <el-form-item label="过滤器" prop="filters">
            <el-input v-model="routerForm.filters" placeholder="请输入过滤器"></el-input>
          </el-form-item>

          <el-form-item label="链接" prop="uri">
            <el-input v-model="routerForm.uri" placeholder="请输入链接"></el-input>
          </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
          <el-button @click="cancel('routerForm')" icon="el-icon-close">取 消</el-button>
          <el-button v-if="dialogStatus=='create'" type="primary" @click="create('routerForm')" icon="el-icon-check">确 定</el-button>
          <el-button v-else type="primary" @click="update('routerForm')" icon="el-icon-check">修 改</el-button>
        </div>
      </el-dialog>
    </d2-container>

</template>
<script>
import vueJsonEditor from 'vue-json-editor'
import { fetchList, putObj, updateObj, refreshObj, addObj } from '@/api/admin/route'
import { tableOption } from '@/const/crud/admin/router'
export default {

  // 注入vueJsonEditor组件
  components: {
    vueJsonEditor
  },
  data () {
    return {
      show_list: false,
      json: null,
      tableData: [],
      listQuery: {
        page: 1,
        limit: 10
      },
      actionCol: {
        props: {
          label: '操作'
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
      page: {
        total: 0, // 总页数
        currentPage: 1, // 当前页数
        pageSize: 20 // 每页显示多少条
      },
      textMap: {
        update: '编辑路由',
        create: '新增路由'
      },
      routerFormRules: {},
      dialogStatus: 'create',
      routerForm: {},
      dialogFormVisible: false,
      tableLoading: false,
      tableOption: tableOption
    }
  },

  created () {
    this.getList()
  },

  methods: {
    getList () {
      fetchList().then(response => {
        const result = response.data.data

        this.tableData = result
        for (var i = 0; i < result.length; i++) {
          const route = result[i]
          if (route.predicates) {
            const predicates = route.predicates
            route.predicates = JSON.parse(predicates)
          }
          if (route.filters) {
            const filters = route.filters
            route.filters = JSON.parse(filters)
          }
        }
        this.json = result
        for (i = 0; i < result.length; i++) {
          const route = result[i]
          if (route.predicates) {
            const predicates = route.predicates
            route.predicates = JSON.stringify(predicates)
          }
          if (route.filters) {
            const filters = route.filters
            route.filters = JSON.stringify(filters)
          }
        }
        this.tableData = result
        console.info('result:' + JSON.stringify(result))
      })
    },
    handleCreate () {
      this.routerForm = {}
      this.dialogFormVisible = true
    },
    handleUpdate (row) {
      console.log('row：' + JSON.stringify(row))

      this.routerForm = row
      this.dialogFormVisible = true
      this.dialogStatus = 'update'

    },
    create (row) {
      console.log('routerForm', this.routerForm)
      addObj(this.routerForm).then(() => {
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

      console.info('routerForm:' + JSON.stringify(this.routerForm))
      updateObj(this.routerForm).then(() => {
        this.getList(this.page)
        done()
        this.$notify({
          title: '成功',
          message: '修改成功',
          type: 'success',
          duration: 2000
        })
      }).catch(e => {
        done()
        this.$notify({
          title: '失败',
          message: '失败' + e,
          type: 'error',
          duration: 2000
        })
      })
    },
    cancel (formName) {
      this.dialogFormVisible = false
      this.$refs[formName].resetFields()
    },
    edit () {
      putObj(this.json).then(() => {
        refreshObj().then(() => {
          this.$notify({
            title: '成功',
            message: '更新成功',
            type: 'success',
            duration: 2000
          })
        })
      })
    }
  }
}
</script>
