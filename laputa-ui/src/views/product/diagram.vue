<template>
    <div class="product_manager statistics common-content" >
        <d2-container>
            <template slot="header">

                <el-form
                        :inline="true"
                        size="mini"
                        style="margin-bottom: -18px;">
                    <el-form-item label="产品文档" prop="productName">
                        <el-input  style="width: 200px;" placeholder="产品文档" clearable>
                        </el-input>
                    </el-form-item>
                    <el-form-item>
                        <el-button type="default"  icon="el-icon-search">搜 索</el-button>
                    </el-form-item>
                    <el-form-item style="float: right">
                        <el-button type="primary" icon="el-icon-plus">新增文件</el-button>
                    </el-form-item>
                </el-form>
                <span :style="{marginLeft: 10* 23 + 'px'}">&ensp;</span><br/>
                <span :style="{marginLeft: 10 + 'px'}">产品名: PR190301-ET9801</span>
            </template>

        <el-table
                :data="tableData"
                style="width: 100%;margin-bottom: 20px;border:1px solid #EBEEF5; border-color: #868686"
                row-key="id"
                border
                fit
                default-expand-all
                :tree-props="{children: 'children', hasChildren: 'hasChildren'}">
            <el-table-column
                    prop="name"
                    label="文件"
                    width="360">
                <template slot-scope="scope">
                    <span :style="{marginLeft: scope.row.level * 1 + 'px'}">&ensp;</span>
<!--                    <img src="/image/filetype/file_type_folder.png" alt="" width="20px" height="20px">-->
                    <img v-if="scope.row" :src=fileTypeIcon(scope.row) alt="" width="20px" height="20px">
<!--                    <i v-if="scope.row.showChildren" :class="{'fa fa-folder-open':scope.row.showChildren, 'fa fa-file-o':!scope.row.hasChildren}" @click="onExpand(scope.row)" :style="{cursor:scope.row.hasChildren ? 'pointer' : 'normal'}"></i>-->
<!--                    <i v-else :class="{'fa fa-folder':scope.row.hasChildren, 'fa fa-file-o':!scope.row.hasChildren}" @click="onExpand(scope.row)" :style="{cursor:scope.row.hasChildren ? 'pointer' : 'normal'}"></i>-->
                    <a  href="#" target="_blank" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">{{ scope.row.name }}</a>

                </template>
            </el-table-column>
            <el-table-column
                    prop="username"
                    label="创建人"
                    align="center"
                    width="180">
            </el-table-column>
            <el-table-column
                    prop="description"
                    align="center"
                    label="描述">
            </el-table-column>
            <el-table-column label="操作" width="250">
                <template v-if="scope.row.type==0" slot-scope="scope">
                    <el-button
                            @click="handleClick(scope.row)"
                            type="success"
                            size="mini"

                    >预览</el-button>
                    <el-button
                            @click="handleClick(scope.row)"
                            type="primary"
                            size="mini"

                    >编辑</el-button>
                    <el-button
                            @click="downloadImg(scope.row)"
                            type="danger"
                            size="mini"

                    >删除</el-button>
                </template>
            </el-table-column>
        </el-table>

        </d2-container>
    </div>
</template>
<script>
export default {
  data () {
    return {
      tableData: [{
        id: 1,
        type: 1,
        level: 1,
        suffix: 'sim',
        children: [{
          id: 11,
          code: 'ET190331-SIM190331',
          type: 0,
          name: 'ET9801-SIM190331-785012.sim',
          suffix: 'sim',
          username: '伍旻',
          description: 'ET8901 总时序电路模拟数据'
        }, {
          id: 12,
          type: 0,
          name: 'ET9801-SIM190506-543543.sim',
          suffix: 'sim',
          username: '余卫光',
          description: 'ET8901 LIGHT模块模拟数据'
        }, {
          id: 12,
          type: 0,
          name: 'ET9801-SIM190521-985245.sim',
          suffix: 'sim',
          username: '袁广睿',
          description: 'ET8901 USB模块模拟数据'
        }
        ],
        name: '模拟数据文档'
      }, {
        id: 2,
        name: '设计单元库',
        type: 1,
        level: 1,
        suffix: 'folder_schlib',
        children: [{
          id: 31,
          type: 0,
          name: 'mosc02',
          suffix: 'schlib',
          username: '',
          description: '上海市普陀区金沙江路 1519 弄'
        }, {
          id: 32,
          type: 0,
          name: 'mosc01',
          suffix: 'schlib',
          username: '',

          description: '上海市普陀区金沙江路 1519 弄'
        }]

      }, {
        id: 3,
        name: '版图文档',
        type: 1,
        suffix: 'folder_pcb',
        children: [{
          id: 31,
          type: 0,
          name: 'ET9801-PC190410-100010.gds2',
          suffix: 'pcb',
          username: '陆小杰',
          description: '测试版本'
        }, {
          id: 32,
          type: 0,
          name: 'ET9801-PC191001-100010.gds2',
          suffix: 'pcb',
          username: '陆小杰',

          description: '基于第一测试版本后添加了多路滤波'
        }]
      }, {
        id: 4,
        name: 'IP文件库',
        suffix: 'ip',
        description: 'IP核文件',
        children: [{
          id: 41,
          type: 0,
          name: 'QFN64',
          suffix: 'package',
          username: '王剑',
          description: '方形扁平无引脚封装 表面贴装型封装 64脚 14mm×14mm'
        }, {
          id: 42,
          type: 0,
          name: 'QFN32',
          suffix: 'package',
          username: '王剑',
          description: '方形扁平无引脚封装 表面贴装型封装 32脚 12mm×12mm'
        }]
      }, {
        id: 5,
        name: '封装库',
        type: 1,
        suffix: 'folder_package',
        description: '产品封装信息',
        children: [{
          id: 51,
          type: 0,
          name: 'QFN64',
          suffix: 'package',
          username: '王剑',
          description: '方形扁平无引脚封装 表面贴装型封装 64脚 14mm×14mm'
        }, {
          id: 52,
          type: 0,
          name: 'QFN32',
          suffix: 'package',
          username: '王剑',
          description: '方形扁平无引脚封装 表面贴装型封装 32脚 12mm×12mm'
        }]
      }
      ]
    }
  },
  methods: {
    handleClick (row) {

    },
    downloadImg (row) {

    },
    fileTypeIcon (row) {
      // console.info('row:' + JSON.stringify(row))
      let _path = ''
      // console.info('folder:' + JSON.stringify(this.selfIsFolder))

      // 其他根据后缀类型
      const _suffix = row.suffix
      if (!_suffix) {
        _path = '/image/filetype/file_type_folder.png'
        return _path
      }
      if (['jpg', 'jpeg', 'png', 'gif', 'bmp'].includes(_suffix)) { // 图片
        _path = '/image/filetype/file_type_jpg.png'
      } else if (['zip', 'rar', '7z'].includes(_suffix)) {
        _path = '/image/filetype/file_type_zip.png'
      } else if (['avi', 'mp4', 'rmvb', 'flv', 'mov', 'm2v', 'mkv'].includes(_suffix)) {
        _path = '/image/filetype/file_type_mov.png'
      } else if (['mp3', 'wav', 'wmv', 'wma'].includes(_suffix)) {
        _path = '/image/filetype/file_type_mp3.png'
      } else if (['xls', 'xlsx'].includes(_suffix)) {
        _path = '/image/filetype/file_type_xls.png'
      } else if (['doc', 'docx'].includes(_suffix)) {
        _path = '/image/filetype/file_type_doc.png'
      } else if (_suffix === 'pdf') {
        _path = '/image/filetype/file_type_pdf.png'
      } else if (_suffix === 'ppt') {
        _path = '/image/filetype/file_type_ppt.png'
      } else if (_suffix === 'txt') {
        _path = '/image/filetype/file_type_txt.png'
      } else if (_suffix === 'sch') {
        _path = '/image/filetype/schematic.png'
      } else if (_suffix === 'ip') {
        _path = '/image/filetype/altium-undefined-contenttype-48x48.png'
      } else if (_suffix === 'sim') {
        _path = '/image/filetype/altium-simulation-model-32x32.png'
      } else if (_suffix === 'folder_schlib') {
        _path = '/image/filetype/altium-symbol-library-32x32.png'
      } else if (_suffix === 'folder_package') {
        _path = '/image/filetype/altium-pcb-component-library-32x32.png'
      } else if (_suffix === 'package') {
        _path = '/image/filetype/altium-pcb-component-48x48.png'
      } else if (_suffix === 'schlib') {
        _path = '/image/filetype/altium-symbol-48x48.png'
      } else if (_suffix === 'folder_pcb') {
        _path = '/image/filetype/altium-3d-library-32x32.png'
      } else if (_suffix === 'pcb') {
        _path = '/image/filetype/altium-pcb-document-48x48.png'
      } else {
        _path = '/image/filetype/file_type_unknown.png'
      }
      return _path
    }

  }
}
</script>
<style >

</style>
