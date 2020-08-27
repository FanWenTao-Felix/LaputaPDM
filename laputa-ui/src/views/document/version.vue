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
import { delObj, fetchList, getAllFoldersApi } from '@/api/admin/sys-file'
import { tableOption } from '@/const/crud/admin/sys-file'
import { mapGetters } from 'vuex'
import { handleDown, arrayToTree } from '@/util/util'
import { vaildData } from '@/util/validate'
const apiok = 200

export default {
  name: 'sys-file',
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
      tableOption: tableOption,
      explorer_prop: {
        name: 'Name',
        match: 'Name',
        splic: true,
        suffix: 'SuffixName',
        pathId: 'Id',
        pathPid: 'ParentId',
        pathName: 'Name'
      }// 文件管理器配置项
    }
  },
  created () {
    this.getList(this.page)
    this.getAllFolders()
  },
  mounted () {

  },
  computed: {
    ...mapGetters(['permissions']),
    permissionList () {
      return {
        addBtn: vaildData(this.permissions.sys_file_add, false),
        delBtn: vaildData(this.permissions.sys_file_del, true),
        editBtn: vaildData(this.permissions.sys_file_edit, false)
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
        console.info('tableData:', JSON.stringify(response.data))
        this.tableData = response.data.data.records
        this.page.total = response.data.data.total
        this.tableLoading = false
        console.info('tableData:', JSON.stringify(this.tableData))
      }).catch(() => {
        this.tableLoading = false
      })
    },
    getAllFolders () {
      getAllFoldersApi().then(({ data }) => {
        console.info('data:' + JSON.stringify(data))
        if (data.StatusCode === apiok) {
          this.all_folder_list = data.Data || []
          const _list = [...this.all_folder_list]
          const options = {
            id: this.explorer_prop.pathId,
            pid: this.explorer_prop.pathPid,
            children: 'Children'
          }
          this.tree_folder_list = arrayToTree(_list, options);
        }
      })
    },
    rowDel (row, index) {
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
       * 搜索回调
       */
    searchChange (form) {
      this.getList(this.page, form)
    },
    /**
       * 刷新回调
       */
    refreshChange (form) {
      this.searchForm = form
      this.getList(this.page)
    },
    download: function (row, index) {
      handleDown(row.fileName, row.bucketName)
    }
  }
}
</script>

<style lang="scss" scoped>
</style>

