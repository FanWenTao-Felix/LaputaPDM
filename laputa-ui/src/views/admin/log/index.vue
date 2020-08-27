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
  <div class="log">
    <d2-container>
      <template slot="header">
        <el-form
                :inline="true"
                :model="page"
                size="mini"
                style="margin-bottom: -18px;">
          <el-form-item label="日志类型" prop="username">
            <el-input  style="width: 200px;" placeholder="日志类型" v-model="page.type" clearable>
            </el-input>
          </el-form-item>
          <el-form-item>
            <el-button type="default" @click="searchChange" icon="el-icon-search">搜 索</el-button>
          </el-form-item>

        </el-form>
      </template>
      <data-tables
              :data="tableData"
              :table-props="tableOption.tableProps"
              :pagination-props="{ pageSizes: [5, 10, 15] }"
              v-loading="listLoading">
        <el-table-column type="selection" width="55">
        </el-table-column>
        <el-table-column v-for="title in tableOption.column" :prop="title.prop" :label="title.label" :key="title.label" sortable="custom">
        </el-table-column>

      </data-tables>
    </d2-container>
  </div>
</template>

<script>
import { delObj, fetchList } from '@/api/admin/log'
import { tableOption } from '@/const/crud/admin/log'
import { mapGetters } from 'vuex'

export default {
  name: 'Log',
  data () {
    return {
      listLoading: false,
      tableData: [],
      searchForm: {},
      page: {
        total: 0, // 总页数
        currentPage: 1, // 当前页数
        pageSize: 20 // 每页显示多少条
      },
      tableLoading: false,
      tableOption: tableOption
    }
  },
  created () {
    this.getList(this.page)
  },
  mounted: function () {
  },
  computed: {
    ...mapGetters(['permissions']),
    permissionList () {
      return {
        delBtn: this.vaildData(this.permissions.sys_log_del, false)
      }
    }
  },
  methods: {
    getList (page, params) {
      this.tableLoading = true
      fetchList(Object.assign({
        descs: 'create_time',
        current: page.currentPage,
        size: page.pageSize
      }, params, this.searchForm)).then(response => {
        this.tableData = response.data.data.records
        this.page.total = response.data.data.total
        this.tableLoading = false
      })
    },
    handleDel: function (row) {
      var _this = this
      this.$confirm('是否确认删除ID为"' + row.id + '"的日志?', '警告', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(function () {
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
    searchChange (form) {
      this.searchForm = form
      this.getList(this.page, form)
    },
    refreshChange () {
      this.getList(this.page)
    }
  }
}
</script>

<style lang="scss" scoped>
</style>

