<!--
  -    Copyright (c) 2018-2025, Sommer 20200212 All rights reserved.
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
  - Author: Sommer (sommer_jiang@163.com)
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
                <el-table-column v-for="item in tableOption.column" :prop="item.prop" :width="item.width" :label="item.label" :key="item.label" sortable="custom">
                </el-table-column>
                <el-table-column align="center" label="图片" width="120">-->
                    <template slot-scope="scope">
<!--                        <img src="data:{{scope.row.imageMime}};base64,{{scope.row.imageContent}}"/>-->
                        <img :src= "imageUrl(scope.row)">
                    </template>
                </el-table-column>
            </data-tables>
        </d2-container>
    </div>
</template>

<script>
import { fetchList, getObj, addObj, putObj, delObj } from '@/api/document/docmimetype'
import { tableOption } from '@/const/crud/document/docmimetype'

export default {
  name: 'docmimetype',
  data () {
    return {
      searchForm: {},
      tableData: [],
      page: {
        total: 0, // 总页数
        currentPage: 1, // 当前页数
        pageSize: 60 // 每页显示多少条
      },
      tableLoading: false,
      tableOption: tableOption
    }
  },
  mounted () {
    this.getList(this.page)
  },
  computed: {

  },
  methods: {
    imageUrl (row) {
      return 'data:' + row.imageMime + ';base64,' + row.imageContent
    },
    getList (page, params) {
      this.tableLoading = true
      fetchList(Object.assign({
        current: page.currentPage,
        size: page.pageSize
      }, params, this.searchForm)).then(response => {
        console.log('doc resp:' + response.data)
        this.tableData = response.data.data.records
        this.page.total = response.data.data.total
        this.tableLoading = false
      }).catch(() => {
        this.tableLoading = false
      })
    },
    rowDel: function (row, index) {
      this.$confirm('是否确认删除ID为' + row.id, '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(function () {
        return delObj(row.id)
      }).then(data => {
        this.$message.success('删除成功')
        this.getList(this.page)
      })
    },
    handleUpdate: function (row, index, done, loading) {
      putObj(row).then(data => {
        this.$message.success('修改成功')
        done()
        this.getList(this.page)
      }).catch(() => {
        loading()
      })
    },
    handleSave: function (row, done, loading) {
      addObj(row).then(data => {
        this.$message.success('添加成功')
        done()
        this.getList(this.page)
      }).catch(() => {
        loading()
      })
    },
    sizeChange (pageSize) {
      this.page.pageSize = pageSize
    },
    currentChange (current) {
      this.page.currentPage = current
    },
    searchChange (form, done) {
      this.searchForm = form
      this.getList(this.page, form)
      done()
    },
    refreshChange () {
      this.getList(this.page)
    }
  }
}
</script>
