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
import { addObj, delObj, fetchList, putObj } from '@/api/admin/client'
import { tableOption } from '@/const/crud/admin/client'
import { mapGetters } from 'vuex'
import '@/util/validate'
export default {
  name: 'Client',
  data () {
    return {
      listLoading: false,
      searchForm: {
        fileName: ''
      },
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
  mounted: function () {
  },
  computed: {
    ...mapGetters(['permissions']),
    permissionList () {
      return {
        addBtn: vaildData(this.permissions.sys_client_add, false),
        delBtn: vaildData(this.permissions.sys_client_del, false),
        editBtn: vaildData(this.permissions.sys_client_edit, false)
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
    handleDelete: function (row, index) {
      var _this = this
      this.$confirm('是否确认删除ID为' + row.clientId, '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(function () {
        return delObj(row.clientId)
      }).then(() => {
        _this.$message.success('删除成功')
        this.refreshChange()
      }).catch(function () {
      })
    },
    handleUpdate: function (row, index, done) {
      row.authorizedGrantTypes = row.authorizedGrantTypes.join(',')
      if (row.accessTokenValidity === 0) {
        row.accessTokenValidity = 60 * 60 * 12
      }
      if (row.refreshTokenValidity === 0) {
        row.refreshTokenValidity = 60 * 60 * 24 * 30
      }
      putObj(row).then(() => {
        this.$message.success('修改成功')
        this.refreshChange()
        done()
      })`-`
    },
    handleSave: function (row, done) {
      row.authorizedGrantTypes = row.authorizedGrantTypes.join(',')
      if (row.accessTokenValidity === 0) {
        row.accessTokenValidity = 60 * 60 * 12
      }
      if (row.refreshTokenValidity === 0) {
        row.refreshTokenValidity = 60 * 60 * 24 * 30
      }
      addObj(row).then(() => {
        this.$message.success('添加成功')
        this.refreshChange()
        done()
      })
    },
    refreshChange () {
      this.getList(this.page)
    }
  }
}
</script>

<style lang="scss" scoped>
</style>

