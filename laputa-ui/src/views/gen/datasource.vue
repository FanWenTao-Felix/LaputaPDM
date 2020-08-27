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

      <d2-crud
        ref="d2Crud"
        :data="tableDsData"
        :columns="tableOption.column"
        :rowHandle="tableOption.rowHandle"
        :options="tableOption.options"
        :pagination="dsPage"
        :add-template="tableDsOption.addTemplate"

        :form-options="formOption"
        :add-rules="tableDsOption.addRules"
        @row-add="handleSave"
        edit-title="我的修改"
        :edit-template="tableDsOption.editTemplate"
        @row-edit="handleUpdate"
        @dialog-cancel="handleDialogCancel"
        @pagination-current-change="refreshDsChange"
        @rowDel="rowDel"
      >
        <el-button slot="header" style="margin-bottom: 5px" @click="addRow">新增</el-button>
      </d2-crud>
    </d2-container>
  </div>
</template>

<script>
import { addObj, delObj, fetchDsList, putObj } from '@/api/gen/gen'
import { tableDsOption, tableOption } from '@/const/crud/gen/datasource'

export default {
  name: 'CodeGenerator',
  data () {
    return {
      tableDsData: [],
      box: false,
      dsPage: {
        total: 0, // 总页数
        currentPage: 1, // 当前页数
        pageSize: 20 // 每页显示多少条
      },
      dsForm: {},
      tableLoading: false,
      tableOption: tableOption,
      tableDsOption: tableDsOption,
      formOption: {
        labelWidth: '120px',
        labelPosition: 'left',
        saveLoading: false
      }
    }
  },
  created () {
    this.getDsList(this.dsPage)
  },
  methods: {
    addRow () {
      this.$refs.d2Crud.showDialog({
        mode: 'add'
      })
    },
    handleRowAdd (row, done) {
      // this.formOptions.saveLoading = true
      setTimeout(() => {
        console.log(row)
        this.$message({
          message: '保存成功',
          type: 'success'
        })
        done()
        // this.formOptions.saveLoading = false
      }, 300)
    },
    handleDialogCancel (done) {
      this.$message({
        message: '取消保存',
        type: 'warning'
      })
      done()
    },
    rowDel ({ index, row }) {
      this.$confirm('是否确认删除ID为' + row.id, '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(function () {
        return delObj(row.id)
      }).then(() => {
        this.$message.success('删除成功')
        this.getDsList(this.dsPage)
      })
    },
    handleOpenBefore: function (show) {
      this.dsForm.password = undefined
      show()
    },
    handleUpdate: function ({ index, row }, done) {
      putObj(row).then(() => {
        this.$message.success('修改成功')
        done()
        this.getDsList(this.dsPage)
      })
    },
    handleSave: function (row, done) {
      addObj(row).then(() => {
        this.$message.success('添加成功')
        done()
        this.getDsList(this.dsPage)
      })
    },
    getDsList (page, params) {
      fetchDsList(Object.assign({
        current: page.currentPage,
        size: page.pageSize
      }, params)).then(response => {

        this.tableDsData = response.data.data.records
        this.dsPage.total = response.data.data.total
      })
    },
    refreshDsChange () {
      this.getDsList(this.dsPage)
    }
  }
}
</script>

<style lang="scss" scoped>
</style>

