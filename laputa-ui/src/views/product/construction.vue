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
    <d2-container>
        <template slot="header">
            <el-form
                    :inline="true"
                    :model="listQuery"
                    size="mini"
                    style="margin-bottom: -18px;">
                <el-form-item label="ET9818结构图" prop="username">
                    <el-input @keyup.enter.native="handleFilter" style="width: 200px;" placeholder="部件名" v-model="listQuery.username" clearable>
                    </el-input>
                </el-form-item>

                <el-form-item>
                    <el-button type="default" @click="search" icon="el-icon-search">搜 索</el-button>
                </el-form-item>
                <el-form-item style="float: right">
                    <el-button @click="handleCreate" type="primary" icon="el-icon-plus">新增</el-button>
                </el-form-item>
            </el-form>
        </template>
    <div class="statistics common-content">
        <el-table :data="productList" border style="width: 100%;" size="medium" :row-class-name="rowClassNameHandler">
            <el-table-column label="部件名称" width="460" align="left" show-overflow-tooltip>
                <template slot-scope="scope">
                    <span :style="{marginLeft: scope.row.level * 20 + 'px'}">&ensp;</span>
                    <template v-if="scope.row.showChildren"  >
                        <svg v-if="scope.row.hasChildren" class="doc-icon" aria-hidden="true" @click="onExpand(scope.row)">
                            <use xlink:href="#icon-folder-open"></use>
                        </svg>
                        <svg v-else class="doc-icon" aria-hidden="true" >
                            <use :xlink:href="scope.row.doc | docTypeFilter"></use>
                        </svg>
<!--                    <i  :class="{'iconfont icon-folder-open':scope.row.showChildren, 'iconfont icon-txt':!scope.row.hasChildren}" @click="onExpand(scope.row)" :style="{cursor:scope.row.hasChildren ? 'pointer' : 'normal'}"></i>-->
                    </template>
                    <template v-else >
                        <svg v-if="scope.row.hasChildren" class="doc-icon" aria-hidden="true" @click="onExpand(scope.row)">
                            <use v-if="scope.row.isLocked" xlink:href="#icon-folder-locked"></use>
                            <use v-else-if="scope.row.isUser" xlink:href="#icon-folder-personal"></use>
                            <use v-else-if="scope.row.isShare" xlink:href="#icon-folder-share"></use>
                            <use v-else xlink:href="#icon-folder"></use>
                        </svg>
                        <svg v-else class="doc-icon" aria-hidden="true" >
                            <use :xlink:href="scope.row.doc | docTypeFilter"></use>
                        </svg>
                        <!--                    <i  :class="{'iconfont icon-folder-open':scope.row.showChildren, 'iconfont icon-txt':!scope.row.hasChildren}" @click="onExpand(scope.row)" :style="{cursor:scope.row.hasChildren ? 'pointer' : 'normal'}"></i>-->
                    </template>

                    <span :data-level="scope.row.level" :style="{marginLeft: 4 + 'px'}" @click="onExpand(scope.row)">{{ scope.row.nodeName }}</span>
                </template>
            </el-table-column>
            <el-table-column  prop="file" label="文档数" align="center"></el-table-column>

            <el-table-column  prop="desc" :show-overflow-tooltip="true" label="描述" align="center"></el-table-column>
            <el-table-column width="120" prop="createTime" label="创建时间" align="center"></el-table-column>
            <el-table-column width="120" prop="createUser" label="负责人" align="center"></el-table-column>
        </el-table>
    </div>
    </d2-container>
</template>

<script>
import { getTree } from '@/api/product/product'



export default {
  name: 'groupIndex',
  components: { },
  data () {

    return {
      listQuery: {
        name: 'good',
        classified: '功率器件',
        page: 1,
        limit: 10
      },
      productList: [],
      pastDays: 0
    }
  },
  mounted () {
    const self = this
    self.loadStatisticData()
  },
  filters: {
    docTypeFilter (status) {
      const statusMap = {
        'video': '#icon-video',
        'html': '#icon-html',
        'mp3': '#icon-mp',
        'pcb': '#icon-pcb',
        'cad': '#icon-cad',
        'zip': '#icon-zip',
        'psd': '#icon-psds',
        'pdf': '#icon-PDFs',
        'ai': '#icon-ais',
        'jpg': '#icon-JPGs',
        'doc': '#icon-DOCs',
        'xlsx': '#icon-ELXs',
        'ppt': '#icon-PPTs',
        'txt': '#icon-TXTs',
        'vsd': '#icon-VSDs',
        'dwg': '#icon-DWGs',
        'xmap': '#icon-XMAPs',
        'xls': '#icon-ELXs'
      }
      if (status === undefined || status === '') {
        return '#icon-white'
      }
      return statusMap[status]
    }
  },
  methods: {
    _processLevelStatisticData (originArray) {
      const self = this

      const resultArray = [] // 一级栏目
      const level = 1
      for (let i = 0; i < originArray.length; i++) {
        const item = originArray[i]
        // 查找一级分类
        if (item.parentId === 0) {
          item['level'] = level
          resultArray.push(item)
          self._loadChildrenData(resultArray, originArray, item, level + 1)
        }
      }
      return resultArray
    },

    _loadChildrenData (resultArray, originArray, item, level) {
      const self = this

      let file = item.file
      console.log(' enter item:' + item.nodeName + 'file:' + item.file)
      // item 当前目录节点
      for (let i = 0; i < originArray.length; i++) {
        const originItem = originArray[i]
        // 判断是否是item项的子项
        if (originItem.parentId === item.id) {
          item['hasChildren'] = true
          item['showChildren'] = false

          originItem['level'] = level
          originItem['visible'] = false // 子项默认隐藏
          originItem['hiddenByCategory'] = false

          resultArray.push(originItem)
          self._loadChildrenData(
            resultArray,
            originArray,
            originItem,
            level + 1
          )

          // 应该放在统计完子类数据之后
          if (originItem.file === 0) {
            file += 1
          } else {
            file += originItem.file
          }


        }
      }
      if (item.doc === 'folder' && item.hasChildren === undefined) {
        item['hasChildren'] = true
        item['showChildren'] = false
        console.log('folder item:' + item.nodeName + 'file:' + item.file)
      }
      // 计算子栏目统计合计

      item.file += file
      console.log('out item:' + item.nodeName + 'file:' + item.file)
    },

    search () {
      console.log(this.pastDays)
      this.loadStatisticData()
    },

    loadStatisticData () {
      const self = this
      const params = {
        pastDays: self.pastDays
      }
      getTree(params).then(function (response) {
        const result = response.data
        const resultArray = self._processLevelStatisticData(result)
        self.productList = resultArray
      })
    },

    rowClassNameHandler ({ row, rowIndex }) {
      // console.log(row['visible'])
      let className = 'pid-' + row.parentId
      if (
        row.parentId !== 0 &&
        (row['visible'] !== true || row['hiddenByCategory'] === true)
      ) {
        className += ' hiddenRow'
      }
      return className
    },

    onExpand (row) {
      const self = this

      const isShowChildren = !row['showChildren']
      row['showChildren'] = isShowChildren
      self._loadAllSubItems(row, true, isShowChildren)
    },

    _loadAllSubItems (item, isFirstLevlChildren, isShowChilren) {
      const self = this
      let dataArray = []
      for (let i = 0; i < self.productList.length; i++) {
        const tempItem = self.productList[i]
        if (tempItem.parentId === item.id) {
          if (isFirstLevlChildren) {
            tempItem['visible'] = !tempItem['visible']
          }
          tempItem['hiddenByCategory'] = !isShowChilren

          dataArray.push(tempItem)
          const subItemArray = self._loadAllSubItems(
            tempItem,
            false,
            isShowChilren
          )
          dataArray = dataArray.concat(subItemArray)
        }
      }
      return dataArray
    },
    handleCreate () {

    }
  }
}
</script>
<style lang="scss">
    .statistics {
        padding: 10px;

        .hiddenRow {
            display: none;
        }

        .doc-icon {
            width: 1.5em;
            height: 1.5em;
            vertical-align: -0.15em;
            fill: currentColor;
            overflow: hidden;
        }
    }
</style>

