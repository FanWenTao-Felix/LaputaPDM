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
              :actionCol="actionCol"
              :pagination-props="{ pageSizes: [5, 10, 15] }"
              v-loading="tableLoading">
        <el-table-column v-for="title in tableOption.column" :prop="title.prop" :label="title.label" :key="title.label" sortable="custom">
        </el-table-column>


      </data-tables>

    </d2-container>
  </div>
</template>

<script>
import { addObj, delObj, fetchList, putObj, submit } from '@/api/activiti/leave-bill'
import { tableOption } from '@/const/crud/activiti/leave-bill'
import { mapGetters } from 'vuex'

export default {
  name: 'LeaveBill',
  data () {
    return {
      searchForm: {},
      tableData: [],
      page: {
        total: 0, // 总页数
        currentPage: 1, // 当前页数
        pageSize: 20 // 每页显示多少条
      },
      actionCol: {
        props: {
          label: '操作',
          align: 'center'
        },
        buttons: [{
          props: {
            size: 'mini',
            name: '提交',
            type: 'primary'
          },
          label: '提交',
          handler: row => {
            this.handleSubmit(row)
          }
        }, {
          props: {
            size: 'mini',
            type: 'success'
          },
          label: '编辑',
          handler: row => {
            // console.info('row', JSON.stringify(row))
            this.handleEdit(row, row.index)
            // this.data.splice(this.data.indexOf(row), 1)
            // this.$message('delete success')
          }
        }, {
          props: {
            size: 'mini',
            type: 'danger'
          },
          label: '删除',
          handler: row => {
            // console.info('row', JSON.stringify(row))
            this.handleDel(row, row.index)
            // this.data.splice(this.data.indexOf(row), 1)
            // this.$message('delete success')
          }
        }
        ]
      },
      tableLoading: false,
      tableOption: tableOption
    }
  },
  created () {
    this.getList(this.page)
  },
  mounted () {
  },
  computed: {
    ...mapGetters(['permissions'])
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
    /**
       * @title 打开新增窗口
       * @detail 调用crud的handleadd方法即可
       *
       **/
    handleAdd: function () {
      this.$refs.crud.rowAdd()
    },
    handleEdit (row, index) {
      this.$refs.crud.rowEdit(row, index)
    },
    handleDel (row, index) {
      this.$refs.crud.rowDel(row, index)
    },
    rowDel: function (row, index) {
      var _this = this
      this.$confirm('是否确认删除ID为' + row.leaveId, '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(function () {
        return delObj(row.leaveId)
      }).then(() => {
        _this.tableData.splice(index, 1)
        _this.$message({
          showClose: true,
          message: '删除成功',
          type: 'success'
        })
      })
    },
    handleSubmit: function (row, index) {
      var _this = this
      this.$confirm('是否确认提交ID为' + row.leaveId, '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(function () {
        return submit(row.leaveId)
      }).then(() => {
        _this.tableData.splice(index, 1)
        _this.$message({
          showClose: true,
          message: '提交成功',
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
    handleUpdate: function (row, index, done) {
      putObj(row).then(() => {
        this.tableData.splice(index, 1, Object.assign({}, row))
        this.$message({
          showClose: true,
          message: '修改成功',
          type: 'success'
        })
        done()
        this.getList(this.page)
      })
    },
    /**
       * @title 数据添加
       * @param row 为当前的数据
       * @param done 为表单关闭函数
       *
       **/
    handleSave: function (row, done) {
      addObj(row).then(() => {
        this.tableData.push(Object.assign({}, row))
        this.$message({
          showClose: true,
          message: '添加成功',
          type: 'success'
        })
        done()
        this.getList(this.page)
      })
    },
    /**
       * 搜索回调
       */
    searchChange (form) {
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

