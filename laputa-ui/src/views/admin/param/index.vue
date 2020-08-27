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
                :model="searchForm"
                size="mini"
                style="margin-bottom: -18px;">
          <el-form-item label="文件名" prop="username">
            <el-input  style="width: 200px;" placeholder="文件名" v-model="searchForm.fileName" clearable>
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
              :pagination-props="{ pageSizes: [5, 10, 20] }"
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
import { addObj, delObj, fetchList, putObj } from '@/api/admin/sys-public-param'
import { tableOption } from '@/const/crud/admin/sys-public-param'
import { mapGetters } from 'vuex'
import { vaildData } from '@/util/validate'
export default {
  name: 'Syspublicparam',
  data () {
    return {
      searchForm: {},
      tableData: [],
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
  },
  mounted: function () {
  },
  computed: {
    ...mapGetters(['permissions']),
    permissionList () {
      return {
        addBtn: vaildData(this.permissions.admin_syspublicparam_add, false),
        delBtn: vaildData(this.permissions.admin_syspublicparam_del, false),
        editBtn: vaildData(this.permissions.admin_syspublicparam_edit, false)
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
    rowDel: function (row, index) {
      var _this = this
      this.$confirm('是否确认删除ID为' + row.publicId, '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(function() {
        return delObj(row.publicId)
      }).then(data => {
        this.getList(this.page)
        _this.$message({
          showClose: true,
          message: '删除成功',
          type: 'success'
        })
        this.getList(this.page)
      })
    },
    /**
       * @title 数据更新
       * @param row 为当前的数据
       * @param index 为当前更新数据的行数
       * @param done 为表单关闭函数
       *
       **/
    handleUpdate: function (row, index, done, loading) {
      putObj(row).then(data => {
        this.tableData.splice(index, 1, Object.assign({}, row))
        this.$message({
          showClose: true,
          message: '修改成功',
          type: 'success'
        })
        done()
        this.getList(this.page)
      }).catch(() => {
        loading()
      })
    },
    /**
       * @title 数据添加
       * @param row 为当前的数据
       * @param done 为表单关闭函数
       *
       **/
    handleSave: function (row, done, loading) {
      addObj(row).then(data => {
        this.tableData.push(Object.assign({}, row))
        this.$message({
          showClose: true,
          message: '添加成功',
          type: 'success'
        })
        done()
        this.getList(this.page)
      }).catch(() => {
        loading()
      })
    },
    /**
       * 搜索回调
       */
    searchChange(form) {
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

<style lang="scss" scoped>
</style>
