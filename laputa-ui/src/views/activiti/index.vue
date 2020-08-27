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
  <div class="execution">
    <d2-container>
        <template slot="header">
            <el-form
                    :inline="true"
                    :model="page"
                    size="mini"
                    style="margin-bottom: -18px;">

                <el-form-item style="float: right">
                    <el-button @click="handleCreate" type="primary" icon="el-icon-plus">新 增</el-button>
                </el-form-item>
            </el-form>
        </template>
        <data-tables
                :data="tableData"
                :table-props="tableOption.tableProps"
                :action-col="actionCol"
                :pagination-props="{ pageSizes: [5, 10, 15] }"
                v-loading="tableLoading">
            <el-table-column v-for="title in tableOption.column" :prop="title.prop" :label="title.label" :key="title.label" sortable="custom">
            </el-table-column>
        </data-tables>

        <el-dialog :title="textMap[dialogStatus]" :visible.sync="dialogFormVisible" width="400px">
            <el-form :model="actForm" :rules="rules" ref="form" label-width="100px">
                <el-form-item label="模型标识" prop="key">
                    <el-input v-model="actForm.key" placeholder="请输入模型标识"></el-input>
                </el-form-item>
                <el-form-item label="流程分类" prop="category">
                    <el-input v-model="actForm.category" placeholder="请输入流程分类"></el-input>
                </el-form-item>


                <el-form-item label="模型名称" prop="name">
                    <el-input v-model="actForm.name" placeholder="请输入模型名称"></el-input>
                </el-form-item>

                <el-form-item label="描述" prop="desc">
                    <el-input v-model="actForm.desc" placeholder="请输入描述"></el-input>
                </el-form-item>


            </el-form>
            <div slot="footer" class="dialog-footer">
                <el-button @click="cancel('form')" icon="el-icon-close">取 消</el-button>
                <el-button v-if="dialogStatus=='create'" type="primary" @click="createAct(actForm)" icon="el-icon-check">确 定</el-button>
                <el-button v-else type="primary" @click="update('form')" icon="el-icon-check">修 改</el-button>
            </div>
        </el-dialog>
    </d2-container>
  </div>
</template>

<script>
import { addObj, delObj, deploy, fetchList } from '@/api/activiti/activiti'
import { tableOption } from '@/const/crud/activiti/activiti'
import { mapGetters } from 'vuex'

export default {
  name: 'Activiti',
  data () {
    return {
      actForm: {},
      searchForm: {},
      tableOption: tableOption,
      tableProps: {
        border: false,
        stripe: false,
        defaultSort: {
          prop: 'userId',
          order: 'ascending'
        }
      },
      tableData: [],
      actionCol: {
        props: {
          label: '操作',
          align: 'center'
        },
        buttons: [{
          props: {
            size: 'mini',
            circle: true,
            icon: 'el-icon-edit',
            type: 'primary'
          },
          handler: row => {
            this.handleView(row)
          }
        }, {
          props: {
            size: 'mini',
            circle: true,
            icon: 'el-icon-tickets',
            type: 'success'
          },
          handler: row => {
            // console.info('row', JSON.stringify(row))
            this.handleDeploy(row, row.index)
            // this.data.splice(this.data.indexOf(row), 1)
            // this.$message('delete success')
          }
        }, {
          props: {
            size: 'mini',
            circle: true,
            icon: 'el-icon-delete',
            type: 'danger'
          },
          handler: row => {
            // console.info('row', JSON.stringify(row))
            this.handleDel(row, row.index)
            // this.data.splice(this.data.indexOf(row), 1)
            // this.$message('delete success')
          }
        }
        ]
      },
      page: {
        total: 0, // 总页数
        currentPage: 1, // 当前页数
        pageSize: 20 // 每页显示多少条
      },
      tableLoading: false,
      textMap: {
        update: '编辑流程',
        create: '新增流程'
      },
      dialogFormVisible: false,
      dialogStatus: 'create',
      rules: {

      }
    }
  },
  created () {
    this.getList(this.page)
  },
  mounted: function () {
  },
  computed: {
    ...mapGetters(['permissions'])
  },
  methods: {
    getList (page, params) {
      this.tableLoading = true
      fetchList(Object.assign({
        descs: 'create_time',
        current: page.currentPage,
        size: page.pageSize
      }, params, this.searchForm)).then(response => {
        console.info('resp:' + JSON.stringify(response))
        this.tableData = response.data.data.records
        this.page.total = response.data.data.total
        this.tableLoading = false
      })
    },
    handleCreate () {
      this.actForm = {}
      this.dialogFormVisible = true
    },
    cancel (formName) {
      this.dialogFormVisible = false
      this.$refs[formName].resetFields()
    },
    handleView (row) {
      const name = `模型id为${row.id}的${row.name}流程图`,
        src = `/activiti/detail`
      this.$router.push({
        path: src,
        query: {
          id: row.id,
          name: name
        }
      })
    },
    handleDel (row, index) {
      // this.$refs.crud.rowDel(row, index)
    },
    handleDeploy: function(row) {
      var _this = this
      this.$confirm('是否确认部署ID为"' + row.id + '"的模型?', '警告', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(function () {
        return deploy(row.id)
      }).then(() => {
        this.getList(this.page)
        _this.$message({
          showClose: true,
          message: '部署成功',
          type: 'success'
        })
      }).catch(function () {
      })
    },
    rowDel: function (row) {
      var _this = this
      this.$confirm('是否确认删除ID为"' + row.id + '"的模型?', '警告', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(function() {
        return delObj(row.id)
      }).then(() => {
        this.getList(this.page)
        _this.$message({
          showClose: true,
          message: '删除成功',
          type: 'success'
        })
      }).catch(function () {
      })
    },
    /**
       * @title 数据添加
       * @param row 为当前的数据
       * @param done 为表单关闭函数
       *
       **/
    createAct: function (row) {
      console.info('row' + JSON.stringify(row))
      addObj(row).then(() => {
        this.tableData.push(Object.assign({}, row))
        this.$message({
          showClose: true,
          message: '添加成功',
          type: 'success'
        })
        this.dialogFormVisible = false
        this.getList(this.page)
      })
    },
    /**
       * 搜索回调
       */
    searchChange (form) {
      this.searchForm = form
      this.getList(this.page, form)
    },
    /**
       * 刷新回调
       */
    refreshChange () {
      this.getList(this.page)
    }
  }
}
</script>
