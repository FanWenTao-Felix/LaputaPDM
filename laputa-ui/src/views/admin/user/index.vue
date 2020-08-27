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
    <div class="user_manager">
        <d2-container>
                <template slot="header">
                    <el-form
                            :inline="true"
                            :model="listQuery"
                            size="mini"
                            style="margin-bottom: -18px;">
                        <el-form-item label="用户名" prop="username">
                            <el-input @keyup.enter.native="handleFilter" style="width: 200px;" placeholder="用户名" v-model="listQuery.username" clearable>
                            </el-input>
                        </el-form-item>
                        <el-form-item>
                            <el-button type="default" @click="handleFilter" icon="el-icon-search">搜 索</el-button>
                        </el-form-item>
                        <el-form-item style="float: right">
                            <el-button @click="handleCreate" type="primary" icon="el-icon-plus">新 增</el-button>
                        </el-form-item>
                    </el-form>
                </template>
                <data-tables
                        :data="userList"
                        :action-col="actionCol"
                        :table-props="tableProps"
                        :pagination-props="{ pageSizes: [5, 10, 15] }"
                        v-loading="listLoading">
                    <el-table-column type="selection" width="55">
                    </el-table-column>
                    <el-table-column v-for="title in titles" :prop="title.prop" :label="title.label" :key="title.label" :width="title.width" >
                    </el-table-column>
<!--                    <el-table-column align="center" label="创建时间" width="160">-->
<!--                        <template slot-scope="scope">-->
<!--                            <span>{{scope.row.createTime | parseTime('{y}-{m}-{d} {h}:{i}')}}</span>-->
<!--                        </template>-->
<!--                    </el-table-column>-->
                    <el-table-column align="center" label="部门" width="120">-->
                                                <template slot-scope="scope">
                                                    <span>{{scope.row.deptName}}</span>
                                                </template>
                                            </el-table-column>

                    <el-table-column align="center" label="权限">
                        <template slot-scope="scope">
                            <el-tag v-for="role in scope.row.roleList"  :key="role.roleId" size="small" :type="role.roleName === '管理员' ? 'primary' : 'success'">{{ role.roleName}}</el-tag>
                        </template>
                    </el-table-column>
                </data-tables>
            <!-- 部门筛选 -->
            <el-dialog :title="textMap[dialogStatus]" :visible.sync="dialogDeptVisible" width="600px">
                <el-tree class="filter-tree" :data="deptTree" :default-checked-keys="checkedKeys" check-strictly node-key="id" highlight-current ref="deptTree" :props="defaultProps" @node-click="getNodeData" default-expand-all>
                </el-tree>
            </el-dialog>
            <!-- 新增或编辑用户弹框 -->
            <el-dialog :title="textMap[dialogStatus]" :visible.sync="dialogFormVisible" width="400px">
                <el-form :model="userForm" :rules="rules" ref="userForm" label-width="100px">
                    <el-form-item label="账号名" prop="username">
                        <el-input v-model="userForm.username" placeholder="请输帐号名 由字母和数字组成"></el-input>
                    </el-form-item>
                    <el-form-item label="用户名" prop="name">
                        <el-input v-model="userForm.name" placeholder="请输用户名"></el-input>
                    </el-form-item>

                    <el-form-item v-if="dialogStatus == 'create'" label="密码" placeholder="请输入密码" prop="newpassword1">
                        <el-input type="password" v-model="userForm.newpassword1"></el-input>
                    </el-form-item>

                    <el-form-item label="所选部门" prop="deptId">
                        <el-input v-model="userForm.deptName" placeholder="选择部门" @focus="handleDept()" readonly></el-input>
                        <input type="hidden" v-model="userForm.deptId" />
                    </el-form-item>

                    <el-form-item label="手机号" prop="phone">
                        <el-input v-model="userForm.phone" placeholder="验证码登录使用"></el-input>
                    </el-form-item>

                    <el-form-item label="邮箱" prop="email">
                        <el-input v-model="userForm.email" placeholder="请输入正确的邮箱地址"></el-input>
                    </el-form-item>

                    <el-form-item label="权限" prop="role">
                        <el-select v-model="userForm.roleList" multiple  filterable placeholder="请选择权限" >
                            <el-option
                                        v-for = "item in rolesOptions"
                                       :key="item.roleId"
                                       :label="`${item.roleName}`"
                                       :value="item.roleId">
                            </el-option>
                        </el-select>
                    </el-form-item>

                </el-form>
                <div slot="footer" class="dialog-footer">
                    <el-button @click="cancel('userForm')" icon="el-icon-close">取 消</el-button>
                    <el-button v-if="dialogStatus=='create'" type="primary" @click="create('userForm')" icon="el-icon-check">确 定</el-button>
                    <el-button v-else type="primary" @click="update('userForm')" icon="el-icon-check">修 改</el-button>
                </div>
            </el-dialog>

        </d2-container>
    </div>

</template>

<script>
import { addObj, delObj, fetchList, putObj } from '@/api/admin/user'
import { deptRoleList } from '@/api/admin/role'
import { fetchTree } from '@/api/admin/dept'


import { mapGetters } from 'vuex'

export default {
  name: 'SysUser',
  data () {
    // 手机号验证
    var checkPhone = (rule, value, callback) => {
      const phoneReg = /^1[3|4|5|6|7|8][0-9]{9}$/
      if (!value) {
        return callback(new Error('电话号码不能为空'))
      }
      setTimeout(() => {

        if (!Number.isInteger(+value)) {
          callback(new Error('请输入数字值'))
        } else {
          if (phoneReg.test(value)) {
            callback()
          } else {
            callback(new Error('电话号码格式不正确'))
          }
        }
      }, 100)
    }
    return {
      searchForm: {},
      titles: [{
        prop: 'userId',
        width: 60,
        label: 'NO.'
      }, {
        prop: 'username',
        label: '账号'
      }, {
        prop: 'name',
        label: '姓名'
      }, {
        prop: 'phone',
        width: 180,
        label: '电话'
      }, {
        prop: 'email',
        width: 180,
        label: '邮箱'
      }],
      tableProps: {
        border: false,
        stripe: false,
        defaultSort: {
          prop: 'userId',
          order: 'ascending'
        }
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
      dialogFormVisible: false,
      dialogDeptVisible: false,
      textMap: {
        update: '编辑用户',
        create: '新增用户'
      },
      dialogStatus: 'create',
      treeDeptData: [],
      checkedKeys: [],
      roleProps: {
        label: 'roleName',
        value: 'roleId'
      },
      defaultProps: {
        label: 'name',
        value: 'id'
      },
      listQuery: {
        page: 1,
        limit: 10
      },
      page: {
        total: 0, // 总页数
        currentPage: 1, // 当前页数
        pageSize: 20, // 每页显示多少条,
        isAsc: false// 是否倒序
      },
      userList: [],
      listLoading: true,
      deptTree: [],
      role: [],
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
        newpassword1: [
          {
            required: true,
            message: '请输入密码',
            trigger: 'blur'
          },
          {
            min: 6,
            max: 20,
            message: '长度在 6 到 20 个字符',
            trigger: 'blur'
          }
        ],
        deptId: [
          {
            required: false,
            message: '请选择部门',
            trigger: 'blur'
          }
        ],
        phone: [
          { required: true, validator: checkPhone, trigger: 'blur' }
        ]
      },
      userForm: {},
      rolesOptions: []
    }
  },
  computed: {
    ...mapGetters(['permissions'])
  },
  watch: {
    role () {
      this.userForm.role = this.role
    }
  },
  created () {
    this.sys_user_add = this.permissions['sys_user_add']
    this.sys_user_edit = this.permissions['sys_user_edit']
    this.sys_user_del = this.permissions['sys_user_del']
    this.init()
  },
  methods: {
    init () {
      this.getList(this.page)
      deptRoleList().then(response => {

        this.rolesOptions = response.data.data
        console.info('role:' + JSON.stringify(this.rolesOptions))
      })
    },
    cancel (formName) {
      this.dialogFormVisible = false
      this.$refs[formName].resetFields()
    },
    handleDept () {
      fetchTree().then(response => {
        this.deptTree = response.data.data
        this.dialogDeptVisible = true
      })
    },
    getNodeData (data) {
      // console.info('role', JSON.stringify(data))
      this.dialogDeptVisible = false
      this.userForm.deptId = data.id
      this.userForm.deptName = data.name
      // console.info('userForm', JSON.stringify(this.userForm))
    },
    nodeClick (data) {
      this.page.page = 1
      this.getList(this.page, { deptId: data.id })
    },
    getList (page, params) {
      this.listLoading = true
      const query = Object.assign({
        current: page.currentPage,
        size: page.pageSize
      }, params, this.searchForm)
      console.info('query:' + JSON.stringify(query))
      fetchList(Object.assign({
        current: page.currentPage,
        size: page.pageSize
      }, params, this.searchForm)).then(response => {
        this.userList = response.data.data.records
        this.page.total = response.data.data.total
        this.listLoading = false
        // console.info('userList', JSON.stringify(this.userList))
      })
    },
    handleFilter (param) {
      this.searchForm = param
      this.getList(this.page, param)
    },
    handleRefreshChange () {
      this.getList(this.page)
    },
    handleCreate () {
      this.userForm = {}
      this.dialogFormVisible = true
    },
    handleOpenBefore (show, type) {
      window.boxType = type
      this.handleDept()
      if (['edit', 'views'].includes(type)) {
        this.role = []
        for (var i = 0; i < this.userForm.roleList.length; i++) {
          this.role[i] = this.userForm.roleList[i].roleId
        }
        deptRoleList().then(response => {
          this.rolesOptions = response.data.data
        })
      } else if (type === 'add') {
        this.role = []
      }
      show()
    },
    handleUpdate (row) {
      // console.log(row)

      this.userForm = row
      this.userForm.roleList = row.roleList
      this.dialogFormVisible = true
      this.dialogStatus = 'update'

    },
    create (row) {
      // console.log(this.form)
      if (this.userForm.phone.indexOf('*') > 0) {
        this.userForm.phone = undefined
      }

      if (this.userForm.email === null || this.userForm.email === '') {
        this.userForm.email = this.userForm.username + '@etek.com.cn'
      }

      this.userForm.role = this.userForm.roleList
      this.userForm.password = this.userForm.newpassword1
      // delete this.form.role
      console.log('userform', this.userForm)
      addObj(this.userForm).then(() => {
        this.getList(this.page)
        this.dialogFormVisible = false
        this.$notify({
          title: '成功',
          message: '创建成功',
          type: 'success',
          duration: 2000
        })
      }).catch(e => {
        this.$notify({
          title: '失败',
          message: '失败:' + e,
          type: 'danger',
          duration: 2000
        })
      })
    },
    update (row, index, done, loading) {

      if (this.userForm.phone === undefined || this.userForm.phone.indexOf('*') > 0) {
        this.userForm.phone = undefined
      }
      // const role = []
      // for (const value of this.userForm.roleList) {
      //   role.push(value.roleId)
      // }
      if (this.userForm.email === null || this.userForm.email === '') {
        this.userForm.email = this.userForm.username + '@etek.com.cn'
      }
      this.userForm.role = this.userForm.roleList
      console.info('userform:' + JSON.stringify(this.userForm))
      putObj(this.userForm).then(() => {
        this.getList(this.page)
        done()
        this.$notify({
          title: '成功',
          message: '修改成功',
          type: 'success',
          duration: 2000
        })
      }).catch(e => {
        this.$notify({
          title: '失败',
          message: '失败' + e,
          type: 'error',
          duration: 2000
        })
      })
    },
    deletes (row, index) {
      this.$confirm(
        '此操作将永久删除该用户(用户名:' + row.username + '), 是否继续?',
        '提示',
        {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }
      ).then(() => {
        delObj(row.userId)
          .then(() => {
            this.list.splice(index, 1)
            this.$notify({
              title: '成功',
              message: '删除成功',
              type: 'success',
              duration: 2000
            })
          })
          .cache(() => {
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
<style lang="scss">
    .user_manager {
        height: 100%;

    }
</style>

