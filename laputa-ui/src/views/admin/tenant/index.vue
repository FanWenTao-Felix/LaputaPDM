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
  </div>
</template>

<script>
import { addObj, delObj, fetchList, putObj } from '@/api/admin/tenant'
import { tableOption } from '@/const/crud/admin/tenant'
import { mapGetters } from 'vuex'
import { vaildData } from '@/util/validate'

export default {
  name: 'Tenant',
  data () {
    return {
      listLoading: false,
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
    this.getList(this.page)
  },
  computed: {
    ...mapGetters(['permissions']),
    permissionList () {
      return {
        addBtn: vaildData(this.permissions.admin_systenant_add, false),
        delBtn: vaildData(this.permissions.admin_systenant_del, false),
        editBtn: vaildData(this.permissions.admin_systenant_edit, false)
      }
    }
  },
  methods: {
    getList (page, params) {
      this.tableLoading = true
      fetchList(Object.assign({
        current: page.currentPage,
        size: page.pageSize
      }, params, this.searchForm)).then(response => {
        this.tableData = response.data.data.records
        this.page.total = response.data.data.total
        this.tableLoading = false
      }).catch(() => {
        this.tableLoading = false
      })
    },
    rowDel: function (row, index) {
      var _this = this
      this.$confirm('是否确认删除ID为' + row.id, '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        return delObj(row.id)
      }).then(data => {
        _this.tableData.splice(index, 1)
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
    handleUpdate: function(row, index, done, loading) {
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
    handleSave: function(row, done, loading) {
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
    refreshChange() {
      this.getList(this.page)
    }
  }
}
</script>

<style lang="scss" scoped>
</style>
