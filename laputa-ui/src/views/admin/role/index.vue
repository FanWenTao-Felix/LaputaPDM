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
        <el-form
                :inline="true"
                :model="page"
                size="mini"
                style="margin-bottom: -18px;">

          <el-form-item style="float: right">
            <el-button @click="handleCreate" type="primary" icon="el-icon-plus">新 增</el-button>
          </el-form-item>
        </el-form>
      </template>
      <data-tables
              :data="list"
              :table-props="tableOption.tableProps"
              :action-col="actionCol"
              :pagination-props="{ pageSizes: [5, 10, 15] }"
              v-loading="listLoading">
        <el-table-column v-for="title in tableOption.column" :prop="title.prop" :label="title.label" :key="title.label" sortable="custom">
        </el-table-column>


      </data-tables>


    </d2-container>
    <el-dialog
      :visible.sync="dialogPermissionVisible"
      :close-on-click-modal="false"
      title="分配权限">
      <div class="dialog-main-tree">
      <el-tree
        ref="menuTree"
        :data="treeData"
        :default-checked-keys="checkedKeys"
        :check-strictly="false"
        :props="defaultProps"
        :filter-node-method="filterNode"
        class="filter-tree"
        node-key="id"
        highlight-current
        show-checkbox
        default-expand-all/>
      </div>
      <div
              slot="footer"
        class="dialog-footer">
        <el-button
          type="primary"
                   size="small"
          @click="updatePermession(roleId)">更 新
        </el-button>
        <el-button
                type="default"
                size="small"
          @click="cancal()">取消</el-button>
      </div>
    </el-dialog>
    <!-- 新增或编辑权限弹框 -->
    <el-dialog :title="textMap[dialogStatus]" :visible.sync="dialogFormVisible" width="400px">
      <el-form :model="roleForm" :rules="rules" ref="form" label-width="100px">
        <el-form-item label="角色名称" prop="roleName">
          <el-input v-model="roleForm.roleName" placeholder="角色名称不能为空"></el-input>
        </el-form-item>
        <el-form-item label="角色标识" prop="roleCode">
          <el-input v-model="roleForm.roleCode" placeholder="角色标识不能为空"></el-input>
        </el-form-item>



        <el-form-item label="角色描述" prop="roleDesc">
          <el-input v-model="roleForm.roleDesc" placeholder="长度在 128 个字符内"></el-input>
        </el-form-item>

        <el-form-item label="数据权限" prop="dsType">
          <el-input v-model="roleForm.dsType" placeholder="请选择数据权限类型"></el-input>
        </el-form-item>



      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="cancel('form')" icon="el-icon-close">取 消</el-button>
        <el-button v-if="dialogStatus=='create'" type="primary" @click="create('form')" icon="el-icon-check">确 定</el-button>
        <el-button v-else type="primary" @click="update('form')" icon="el-icon-check">修 改</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { addObj, delObj, fetchList, fetchRoleTree, permissionUpd, putObj } from '@/api/admin/role'
import { tableOption } from '@/const/crud/admin/role'
import { fetchTree } from '@/api/admin/dept'
import { fetchMenuTree } from '@/api/admin/menu'
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
          label: '操作'
        },
        buttons: [{
          props: {
            size: 'mini',
            circle: true,
            icon: 'el-icon-edit',
            type: 'primary'
          },
          handler: row => {
            this.handleUpdate(row)
          }
        }, {
          props: {
            size: 'mini',
            circle: true,
            icon: 'el-icon-delete',
            type: 'danger'
          },
          handler: row => {
            // console.info('row', JSON.stringify(row))
            this.deletes(row, row.index)
            // this.data.splice(this.data.indexOf(row), 1)
            // this.$message('delete success')
          }
        }, {
          props: {
            size: 'mini',
            circle: true,
            icon: 'el-icon-tickets',
            type: 'info'
          },
          handler: row => {
            // console.info('row', JSON.stringify(row))
            this.handlePermission(row, row.index)
            // this.data.splice(this.data.indexOf(row), 1)
            // this.$message('delete success')
          }
        }
        ]
      },
      menuIds: '',
      list: [],
      listLoading: true,
      form: {},
      roleId: undefined,
      roleCode: undefined,
      rolesOptions: undefined,
      dialogPermissionVisible: false,
      dialogFormVisible: false,
      dialogDeptVisible: false,
      textMap: {
        update: '编辑角色',
        create: '新增角色'
      },
      dialogStatus: 'create',
      rules: {
        username: [
          {
            required: true,
            message: '请输入账户',
            trigger: 'blur'
          },
          {
            min: 3,
            max: 20,
            message: '长度在 3 到 20 个字符',
            trigger: 'blur'
          },
          {
            trigger: 'blur',
            validator: (rule, value, callback) => {
              const reg = /^[a-zA-Z0-9]+$/
              if (!reg.test(value)) {
                callback(new Error('只能包含英文和数字'))
              } else {
                callback()
              }
            }
          }
        ],
        deptId: [
          {
            required: true,
            message: '请选择部门',
            trigger: 'blur'
          }
        ],

        email: [
          { required: true, message: '请输入邮箱地址', trigger: 'blur' },
          { type: 'email', message: '请输入正确的邮箱地址', trigger: 'blur' }
        ]
      },
      roleForm: {}
    }
  },
  created () {
    this.roleManager_btn_add = this.permissions['sys_role_add']
    this.roleManager_btn_edit = this.permissions['sys_role_edit']
    this.roleManager_btn_del = this.permissions['sys_role_del']
    this.roleManager_btn_perm = this.permissions['sys_role_perm']
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
      this.roleForm = {}
      this.dialogFormVisible = true
    },
    handleOpenBefore (show) {
      fetchTree().then(response => {
        this.dsScopeData = response.data.data
        if (this.form.dsScope) {
          this.checkedDsScope = (this.form.dsScope).split(',')
        } else {
          this.checkedDsScope = []
        }
      })
      show()
    },
    handleUpdate (row, index) {
      this.roleForm = row
      this.dialogFormVisible = true
      this.dialogStatus = 'update'
    },
    cancal () {
      this.dialogPermissionVisible = false
    },
    handlePermission (row) {
      fetchRoleTree(row.roleId)
        .then(response => {
          this.checkedKeys = response.data.data
          return fetchMenuTree()
        })
        .then(response => {
          this.treeData = response.data.data
          // 解析出所有的节点
          this.checkedKeys = this.resolveAllEunuchNodeId(this.treeData, this.checkedKeys, [])
          this.dialogPermissionVisible = true
          this.roleId = row.roleId
          this.roleCode = row.roleCode
        })
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
    create (row) {

      addObj(this.roleForm).then(() => {
        this.getList(this.page)

        this.$notify.success('创建成功')
      }).catch(e => {
        this.$notify.error('创建失败：' + e)
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
      permissionUpd(roleId, this.menuIds).then(() => {
        this.dialogPermissionVisible = false
        this.$store.dispatch('GetMenu', false)
        this.$notify.success('修改成功')
      })
    },
    cancel (formName) {
      this.dialogFormVisible = false
      this.$refs[formName].resetFields()
    },
    deletes (row, index) {
      this.$confirm('此操作将永久删除该角色(角色名:' + row.roleName + '), 是否继续?', '提示',
        {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }
      ).then(() => {
        delObj(row.roleId).then(() => {
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
