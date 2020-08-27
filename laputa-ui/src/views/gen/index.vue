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
      <el-row :gutter="20">
        <el-col :span="4">
          <div class="grid-content bg-purple">
            <el-select v-model="q.id" placeholder="请选择数据源" @change="search">
              <el-option
                v-for="item in dataSourceList"
                :key="item.id"
                :label="item.name"
                :value="item.id"/>
            </el-select>
          </div>
        </el-col>
        <el-col :span="4">
          <div class="grid-content bg-purple">
            <el-input v-model="q.tableName" placeholder="表名称"/>
          </div>
        </el-col>
        <el-col :span="12">
          <div class="grid-content bg-purple">
            <el-button type="primary" icon="el-icon-search" @click="search">搜索</el-button>
            <el-button type="primary" icon="el-icon-download" @click="openBatch">批量生成</el-button>
          </div>
        </el-col>
      </el-row>
<!--      <avue-crud-->
<!--        ref="crud"-->
<!--        :page="page"-->
<!--        :data="tableData"-->
<!--        :table-loading="tableLoading"-->
<!--        :option="tableOption"-->
<!--        @on-load="getList"-->
<!--        @refresh-change="refreshChange">-->
<!--        <template-->
<!--          slot-scope="scope"-->
<!--          slot="menu">-->
<!--          <el-button-->
<!--            type="text"-->
<!--            icon="el-icon-check"-->
<!--            @click="handleDown(scope.row,scope.index)">生成-->
<!--          </el-button>-->
<!--          <el-button-->
<!--            type="text"-->
<!--            icon="icon-sheji"-->
<!--            @click="handleDesign(scope.row,scope.index)">设计-->
<!--          </el-button>-->
<!--        </template>-->
<!--      </avue-crud>-->
      <d2-crud
              ref="crud"
              :data="tableData"
              :columns="tableOption.column"
              :rowHandle="tableOption.rowHandle"
              :options="tableOption.options"
              :pagination="page"
              :loading="tableLoading"
              @rowGen="handleDown"
              selection-row
              @selection-change="handleSelectionChange"
      />

      <el-dialog
        :visible.sync="box"
        title="生成配置"
        width="50%"
        lock-scroll>
        <div class="pull-auto">
          <el-form
            ref="formData"
            :model="formData"
            >
            <el-form-item label="表名">
              <el-input v-model="formData.tableName"></el-input>
            </el-form-item>
            <el-form-item label="包名">
              <el-input v-model="formData.packageName"></el-input>
            </el-form-item>
            <el-form-item label="作者">
              <el-input v-model="formData.author"></el-input>
            </el-form-item>
            <el-form-item label="模块名称">
              <el-input v-model="formData.moduleName"></el-input>
            </el-form-item>

            <el-form-item label="表前缀">
              <el-input v-model="formData.tablePrefix"></el-input>
            </el-form-item>

            <el-form-item label="表名称">
              <el-input v-model="formData.tableName"></el-input>
            </el-form-item>

            <el-form-item>
              <el-button @click="cancel">取消</el-button>
              <el-button style="height: 100%; float: right;" type="primary" @click="gen">创建</el-button>

            </el-form-item>
          </el-form>
        </div>
      </el-dialog>
      <el-dialog
        :visible.sync="boxBatch"
        title="批量生成"
        width="50%"
        lock-scroll>
        <el-form
                ref="formBatchData"
                :model="formBatchData"
        >
          <el-form-item label="表名">
            <el-input v-model="formBatchData.tableName"></el-input>
          </el-form-item>

          <el-form-item>
            <el-button type="primary" @click="batchGen">批量创建</el-button>
            <el-button @click="cancel">取消</el-button>
          </el-form-item>
        </el-form>



      </el-dialog>

    </d2-container>
  </div>
</template>

<script>
import { fetchList, fetchSelectDsList, handleDown } from '@/api/gen/gen'
import { formBatchOption, formOption, tableOption, tableDsOption } from '@/const/crud/gen/gen'

export default {
  name: 'CodeGenerator',
  data () {
    return {
      q: {},
      dataSourceList: [],
      tableData: [],
      formData: {},
      formBatchData: {},
      box: false,
      boxBatch: false,
      selection: {},
      page: {
        total: 0, // 总页数
        currentPage: 1, // 当前页数
        pageSize: 20 // 每页显示多少条
      },
      tableLoading: false,
      tableOption: tableOption,
      tableDsOption: tableDsOption,
      formOption: formOption,
      formBatchOption: formBatchOption

    }
  },
  created () {
    this.getdataSourceList()
    this.getList(this.page)
  },
  methods: {
    handleSelectionChange (selection) {
      this.selection = selection
      console.log(selection)
    },
    getList (page) {
      this.tableLoading = true
      fetchList(Object.assign({
        current: page.currentPage,
        size: page.pageSize
      }, this.q)).then(response => {
        console.info('resp:' + JSON.stringify(response.data.data.records))
        this.tableData = response.data.data.records
        this.page.total = response.data.data.total
        this.tableLoading = false
      })
    },
    handleDown ({ index, row }) {
      this.formData.tableName = row.tableName
      console.info(' formData:' + JSON.stringify(this.formData))
      this.box = true
    },
    cancel () {
      this.box = false
      this.boxBatch = false
    },
    refreshChange () {
      this.getList(this.page)
    },
    gen (form, done) {
      this.formData.id = this.q.id
      handleDown(this.formData).then(() => {
        done()
        this.box = false
      }).catch(() => {
        done()
      })
    },
    getdataSourceList () {
      fetchSelectDsList().then(response => {
        this.dataSourceList = response.data.data
      })
    },
    search () {
      this.getList(this.page)
    },
    openBatch () {
      console.info('selection:' + JSON.stringify(this.selection))
      var arr = Object.keys(this.selection)
      if (arr.length === 0) {
        this.$message.error('选中表数量不合法，数量最少2个或最多为10个')
        return false
      }
      if (!this.selection || this.selection.length <= 1 || this.selection.length > 10) {
        this.$message.error('选中表数量不合法，数量最少2个或最多为10个')
        return false
      }

      const tableName = []
      for (const table of this.selection) {
        tableName.push(table.tableName)
      }
      this.formBatchData.tableName = tableName.join('-')
      this.boxBatch = true
    },
    batchGen (form, done) {
      this.formBatchData.id = this.q.id
      handleDown(this.formBatchData).then(() => {
        done()
        this.boxBatch = false
      }).catch(() => {
        done()
      })
    }
  }
}
</script>

<style lang="scss" scoped>
</style>

