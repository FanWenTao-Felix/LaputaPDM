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
  <div class="app-container calendar-list-container">
    <d2-container>
      <template slot="header">
        当前角色: 普通用户
        <el-form
                :inline="true"
                :model="page"
                size="mini"
                style="margin-bottom: -18px;">

          <el-form-item style="float: right">
            <el-button @click="handleCreate" type="primary" icon="el-icon-plus">提 交</el-button>
          </el-form-item>
        </el-form>
      </template>
      <data-tables
              :data="list"
              :action-col="actionCol"
              :table-props="tableOption.tableProps"
              :pagination-props="{ pageSizes: [5, 10, 15] }"
              v-loading="listLoading">
        <el-table-column v-for="title in tableOption.column" :prop="title.prop" :label="title.label" :key="title.label" >
        </el-table-column>
        <el-table-column
                label="浏览"
                width="100">
          <template slot-scope="scope">
            <el-checkbox v-model="scope.row.read"></el-checkbox>
          </template>
        </el-table-column>
        <el-table-column
                label="创建"
                width="100">
          <template slot-scope="scope">
            <el-checkbox v-model="scope.row.write"></el-checkbox>
          </template>
        </el-table-column>
        <el-table-column
                label="编辑"
                width="100">
          <template slot-scope="scope">
            <el-checkbox v-model="scope.row.write"></el-checkbox>
          </template>
        </el-table-column>
        <el-table-column
                label="删除"
                width="100">
          <template slot-scope="scope">
            <el-checkbox v-model="scope.row.write"></el-checkbox>
          </template>
        </el-table-column>
        <el-table-column
                label="检入"
                width="100">
          <template slot-scope="scope">
            <el-checkbox v-model="scope.row.checkin"></el-checkbox>
          </template>
        </el-table-column>
        <el-table-column
                label="检出"
                width="100">
          <template slot-scope="scope">
            <el-checkbox v-model="scope.row.checkout"></el-checkbox>
          </template>
        </el-table-column>
      </data-tables>
    </d2-container>

  </div>
</template>

<script>
import { addObj, delObj, fetchList, putObj } from '@/api/admin/role'
import { tableOption } from '@/const/crud/admin/permission'
import { mapGetters } from 'vuex'

export default {
  name: 'TableRole',
  data () {
    return {
      searchForm: {},
      tableOption: tableOption,
      dsScopeData: [],
      treeData: [],
      checkedKeys: [],
      checkedDsScope: [],
      defaultProps: {
        label: 'name',
        value: 'id'
      },
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
            round: '',
            type: 'primary'
          },
          label: '全选'
        }, {
          props: {
            size: 'mini',
            round: '',
            type: 'danger'
          },
          label: '清空'
        }]
      },
      menuIds: '',
      list: [],
      listLoading: true,
      form: {},
      roleId: undefined,
      roleCode: undefined,
      rolesOptions: undefined,
      dialogPermissionVisible: false
    }
  },
  created () {
    this.getList(this.page)
  },
  computed: {
    ...mapGetters(['elements', 'permissions'])
  },
  methods: {
    getList (page, params) {
      this.listLoading = true
      fetchList(Object.assign({
        current: page.currentPage,
        size: page.pageSize
      }, params, this.searchForm)).then(response => {
        this.list = response.data.data.records
        this.page.total = response.data.data.total
        this.listLoading = false
      }).catch(() => {
        this.listLoading = false
      })
    },
    handleRefreshChange () {
      this.getList(this.page)
    },
    handleFilter (form) {
      this.searchForm = form
      this.getList(this.page, form)
    },
    handleCreate () {

    },
    handleOpenBefore (show) {

      show()
    },
    handleUpdate (row, index) {

    },
    cancal () {
      this.dialogPermissionVisible = false
    },

    /**
       * 解析出所有的节点id
       * @param json 待解析的json串
       * @param idArr 原始节点数组
       * @param temp 临时存放节点id的数组
       * @return 节点id数组
       */
    resolveAllEunuchNodeId (json, idArr, temp) {
      for (let i = 0; i < json.length; i++) {
        const item = json[i]
        // 存在子节点，递归遍历;不存在子节点，将json的id添加到临时数组中
        if (item.children && item.children.length !== 0) {
          this.resolveAllEunuchNodeId(item.children, idArr, temp)
        } else {
          temp.push(idArr.filter(id => id === item.id))
        }
      }
      return temp
    },
    filterNode (value, data) {
      if (!value) return true
      return data.label.indexOf(value) !== -1
    },
    getNodeData (data, done) {
      done()
    },
    handleDelete (row, index) {
      // var _this = this
      this.$confirm('是否确认删除名称为"' + row.roleName + '"' + '"的数据项?', '警告', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(function () {
        return delObj(row.roleId)
      }).then(() => {
        this.getList(this.page)
        this.$notify.success('删除成功')
      })
    },
    create (row, done, loading) {
      if (this.form.dsType === 1) {
        this.form.dsScope = this.$refs.scopeTree.getCheckedKeys().join(',')
      }
      addObj(this.form).then(() => {
        this.getList(this.page)
        done()
        this.$notify.success('创建成功')
      }).catch(() => {
        loading()
      })
    },
    update (row, index, done, loading) {
      if (this.form.dsType === 1) {
        this.form.dsScope = this.$refs.scopeTree.getCheckedKeys().join(',')
      }
      putObj(this.form).then(() => {
        this.getList(this.page)
        done()
        this.$notify.success('修改成功')
      }).catch(() => {
        loading()
      })
    },
    updatePermession (roleId) {
      this.menuIds = ''
      this.menuIds = this.$refs.menuTree.getCheckedKeys().join(',').concat(',').concat(this.$refs.menuTree.getHalfCheckedKeys().join(','))
    },
    deletes (row, index) {
      this.$confirm('此操作将永久删除该角色(角色名:' + row.roleName + '), 是否继续?', '提示',
        {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }
      ).then(() => {
        delObj(row.userId).then(() => {
          this.list.splice(index, 1)
          this.$notify({
            title: '成功',
            message: '删除成功',
            type: 'success',
            duration: 2000
          })
        }).cache(() => {
          this.$notify({
            title: '失败',
            message: '删除失败',
            type: 'error',
            duration: 2000
          })
        })
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消删除'
        })
      })
    }
  }
}
</script>

<style lang="scss" scoped>
  .el-dialog__wrapper {
  .el-dialog {
    width: 61% !important;
  .dialog-main-tree {
    max-height: 400px;
    overflow-y: auto;
  }
  }
  .el-form-item__label {
    width: 20% !important;
    padding-right: 20px;
  }
  .el-form-item__content {
    margin-left: 20% !important;
  }
  }
</style>
