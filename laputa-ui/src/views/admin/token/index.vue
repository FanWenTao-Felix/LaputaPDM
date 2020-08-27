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
      <data-tables
              :data="tableData"
              :table-props="tableOption.tableProps"
              :pagination-props="{ pageSizes: [5, 10, 15] }"
              v-loading="tableLoading">
        <el-table-column type="selection" width="55">
        </el-table-column>
        <el-table-column v-for="title in tableOption.column" :prop="title.prop" :label="title.label" :key="title.label" sortable="custom">
        </el-table-column>

      </data-tables>

    </d2-container>
  </div>
</template>

<script>
import { delObj, fetchList } from '@/api/admin/token'
import { tableOption } from '@/const/crud/admin/token'
import { mapGetters } from 'vuex'

export default {
  name: 'Token',
  data () {
    return {
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
    this.getList(this.page)
  },
  computed: {
    ...mapGetters(['permissions']),
    permissionList () {
      return {
        delBtn: this.vaildData(this.permissions.sys_token_del, false)
      }
    }
  },

  methods: {
    getList (page, params) {
      this.tableLoading = true
      fetchList(Object.assign({
        current: page.currentPage,
        size: page.pageSize
      }, params)).then(response => {
        this.tableData = response.data.data.records
        this.page.total = response.data.data.total
        this.tableLoading = false
      })
    },
    handleDel: function (row, index) {
      var _this = this
      this.$confirm('是否强制' + row.username + '下线?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(function () {
        return delObj(row.access_token)
      }).then(() => {
        _this.tableData.splice(index, 1)
        _this.$message({
          showClose: true,
          message: '强制下线成功',
          type: 'success'
        })
      }).catch(function () {
      })
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

