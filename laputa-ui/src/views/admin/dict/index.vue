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
              :action-col="actionCol"
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
    <el-dialog
      :visible.sync="dialogFormVisible"
      :table-loading="tableLoading"
      title="字典项管理"
      width="90%"
      @close="dialogFormVisible=false">

    </el-dialog>
  </div>
</template>

<script>
import { addItemObj, addObj, delItemObj, delObj, fetchItemList, fetchList, putItemObj, putObj } from '@/api/admin/dict'
import { tableDictItemOption, tableOption } from '@/const/crud/admin/dict'
import { mapGetters } from 'vuex'
import { vaildData } from '@/util/validate'
export default {
  name: 'Dict',
  data () {
    return {
      searchForm: {},
      form: {
        type: undefined,
        dictId: undefined
      },
      actionCol: {
        props: {
          label: '操作'
        },
        buttons: [{
          props: {
            size: 'mini',
            round: '',
            icon: 'el-icon-edit',
            type: 'primary'
          },
          handler: row => {
            this.handleUpdate(row)
          },
          label: '编辑'
        }, {
          props: {
            size: 'mini',
            round: '',
            icon: 'el-icon-delete',
            type: 'danger'
          },
          handler: row => {
            // console.info('row', JSON.stringify(row))
            this.deletes(row, row.index)
            // this.data.splice(this.data.indexOf(row), 1)
            // this.$message('delete success')
          },
          label: '删除'
        }]
      },
      dictType: undefined,
      dictId: undefined,
      dialogFormVisible: false,
      tableData: [],
      tableDictItemData: [],
      page: {
        total: 0, // 总页数
        currentPage: 1, // 当前页数
        pageSize: 20 // 每页显示多少条
      },
      tableLoading: false,
      tableOption: tableOption,
      tableDictItemOption: tableDictItemOption
    }
  },
  created () {
    this.getList(this.page)
  },
  mounted () {
  },
  computed: {
    ...mapGetters(['permissions']),
    permissionList () {
      return {
        addBtn: vaildData(this.permissions.sys_dict_add, false),
        delBtn: vaildData(this.permissions.sys_dict_del, false),
        editBtn: vaildData(this.permissions.sys_dict_edit, false)
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
      })
    },

    getDictItemList (dictId, type) {
      this.dictType = type
      this.dictId = dictId
      this.dialogFormVisible = true
      this.tableLoading = true
      fetchItemList(Object.assign({
        current: this.page.currentPage,
        size: this.page.pageSize
      }, { dictId: dictId })).then(response => {
        this.tableDictItemData = response.data.data.records
        this.tableLoading = false
      })
    },
    handleBeforeOpen (done) {
      this.form.type = this.dictType
      this.form.dictId = this.dictId
      done()
    },
    rowDel: function (row) {
      var _this = this
      this.$confirm('是否确认删除数据类型为"' + row.type + '"的数据项?', '警告', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        return delObj(row)
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
    handleUpdate (row, index, done) {
      putObj(row).then(() => {
        this.$message({
          showClose: true,
          message: '修改成功',
          type: 'success'
        })
        this.getList(this.page)
        done()
      })
    },
    handleSave (row, done) {
      addObj(row).then(() => {
        this.$message({
          showClose: true,
          message: '添加成功',
          type: 'success'
        })
        this.getList(this.page)
        done()
      })
    },
    handleItemSave (row, done) {
      addItemObj(row).then(() => {
        this.$message({
          showClose: true,
          message: '添加成功',
          type: 'success'
        })
        this.getDictItemList(row.dictId, row.type)
        done()
      })
    },
    handleItemUpdate (row, index, done) {
      putItemObj(row).then(() => {
        this.$message({
          showClose: true,
          message: '修改成功',
          type: 'success'
        })
        this.getDictItemList(row.dictId, row.type)
        done()
      })
    },
    searchChange (form) {
      this.searchForm = form
      this.getList(this.page, form)
    },
    handleItem (row) {
      this.getDictItemList(row.id, row.type)
    },
    rowItemDel (row) {
      var _this = this
      this.$confirm('是否确认删除数据为"' + row.label + '"的数据项?', '警告', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        return delItemObj(row.id)
      }).then(() => {
        this.getDictItemList(row.dictId, row.type)
        _this.$message({
          showClose: true,
          message: '删除成功',
          type: 'success'
        })
      }).catch(() => {
      })
    }
  }
}
</script>

<style lang="scss" scoped>
</style>

