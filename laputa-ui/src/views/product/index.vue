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
    <div class="product_manager">
        <d2-container>
                <template slot="header">
                    <el-form
                            :inline="true"
                            :model="listQuery"
                            size="mini"
                            style="margin-bottom: -18px;">
                        <el-form-item label="产品名" prop="username">
                            <el-input @keyup.enter.native="handleFilter" style="width: 200px;" placeholder="产品名" v-model="listQuery.username" clearable>
                            </el-input>
                        </el-form-item>
                        <el-form-item label="产品线" prop="username">
                            <el-select v-model="listQuery.classified" placeholder="产品线">
                                <el-option label="LED/LCD驱动产品" value="lcd"></el-option>
                                <el-option label="高压OVP保护器件" value="ovp"></el-option>
                            </el-select>
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
                        :data="productList"
                        :action-col="actionCol"
                        :table-props="tableProps"
                        :pagination-props="{ pageSizes: [10, 15, 20] }"
                        v-loading="listLoading">
                    <el-table-column type="selection" width="55">
                    </el-table-column>
                    <el-table-column align="center" label="产品名">
                        <template slot-scope="scope">
                            {{scope.row.name}}
                        </template>
                    </el-table-column>
                    <el-table-column align="center" label="描述" :show-overflow-tooltip="true">
                        <template slot-scope="scope">
                            {{scope.row.description}}
                        </template>
                    </el-table-column>
                    <el-table-column align="center" label="产品线">
                        <template slot-scope="scope">
                            {{scope.row.classified }}
                        </template>
                    </el-table-column>
                    <el-table-column align="center" label="产品经理">
                        <template slot-scope="scope">
                            {{scope.row.manager}}
                        </template>
                    </el-table-column>
<!--                    <el-table-column align="center" label="权限">-->
<!--                        <template slot-scope="scope">-->
<!--                            <el-tag v-for="role in scope.row.roleList"  :key="role.roleId" size="small" :type=getLabelType(role.roleName)>{{ role.roleName}}</el-tag>-->
<!--                        </template>-->
<!--                    </el-table-column>-->
                </data-tables>

            <!-- 新增或编辑用户弹框 -->
            <el-dialog :title="textMap[dialogStatus]" :visible.sync="dialogFormVisible" width="400px">
                <tree-transfer :title="title" :from_data='fromData' :to_data='toData' :defaultProps="{label:'label'}" :mode='mode' height='540px' filter openAll>
                </tree-transfer>
                <div slot="footer" class="dialog-footer">
                    <el-button @click="cancel('form')" icon="el-icon-close">取 消</el-button>
                    <el-button v-if="dialogStatus=='create'" type="primary" @click="create('form')" icon="el-icon-check">确 定</el-button>
                    <el-button v-else type="primary" @click="update('form')" icon="el-icon-check">修 改</el-button>
                </div>
            </el-dialog>
            <el-popover
                    placement="top"
                    width="180"
                    trigger="hover">
                <div style="margin: 0">
                    <el-button size="mini" type="primary" >新增</el-button>
                    <el-button type="primary" size="mini" >编辑</el-button>
                    <el-button type="primary" size="mini" >删除</el-button>
                </div>
<!--                <div class="avat" slot="reference">-->
<!--                    {{productList}}-->
<!--                </div>-->
            </el-popover>

        </d2-container>

    </div>

</template>

<script>
import { getAll } from '@/api/product/product'
import treeTransfer from 'el-tree-transfer' // 引入


import { mapGetters } from 'vuex'

export default {
  name: 'groupIndex',
  components: { treeTransfer }, // 注册
  data () {

    return {
      visible: false,
      searchForm: {},
      titles: [{
        prop: 'userId',
        width: 40,
        label: '序号'
      }, {
        prop: 'name',
        label: '姓名'
      }, {
        prop: 'phone',
        label: '电话'
      }],
      tableProps: {
        border: false,
        stripe: false

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
            icon: 'el-icon-s-unfold',
            type: 'success'
          },
          handler: row => {
            this.handleUpdate(row)
          },
          label: '结构'
        }, {
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
        update: '编辑用户组',
        create: '新增用户组'
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
        name: 'good',
        classified: '功率器件',
        page: 1,
        limit: 10
      },
      page: {
        total: 0, // 总页数
        currentPage: 1, // 当前页数
        pageSize: 20, // 每页显示多少条,
        isAsc: false// 是否倒序
      },
      productList: [],
      listLoading: true,
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

        deptId: [
          {
            required: true,
            message: '请选择部门',
            trigger: 'blur'
          }
        ],
        phone: [
          { required: true, trigger: 'blur' }
        ],
        email: [
          { required: true, message: '请输入邮箱地址', trigger: 'blur' },
          { type: 'email', message: '请输入正确的邮箱地址', trigger: 'blur' }
        ]
      },
      userForm: {},
      title: '组名',
      mode: 'transfer', // transfer addressList
      fromData: [
        {
          id: '1',
          pid: 0,
          label: '设计所',
          children: [
            {
              id: '1-1',
              pid: '1',
              label: '模拟组',
              disabled: true,
              children: []
            },
            {
              id: '1-2',
              pid: '1',
              label: '芯片组',
              children: [
                {
                  id: '1-2-1',
                  pid: '1-2',
                  children: [],
                  label: '朱自强'
                },
                {
                  id: '1-2-2',
                  pid: '1-2',
                  children: [],
                  label: '杨煜名'
                }
              ]
            }
          ]
        }
      ],
      toData: []
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

    this.init()
  },
  methods: {
    init () {
      // this.getList(this.page)
      this.getAll()
    },
    cancel (formName) {
      this.dialogFormVisible = false
      this.$refs[formName].resetFields()
    },
    getLabelType (roleName) {
      if (roleName === '管理员') {
        return 'danger'
      } else if (roleName === '默认角色') {
        return 'primary'
      } else {
        return 'success'
      }

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

    getAll () {
      getAll().then(response => {
        console.info('getall:' + JSON.stringify(response))
        this.productList = response.data
        this.page.total = 1
        this.listLoading = false
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

      } else if (type === 'add') {
        this.role = []
      }
      show()
    },
    handleUpdate (row) {
      console.log(row)

      this.userForm = row
      this.userForm.role = row.roleList
      this.dialogFormVisible = true
      this.dialogStatus = 'update'

    },
    create (row) {

      // delete this.form.role
      console.log('userform', this.userForm)

    },
    update (row, index, done, loading) {
      if (this.userForm.phone && this.userForm.phone.indexOf('*') > 0) {
        this.userForm.phone = undefined
      }

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
    .product_manager {
        height: 100%;

    }
</style>

