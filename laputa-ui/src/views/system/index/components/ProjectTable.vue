<template>
  <el-table :data="list" style="width: 100%;padding-top: 15px;">
    <el-table-column label="项目名称" min-width="200">
      <template slot-scope="scope">
        {{ scope.row.name | orderNoFilter }}
      </template>
    </el-table-column>

    <el-table-column label="项目状态" width="100" align="center">
      <template slot-scope="{row}">
        <el-tag :type="row.status | statusFilter">
          {{ row.status }}
        </el-tag>
      </template>
    </el-table-column>
  </el-table>
</template>

<script>
// import { transactionList } from '@/api/remote-search'

export default {
  filters: {
    statusFilter (status) {
      const statusMap = {
        完成: 'success',
        进行: 'primate',
        延误: 'danger'
      }
      return statusMap[status]
    },
    orderNoFilter (str) {
      return str.substring(0, 30)
    }
  },
  data () {
    return {
      list: null
    }
  },
  created () {
    this.fetchData()
  },
  methods: {
    fetchData () {
      this.list = [
        {
          name: 'ET6326原理图设计',
          status: '进行'
        },
        {
          name: 'ET6332YD总框图设计',
          status: '进行'
        },
        {
          name: 'ET4007MTC原理图复核',
          status: '完成'
        },
        {
          name: 'ET53328版图复查',
          status: '进行'
        },
        {
          name: 'ET6554版图设计审查',
          status: '延误'
        }
      ]

    }
  }
}
</script>
