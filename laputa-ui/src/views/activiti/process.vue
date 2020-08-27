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
    <el-dialog :visible.sync="showPicDialog" title="流程图">
      <img :src="actPicUrl" width="100%">
    </el-dialog>
  </div>
</template>

<script>
import { delObj, fetchList, status } from '@/api/activiti/process'
import { tableOption } from '@/const/crud/activiti/process'
import { mapGetters } from 'vuex'

export default {
  name: 'Process',
  data () {
    return {
      searchForm: {},
      showPicDialog: false,
      actPicUrl: '',
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
            name: '流程图',
            type: 'primary'
          },
          label: '流程图',
          handler: row => {
            this.handlePic(row)
          }
        }, {
          props: {
            size: 'mini',
            type: 'success'
          },
          label: '激活',
          handler: row => {
            // console.info('row', JSON.stringify(row))
            this.handleStatus(row, 'active')
            // this.data.splice(this.data.indexOf(row), 1)
            // this.$message('delete success')
          }
        }, {
          props: {
            size: 'mini',
            type: 'danger'
          },
          label: '失效',
          handler: row => {
            // console.info('row', JSON.stringify(row))
            this.handleStatus(row, 'suspend')
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
            this.handleDel(row, 'suspend')
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
  mounted: function () {
  },
  computed: {
    ...mapGetters(['permissions'])
  },
  methods: {
    getList (page, params) {
      this.tableLoading = true
      fetchList(
        Object.assign(
          {
            descs: 'create_time',
            current: page.currentPage,
            size: page.pageSize
          },
          params,
          this.searchForm
        )
      ).then(response => {
        this.tableData = response.data.data.records
        this.page.total = response.data.data.total
        this.tableLoading = false
      })
    },
    handlePic (row) {
      this.actPicUrl =
          `/act/process/resource/` +
          row.deploymentId +
          '/' +
          row.processonDefinitionId +
          '/image'
      this.showPicDialog = true
    },
    handleStatus (row, type) {
      var _this = this
      this.$confirm(
        '是否确认操作ID为"' + row.processonDefinitionId + '"的流程?',
        '警告',
        {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }
      ).then(function () {
        return status(row.processonDefinitionId, type)
      }).then(() => {
        this.getList(this.page)
        _this.$message({
          showClose: true,
          message: '操作成功',
          type: 'success'
        })
        this.getList(this.page)
      })
    },
    handleDel (row, index) {
      this.rowDel(row, index)
    },
    rowDel: function (row) {
      var _this = this
      this.$confirm(
        '是否确认删除ID为"' + row.deploymentId + '"的模型?',
        '警告',
        {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }
      ).then(function () {
        return delObj(row.deploymentId)
      }).then(() => {
        this.getList(this.page)
        _this.$message({
          showClose: true,
          message: '删除成功',
          type: 'success'
        })
        this.getList(this.page)
      }).catch(function() {
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
    refreshChange() {
      this.getList(this.page)
    }
  }
}
</script>

<style lang="scss" scoped>
</style>

