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
                <el-steps :active="active" simple>
                    <el-step title="创建组员" icon="el-icon-users"></el-step>
                    <el-step title="创建任务" icon="el-icon-tickets"></el-step>
                    <el-step title="资源调配" icon="el-icon-upload"></el-step>
                    <el-step title="设置流程" icon="el-icon-upload"></el-step>
                    <el-step title="执行项目" icon="el-icon-picture"></el-step>
                </el-steps>
            </template>

            <el-form>
                <el-button @click="cancel('form')" icon="el-icon-close"></el-button>
                <el-button v-if="dialogStatus=='create'" type="primary" @click="create('form')" icon="el-icon-check"></el-button>
                <el-button v-else type="primary" @click="update('form')" icon="el-icon-check"></el-button>
            </el-form>
            <!-- 新增或编辑用户弹框 -->
            <el-dialog :title="textMap[dialogStatus]" :visible.sync="dialogFormVisible" width="400px">
                <tree-transfer :title="title" :from_data='fromData' :to_data='toData' :defaultProps="{label:'label'}" :mode='mode' height='540px' filter openAll>
                </tree-transfer>
                <div slot="footer" class="dialog-footer">
                    <el-button @click="cancel('form')" icon="el-icon-close"></el-button>
                    <el-button v-if="dialogStatus=='create'" type="primary" @click="create('form')" icon="el-icon-check"></el-button>
                    <el-button v-else type="primary" @click="update('form')" icon="el-icon-check"></el-button>
                </div>
            </el-dialog>

        </d2-container>
    </div>

</template>

<script>
import { addObj, delObj, fetchList, putObj, getAll } from '@/api/project/project'
import treeTransfer from 'el-tree-transfer' // 引入


import { mapGetters } from 'vuex'

export default {
  name: 'groupIndex',
  components: { treeTransfer }, // 注册
  data () {
    return {
      active: 1,
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
            icon: 'el-icon-edit',
            type: 'primary'
          },
          handler: row => {
            this.handleUpdate(row)
          }
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
          }
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
        page: 1,
        limit: 10
      },
      page: {
        total: 0, // 总页数
        currentPage: 1, // 当前页数
        pageSize: 20, // 每页显示多少条,
        isAsc: false// 是否倒序
      },
      groupList: [],
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
    getLabelType (status) {
      if (status === '延误中') {
        return 'danger'
      } else if (status === '进行中') {
        return 'primary'
      } else if (status === '已暂停') {
        return 'warning'
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
    getList (page, params) {
      this.listLoading = true
      fetchList(Object.assign({
        current: page.currentPage,
        size: page.pageSize
      }, params, this.searchForm)).then(response => {
        this.groupList = response.data.data.records
        this.page.total = response.data.data.total
        this.listLoading = false
        // console.info('userList', JSON.stringify(this.userList))
      })
    },
    getAll () {
      getAll().then(response => {
        console.info('getall:' + JSON.stringify(response))
        this.groupList = response.data
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
      if (this.userForm.phone && this.userForm.phone.indexOf('*') > 0) {
        this.userForm.phone = undefined
      }
      putObj(this.userForm).then(() => {
        this.getList(this.page)
        done()
        this.$notify({
          title: '成功',
          message: '修改成功',
          type: 'success',
          duration: 2000
        })
      }).catch(() => {
        loading()
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

