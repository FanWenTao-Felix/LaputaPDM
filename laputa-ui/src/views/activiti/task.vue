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

    <el-dialog
      :visible.sync="showTask"
      title="任务办理">
      <el-form :model="taskform" label-width="100px">
        <el-form-item label="活动名称" prop="leaveId">
          <el-input v-model="taskform.leaveId"></el-input>
        </el-form-item>
        <el-form-item label="责任人" prop="username">
          <el-input v-model="taskform.username"></el-input>
        </el-form-item>
        <el-form-item label="期限" prop="days">
          <el-input v-model="taskform.days"></el-input>
        </el-form-item>

        <el-form-item label="内容" prop="content">
          <el-input v-model="taskform.content"></el-input>
        </el-form-item>
        <el-form-item label="开始时间" prop="createTime">
          <el-date-picker
                  v-model="taskform.createTime"
                  type="datetime"
                  format="yyyy-MM-dd HH:mm:ss"
                  value-format="yyyy-MM-dd HH:mm:ss"

                  >
          </el-date-picker>

        </el-form-item>
        <el-form-item label="状态" prop="state">
          <el-input v-model="taskform.state"></el-input>
        </el-form-item>
        <el-form-item label="批注" prop="comment">
          <el-input v-model="taskform.comment"></el-input>
        </el-form-item>

        <el-form-item>
          <el-button
                  v-for="flag in flagList"
                  :key="flag"
                  icon="el-icon-check"
                  plain
                  @click="handleTask(taskform,flag)">{{ flag }}
          </el-button>
        </el-form-item>
      </el-form>

    </el-dialog>
    <el-dialog
      :visible.sync="showComment"
      title="批注列表">
      <data-tables
              :data="taskTableData"
              :table-props="taskOption.tableProps"
              :pagination-props="{ pageSizes: [5, 10, 15] }"
              v-loading="tableLoading">
        <el-table-column v-for="title in taskOption.column" :prop="title.prop" :label="title.label" :key="title.label" sortable="custom">
        </el-table-column>

      </data-tables>
    </el-dialog>
    <el-dialog
      :visible.sync="showPicDialog"
      title="流程图">
      <img v-if="showPicDialog" :src="actPicUrl" width="100%">
    </el-dialog>
  </div>
</template>

<script>
import { doTask, fetchComment, fetchDetail, fetchList } from '@/api/activiti/task'
import { formOption, tableOption, taskOption } from '@/const/crud/activiti/task'
import { mapGetters } from 'vuex'

export default {
  name: 'Task',
  data () {
    return {
      actPicUrl: '',
      taskform: {},
      flagList: {},
      showTask: false,
      showComment: false,
      showPicDialog: false,
      tableData: [],
      taskTableData: [],
      actionCol: {
        props: {
          label: '操作',
          align: 'center'
        },
        buttons: [{
          props: {
            size: 'mini',
            name: '审批',
            type: 'primary'
          },
          label: '审批',
          handler: row => {
            this.audit(row)
          }
        }, {
          props: {
            size: 'mini',
            type: 'success'
          },
          label: '批注',
          handler: row => {
            // console.info('row', JSON.stringify(row))
            this.comment(row, row.index)
            // this.data.splice(this.data.indexOf(row), 1)
            // this.$message('delete success')
          }
        }, {
          props: {
            size: 'mini',
            type: 'danger'
          },
          label: '流程图',
          handler: row => {
            // console.info('row', JSON.stringify(row))
            this.viewPic(row, row.index)
            // this.data.splice(this.data.indexOf(row), 1)
            // this.$message('delete success')
          }
        }
        ]
      },
      page: {
        total: 0, // 总页数
        currentPage: 1, // 当前页数
        pageSize: 20 // 每页显示多少条
      },
      tableLoading: false,
      tableOption: tableOption,
      formOption: formOption,
      taskOption: taskOption
    }
  },
  created () {
  },
  mounted: function () {
    this.getList(this.page)
  },
  computed: {
    ...mapGetters(['permissions'])
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
    audit: function (row) {
      fetchDetail(row.taskId).then(response => {
        this.taskform = response.data.data

        // 根据连线判断下次的流程
        this.flagList = this.taskform.flagList
        this.showTask = true
      })
      this.taskform = row
    },
    comment: function (row) {
      fetchComment(row.taskId).then(response => {
        this.taskTableData = response.data.data
        console.info('taskTableData:' + JSON.stringify(this.taskTableData))
        console.info('taskOption:' + JSON.stringify(this.taskOption))
      })
      this.showComment = true
    },
    handleTask: function (row, result) {
      this.taskform.taskFlag = result
      doTask(this.taskform).then(() => {
        this.$message({
          showClose: true,
          message: '提交成功',
          type: 'success'
        })
        this.showTask = false
        this.getList(this.page)
      })
    },
    viewPic: function (row) {
      this.actPicUrl = `/act/task/view/` + row.taskId
      this.showPicDialog = true
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

