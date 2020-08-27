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
<!--  <div class="execution">-->
    <div id="app">

        <DocExplorer
                ref="doc-explorer-cpt"
                :catTreeList="folderTreeList"
                :headerDropdown="headerHandle"
                :columns="file_table_columns"
                :all-path="all_folder_list"
                :is-folder-fn="isFolderFn"
                :folderType="rource_type"
                :data="file_table_data"
                :uploadUrl="uploadUrl"
                :uploadHeaders="uploadHeaders"
                @download="download"
                :props="explorer_prop"
                @search="fileSearch"

        >

        </DocExplorer>

    </div>
<!--  </div>-->
</template>

<script>
import { getHisFileListApi, getFileListApi, getAllFoldersApi } from '@/api/document/file'
import { fileTableColumns } from '@/const/crud/document/doc'
import { handleDown, arrayToTree } from '@/util/util'
import store from '@/store'
import DocExplorer from './DocExplorer'


const apiok = 200

export default {
  name: 'sys-file',
  components: {
    DocExplorer
  },
  data () {
    return {
      uploadUrl: '/doc/doc-file/upload',
      uploadHeaders: {
        'Authorization': 'Bearer ' + store.getters.access_token
      },
      headerHandle: [{ name: '权限', command: 'auth' }], // 头部按钮更多操作-自定义权限
      listLoading: false,
      file_table_columns: fileTableColumns,
      fade: {
        folder: false
      }, // 弹出类视图管理
      file_table_data: [], // 表格数据
      all_folder_list: [], // 所有文件夹列表
      tree_folder_list: [], // 树形文件夹列表
      folderTreeList: [], // 树形文件夹列表
      type: {
        folder: 1,
        img: 2,
        video: 3,
        other: 4,
        doc: 5
      }, // 文件类型
      rource_type: {
        self: 1 // 自建
      }, // 数据来源类型
      load: {
        folder: false
      }, // loading管理

      explorer_prop: {
        name: 'name',
        match: 'name',
        splic: true,
        suffix: 'suffix',
        pathid: 'id',
        pathpid: 'parentid',
        pathname: 'name',
        previewOptions: 'image/logo.png'
      } // 文件管理器配置项
    }
  },
  created () {
    this.getFileList()
    this.getHisFileList()
    this.getAllFolders()
  },
  mounted () {

  },
  methods: {
    // 获取文件夹列表
    getFileList () {
      getFileListApi().then(({ data }) => {

        if (data.code === apiok) {
          this.file_table_data = data.data || []
          // console.info('file_table_data:' + JSON.stringify(this.file_table_data))
        }
      })
    },
    getAllFolders () {
      getAllFoldersApi().then(({ data }) => {

        if (data.code === apiok) {
          this.folderTreeList = data.data || []
          // console.info('file_table_data:' + JSON.stringify(this.file_table_data))
        }
      })
    },
    getHisFileList () {
      getHisFileListApi().then(({ data }) => {
        // console.info('getAllFolders:' + JSON.stringify(data))
        if (data.code === apiok) {
          this.all_folder_list = data.data || []
          const _list = [...this.all_folder_list]
          const options = {
            id: this.explorer_prop.pathid,
            pid: this.explorer_prop.pathpid,
            children: 'children'
          }
          this.tree_folder_list = arrayToTree(_list, options)
          // console.info('tree_folder_list:' + JSON.stringify(this.tree_folder_list))
        }
      })
    },
    // 判断是否文件夹函数
    isFolderFn (row) {
      return row.type === this.type.folder
    },
    /**
     * 根据关键词搜索文件
     * file: Object 文件属性
     * update: Boolean 数据是否需要更新（不需要表示已存在）
     */
    fileSearch (file, update) {
      if (update) {
        this.path = file
        this.getFileList()
      }
    },
    /**
     * 编辑文件夹
     * act:Object 当前选中文件夹
     * type:String 操作类型 add添加edit编辑
     * file:Object 当前路径信息
     */
    handleFolder (act, type, file) {
      this.path = file
      this.fade.folder = true
      if (type === 'add') {
        // this.$refs['folder_form'].resetFields()
        this.folder_form.id = ''
        this.folder_form.parentid = file.id
        return
      }
      this.child_act_saved = act
    },
    /**
       * 搜索回调
       */
    searchChange (form) {
      this.getList(this.page, form)
    },
    /**
       * 刷新回调
       */
    refreshChange (form) {
      this.searchForm = form
      this.getList(this.page)
    },
    download: function (row, action) {
      console.info('download row:' + JSON.stringify(row))
      handleDown(row.fileName, row.bucket, row.name)
    }
  }
}
</script>

<style lang="scss" scoped>
    .el-table th.gutter{
        display: table-cell!important;
    }
</style>

