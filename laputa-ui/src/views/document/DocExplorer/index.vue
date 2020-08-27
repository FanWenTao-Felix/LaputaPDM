<template>
  <!-- 文件管理器 -->
  <d2-container>
  <div class="doc-explorer">


    <!--文件路径操作区-->
    <el-form :inline="true" size="medium" :model="file" class="doc-header-file" @submit.native.prevent>
<!--      <el-form-item class="file-path-box">-->
<!--        <div class="file-path-text" v-show="!layout.edit_path" @click="handleFilePath">-->
<!--          <img class="file-path-img" src="./images/folder@3x.png" alt="文件夹" title="文件夹">-->
<!--          {{file.path}}-->
<!--        </div>-->
<!--        <el-autocomplete-->
<!--                class="u-full"-->
<!--                ref="file-path-ipt"-->
<!--                placeholder="请输入文件路径"-->
<!--                v-model="file.path"-->
<!--                v-if="layout.edit_path"-->
<!--                @keyup.enter.native="filePathChange"-->
<!--                @select="filePathChange"-->
<!--                :fetch-suggestions="pathQuerySearch">-->
<!--          <img slot="prefix" class="file-path-img" src="./images/folder@3x.png" alt="文件夹" title="文件夹">-->
<!--        </el-autocomplete>-->
<!--      </el-form-item>-->
      <el-form-item class="file-search-box" >
        <el-input v-model="file.key" placeholder="请输入关键字搜索" @keyup.enter.native="fileSearch()">
          <el-button slot="append" icon="el-icon-search file-search" @click="fileSearch()"></el-button>
        </el-input>
      </el-form-item>
      <el-form-item >
        <svg class="toolbar-icon" aria-hidden="true" @click="handleFolder('add')">
          <use xlink:href="#icon-jurassic_add-form"></use>
        </svg>

        <svg class="toolbar-icon" aria-hidden="true" @click="handleFolder('edit')">
          <use xlink:href="#icon-jurassic_add-mulu"></use>
        </svg>

        <svg class="toolbar-icon" aria-hidden="true" @click="handleDel">
          <use xlink:href="#icon-jurassic_cancle-pandian"></use>
        </svg>

        <svg class="toolbar-icon" aria-hidden="true" @click="showUpload">
          <use xlink:href="#icon-jurassic_upload-content"></use>
        </svg>

      </el-form-item>
      <el-form-item class="file-handle-box" >
        <i
                class="iconfont icon-jiantou-left file-path-handle"
                :class="{'u-disabled':pathIsStart}"
                @click="pathBtn('prv')"></i>
        <i
                class="iconfont icon-solidt file-path-handle"
                :class="{'u-disabled':pathIsEnd}"
                @click="pathBtn('next')"></i>
        <i
                class="iconfont icon-jiantou file-path-handle"
                :class="{'u-disabled':path.level===1}"
                @click="pathBtn('top')"></i>
      </el-form-item>
      <el-form-item class="u-right">
        <i
                class="iconfont icon-list file-show-type"
                v-show="layout.show_list"
                @click="layout.show_list=!layout.show_list"></i>
        <i
                class="iconfont icon-grid file-show-type"
                v-show="!layout.show_list"
                @click="layout.show_list=!layout.show_list"></i>
      </el-form-item>
    </el-form>
    <!-- 主内容区 -->
<!--    <el-container-->
<!--            style="margin-top: 15px;"-->
<!--    >-->
      <!-- 目录区 -->
<!--      <el-aside-->
<!--              width="200px"-->
<!--              style=" border: 1px solid gray;">-->
<!--        <el-tree-->
<!--                style="padding: 10px"-->
<!--                :default-expanded-all="true"-->
<!--                :data="catTreeList"-->
<!--                :props="defaultProps"-->
<!--                node-key="id"-->
<!--                @node-contextmenu="menuRightClick"-->
<!--        >-->
<!--            <span class="custom-tree-node" slot-scope="{ node, data }">-->
<!--            <span :dataType="data.type">-->
<!--                 <img class="file-path-img" src="./images/folder.png"/>-->
<!--             {{ node.label }}-->
<!--            </span>-->
<!--            </span>-->

<!--        </el-tree>-->
<!--      </el-aside>-->
      <!-- 文档区 -->
<!--      <el-main style=" border: 1px solid gray;">-->
<!--        <el-scrollbar class="doc-main-scroll">-->
          <!-- 文件列表区 -->
          <div class="doc-main-list">
            <!-- 表格型文件列表 -->
            <el-table
                    height="650"
                    v-show="layout.show_list"
                    @selection-change="fileChecked"
                    @row-contextmenu="rightClick"
                    highlight-current-row
                    :border="showBorder"
                    :data="self_data"
                    class="doc-table"
                    ref="doc-table"
            >
              <el-table-column
                      v-if="showCheckbox"
                      align="center"
                      type="selection"
                      width="55">
              </el-table-column>
              <el-table-column
                      v-if="showIndex"
                      align="center"
                      type="index"
                      label="指示"
                      width="100">
                <template slot-scope="scope">

                  <svg class="column-icon"  v-if="scope.row.isAudit" aria-hidden="true" >
                    <use xlink:href="#icon-shenhe"></use>
                  </svg>
                 <svg class="column-icon"  v-if="scope.row.isLock" aria-hidden="true" >
                    <use xlink:href="#icon-suozhu"></use>
                  </svg>
                  <svg class="column-icon"  v-if="scope.row.isCheckout" aria-hidden="true" >
                    <use xlink:href="#icon-check-out"></use>
                  </svg>

<!--                  <svg-icon v-if="scope.row.isCheckout" style="padding: 3px; color: #20a0ff" icon-class="check-out" />-->
                </template>
              </el-table-column>

              <slot name="table-column-top"></slot>
              <el-table-column
                      v-for="i of selfColumns"
                      show-overflow-tooltip
                      :key="i._id"
                      :prop="i.prop"
                      :width="i.width"
                      :label="i.label"
                      :fixed="i.fixed"
                      :align="i.align"
                      :sort-by="i.sortBy"
                      :sortable="i.sortable"
                      :min-width="i.minWidth"
                      :formatter="i.formatter"
                      :column-key="i.columnKey"
                      :class-name="i.className"
                      :sort-method="i.sortMethod"
                      :header-align="i.headerAlign"
                      :render-header="i.renderHeader"
                      :label-class-name="i.labelClassName"
              >
                <template slot-scope="scope">

                  <div
                          v-if="i.prop === selfProps.name"
                          @click="enterTheLower(scope.row, scope.row[selfIsFolder])"
                       class="doc-name-col doc-is-folder">
                    <div class="namecol-textbox">
                      {{
                      i.formatter
                      ? i.formatter(scope.row, scope.column, scope.row[i.prop],scope.$index)
                      : scope.row[i.prop]
                      }}
                    </div>
                  </div>
                  <template v-else-if="i.prop === selfProps.status">
                    <el-tag size="small" :type="scope.row.status | statusTypeFilter">{{scope.row.status | statusShowFilter}}
                    </el-tag>
                  </template>
                  <template v-else-if="i.prop === selfProps.keywords">

                    <el-tag size="small" style="margin-left: 5px" v-for="keyword in scope.row.keywords" :key="keyword.id">{{keyword.name}}</el-tag>
                  </template>
                  <template v-else-if="i.prop === selfProps.suffix">
                    <!-- 不同文件类型图标区 -->
                    <div class="namecol-iconbox">
                      <img :src="fileTypeIcon(scope.row)" class="name-col-icon" alt="文件类型图标">
                    </div>
                  </template>
                  <!-- 非名称列 -->
                  <template v-else>
                    {{
                    i.formatter
                    ? i.formatter(scope.row, scope.column, scope.row[i.prop],scope.$index)
                    : scope.row[i.prop]
                    }}
                  </template>
                </template>
              </el-table-column>
              <slot name="table-column-bottom"></slot>
            </el-table>
            <!-- 列表型文件列表 -->
            <ul class="doc-list" v-show="!layout.show_list">
              <li
                      class="doc-list-item doc-is-folder"
                      v-for="(i, idx) in self_data"
                      :key="i.id">
                <el-checkbox class="doc-checkbox" @change="listItemCheck($event,i)" v-model="i._checked"></el-checkbox>
                <div @click="enterTheLower(i, i[selfIsFolder])">
                  <img :src="fileTypeIcon(i)" class="name-col-icon" alt="文件类型图标">
                  <p class="list-item-name" :title="i.name">
                    {{
                    i.formatter
                    ? i.formatter(i, null, i.name, idx)
                    : i.name
                    }}
                  </p>
                </div>
              </li>
            </ul>
            <!-- 横排型文件列表 -->
            <slot name="main"></slot>
          </div>
<!--        </el-scrollbar>-->
<!--      </el-main>-->
<!--    </el-container>-->

    <!-- 移动文件区 -->
    <el-dialog
            title="移动文件"
            width="520px"
            :visible.sync="layout.move">
          <wlTreeSelect
              leaf
              checkbox
              :data="catTreeList"
              v-model="move_selected"
          ></wlTreeSelect>
      <span slot="footer" class="dialog-footer">
        <el-button @click="layout.move = false">取 消</el-button>
        <submit-btn @btn="fileMove" :status="load.move">
          确 定
        </submit-btn>
      </span>
    </el-dialog>
    <!-- 文件上传区 -->
    <template v-if="useUpload">
      <fade-in v-show="layout.upload">
        <h3 class="edit-header">
          上传文件
        </h3>
        <el-scrollbar class="scroll">
          <el-form
                  size="medium"
                  ref="template_form"
                  label-position="top"
                  class="template_form rule-form"
          >
            <el-form-item label="文件路径">
              <wlTreeSelect
                      leaf
                      checkbox
                      :data="catTreeList"
                      v-model="upload_selected"
              ></wlTreeSelect>

<!--              <el-select v-model="upload_selected" placeholder="请选择">-->
<!--                <el-option-->
<!--                        v-for="item in tree_path"-->
<!--                        :key="item.id"-->
<!--                        :label="item.name"-->
<!--                        :value="item.name"/>-->
<!--              </el-select>-->
            </el-form-item>
            <el-form-item label="导入文件">
              <uploadItem
                      ref="upload-item"
                      :reg="uploadReg"
                      :url="uploadUrl"
                      :limit="uploadLimit"
                      :regFuc="uploadRegFuc"
                      :options="uploadOptions"
                      :headers="uploadHeaders"
                      @beforeUpload="uploadBefore"
                      @uploadSuccess="uploadSuccess"
                      @uploadError="uploadError"
              >
              </uploadItem>

            </el-form-item>
          </el-form>
        </el-scrollbar>
        <!-- 按钮区 -->
        <div class="submit-btn-box">
          <submit-btn @btn="saveUpload()" :status="load.upload">
            保存
          </submit-btn>
          <el-button size="medium" @click="layout.upload = false">
            取消
          </el-button>
        </div>
      </fade-in>
    </template>
    <!-- 操作文件夹滑入区 -->
    <fadeIn v-show="layout.folder">
      <h3 class="edit-header">
        <p>{{folder_form.id?'编辑':'新增'}}文件夹</p>
      </h3>
      <el-scrollbar class="scroll">
        <el-form
                size="medium"
                ref="folder_form"
                label-position="top"
                :model="folder_form"
                :rules="folder_rules"
                class="folder_form rule-form"

        >
          <el-form-item label="文件路径" prop="ParentId">
            <wlTreeSelect
                    leaf
                    checkbox
                    :data="catTreeList"
                    v-model="folder_select"
            ></wlTreeSelect>
          </el-form-item>
          <el-form-item label="文件夹名称 " prop="Name">
            <el-input v-model="folder_form.Name" placeholder="请输入文件夹名称"></el-input>
          </el-form-item>
          <el-form-item label="备注说明" prop="Describe">
            <el-input
                    :rows="3"
                    type="textarea"
                    v-model="folder_form.Describe"
                    placeholder="请输入备注说明"
            ></el-input>
          </el-form-item>
        </el-form>
      </el-scrollbar>
      <div class="submit-btn-box">
        <submit-btn :status="load.folder"></submit-btn>
        <el-button size="medium" @click="layout.folder = false">取消</el-button>
      </div>
    </fadeIn>

    <div v-show="menuVisible" style="z-index: 1">
      <ul id="menu" class="menu">
        <li class="menu__item" @click="wlDownload">
          <svg-icon icon-class="doc-download"/>
          下载
        </li>
        <li class="menu__item">
          <svg-icon icon-class="doc-edit"/>
          编辑
        </li>
        <li class="menu__item">
          <svg-icon icon-class="doc-update"/>
          更新
        </li>
        <hr style="color:gray;" />
        <li class="menu__item">
          <svg-icon icon-class="doc-cancel"/>
          取消编辑
        </li>
        <li class="menu__item">
          <svg-icon icon-class="doc-lock"/>
          锁住
        </li>
        <li class="menu__item">
          <svg-icon icon-class="doc-unlock"/>
          解锁
        </li>
        <li class="menu__item">
          <svg-icon icon-class="doc-rename"/>
          重命名
        </li>
        <li class="menu__item">
          <svg-icon icon-class="doc-move"/>
          移动
        </li>
        <li class="menu__item">
          <svg-icon icon-class="permission"/>
          权限
        </li>
        <li class="menu__item">
          <svg-icon icon-class="doc-copy"/>
          复制
        </li>
        <li class="menu__item">
          <svg-icon icon-class="doc-convert"/>
          转换
        </li>
        <li class="menu__item">
          <svg-icon icon-class="doc-add-note"/>
          添加注释
        </li>
        <li class="menu__item">
          <svg-icon icon-class="doc-add-category"/>
          添加目录
        </li>
        <li class="menu__item">
          <svg-icon icon-class="doc-keyword"/>
          添加关键字
        </li>
        <li class="menu__item">
          <svg-icon icon-class="doc-metaData"/>
          添加元素
        </li>
        <li class="menu__item">
          <svg-icon icon-class="doc-pdf"/>
          转成PDF
        </li>
        <li class="menu__item">
          <svg-icon icon-class="doc-zip"/>
          压缩
        </li>
      </ul>
    </div>
    <div v-show="folderMenuVisible" style="z-index: 1">
      <ul id="folderMenu" class="menu">
        <li class="menu__item" @click="handleFolder('add')">
          <svg-icon icon-class="doc-add-category"/>
          新建
        </li>
        <li class="menu__item" style="{pointer-events: none;}">
          <svg-icon icon-class="doc-delete"/>
          删除
        </li>
        <li class="menu__item">
          <svg-icon icon-class="doc-move"/>
          移动
        </li>
        <li class="menu__item" @click="handleFolder('edit')" >
          <svg-icon icon-class="doc-rename"/>
          重命名
        </li>

        <li class="menu__item">
          <svg-icon icon-class="doc-copy"/>
          复制
        </li>
        <li class="menu__item">
          <svg-icon icon-class="permission"/>
          权限
        </li>
        <li class="menu__item">
          <svg-icon icon-class="doc-zip"/>
          压缩
        </li>
      </ul>
    </div>

  </div>
    </d2-container>
</template>

<script>
import submitBtn from './components/submit-btn.vue' // 导入防抖组件
// import fileView from './components/file-view.vue' // 导入预览组件
import fadeIn from './components/fade-in.vue' // 引入滑入组件
import uploadItem from './components/upload-item' // 导入导入组件
import { MessageBox } from 'element-ui'

import { arrayToTree, splicParentsUntil, download } from '@/util/util' // 导入组装树函数、拼接路径函数

const guid = '00000000-0000-0000-0000-000000000000'
//主页面，工具栏实例化

export default {
  name: 'DocExplorer',
  components: { submitBtn, fadeIn, uploadItem },
  data () {
    return {
      defaultProps: {
        children: 'children',
        label: 'name'
      },
      folder_form: {
        id: '',
        ParentId: '',
        Name: '',
        preview: [],
        handle: []
      }, // 文件夹表单
      folder_rules: {
        Name: [{ required: true, message: '请填写文件夹名称', trigger: 'blur' }]
      }, // 文件夹表单验证
      load: {
        del: false, // 删除
        move: false, // 移动
        upload: false // 上传
      }, // loading状态
      uploading: {
        name: '项目更新资料',
        percentage: 0,
        ing: false
      }, // 当前上传文件状态
      layout: {
        show_list: true, // 文件展示形式
        edit_path: false, // 是否编辑路径
        view: false, // 预览视图
        move: false, // 移动视图
        upload: false, // 上传视图
        folder: false
      }, // 视图管理
      file: {
        pid: '', // 父文件夹
        id: '', // 文件夹id
        path: '', // 文件路径
        key: '' // 关键字
      }, // 文件相关参数
      path: {
        level: 1, // 当前层级
        index: -1, // 在历史的第几步
        history: [
          {
            path: '', // 文件夹名字
            pid: '', // 路径
            id: '', // 文件夹id
            data: [] // 数据
          }
        ] // 历史路径
      }, // 记录路径历史
      folder: '',
      currentRow: Object,
      self_data: [], // 当前数据
      file_checked_data: [], // 列表多选数据
      matched_path: false, // 路径输入框内是否有匹配到的数据
      tree_path: [], // 全部路径树数据
      explorer_upload_data: Object,
      move_selected: '', // 所选移动文件目标路径
      upload_selected: '', // 所选上传文件目标路径
      folder_select: '',
      menuVisible: false,

      folderMenuVisible: false
    }
  },
  props: {
    /**
     * 头部更多操作自定义内容
     * 需要包含内容：
     * name: String 每条数据的名字
     * command: Function 每条数据的指令
     * disabled: Boolean 每条数据的禁用
     * divided: Boolean 每条数据的显示分割线
     * icon: String 每条数据的图标类名
     */
    headerDropdown: Array,
    // 是否显示复选框
    showCheckbox: {
      type: Boolean,
      default: true
    },
    // 是否显示顺序号
    showIndex: {
      type: Boolean,
      default: true
    },
    // 表格是否显示边框
    showBorder: {
      type: Boolean,
      default: true
    },
    // 文件表格数据
    data: Array,
    // 文件表头数据【[参数：所有el-Table-column Attributes] (https://element.eleme.cn/#/zh-CN/component/table)】
    columns: Array,
    /**
     * 配置项
     * isFolder: Boolean
     * name: String 表示名称列的字段
     */
    props: Object,
    // 所有文件路径 用于文件地址输入框自动提示,如不传则使用历史记录
    allPath: Array,
    // 校验是否文件夹函数，（row）参数为当前行数据，用于复杂类型，当isFolderFn优先使用计算结果，不存在时使用props配置内的isFolder字段
    isFolderFn: Function,
    // 是否锁定文件、文件夹函数,true则不可进行操作
    isLockFn: Function,
    // 是否使用自带上传组件
    useUpload: {
      type: Boolean,
      default: true
    },
    // 上传文件地址
    uploadUrl: {
      type: String,
      default: ''
    },
    //  是否校验上传文件
    uploadReg: {
      type: Boolean,
      default: false
    },
    // 上传文件前校验函数，应返回Boolean
    uploadRegFuc: Function,
    // 上传文件头参数
    uploadHeaders: Object,
    // 上传文件参数
    uploadOptions: Object,
    // 上传个数限制
    uploadLimit: Number,
    // 是否使用自带预览组件
    usePreview: {
      type: Boolean,
      default: true
    },
    // 预览文件类型
    previewType: {
      type: String,
      default: 'img'
    },
    // 预览文件地址或配置项
    previewOptions: Object,
    // 拼接路径配置项
    splicOptions: Object,

    catTreeList: Array
  },
  filters: {
    statusTypeFilter (status) {
      const statusMap = {
        0: 'warning',
        1: 'danger',
        2: 'primary',
        3: 'success'
      }
      return statusMap[status]
    },
    statusShowFilter (status) {
      const statusMap = {
        0: '新创建',
        1: '已取消',
        2: '审核中',
        3: '已发布'
      }
      return statusMap[status]
    }
  },
  methods: {
    //右键点击
    rightClick (row, id) {
      event.preventDefault()

      console.info('row:' + JSON.stringify(row) + 'id:' + JSON.stringify(id))
      this.currentRow = row
      this.menuVisible = false // 先把模态框关死，目的是 第二次或者第n次右键鼠标的时候 它默认的是true
      this.menuVisible = true // 显示模态窗口，跳出自定义菜单栏
      const menu = document.querySelector('#menu')
      this.styleMenu(menu)
    },
    menuRightClick (row, id) {
      // event.preventDefault()
      console.info('row:' + JSON.stringify(row) + 'id:' + JSON.stringify(id))
      this.folderMenuVisible = false // 先把模态框关死，目的是 第二次或者第n次右键鼠标的时候 它默认的是true
      this.folderMenuVisible = true // 显示模态窗口，跳出自定义菜单栏
      const menu = document.querySelector('#folderMenu')
      this.styleFolderMenu(menu)
    },
    rightCancel () {
      // 取消鼠标监听事件 菜单栏
      this.menuVisible = false
      this.folderMenuVisible = false
      document.removeEventListener('click', this.rightCancel) // 要及时关掉监听，不关掉的是一个坑，不信你试试，虽然前台显示的时候没有啥毛病，加一个alert你就知道了
    },
    styleFolderMenu (menu) {
      document.addEventListener('click', this.rightCancel) // 给整个document新增监听鼠标事件，点击任何位置执行foo方法
      menu.style.left = event.clientX - 30 + 'px'
      menu.style.top = event.clientY - 150 + 'px'
      console.info('x:' + menu.style.left + 'y:' + menu.style.top)
    },
    styleMenu (menu) {
      document.addEventListener('click', this.rightCancel) // 给整个document新增监听鼠标事件，点击任何位置执行foo方法

      if (event.clientX < 200) {
        menu.style.left = event.clientX + 0 + 'px'
      } else {
        menu.style.left = '500px'
      }
      if (event.clientY > 700) {
        menu.style.top = event.clientY - 30 + 'px'
      } else {
        menu.style.top = '50px'
      }
      console.info('x:' + menu.style.left + 'y:' + menu.style.top)
    },
    forward () {
      const selectedLen = this.multipleSelection.length || 0
      if (selectedLen !== 1) {
        this.$message('请选择文件')
        return
      }
      this.$router.push({ path: '/document/previewer' })
    },
    /**
     * 文件夹编辑操作
     * type: string 添加add 编辑edit
     * auth: boolean 是否只修改权限
     */
    handleFolder (type) {
      const [_act = null] = this.file_checked_data
      if (type === 'edit' && (!_act || !_act[this.selfIsFolder])) {
        this.$message({
          showClose: true,
          message: '请选择文件夹',
          type: 'error'
        })
        return
      }
      this.layout.folder = true
      if (type === 'add') {
        // this.$refs['folder_form'].resetFields()
        this.folder_form.id = ''
        return
      }
      // 当前文件夹 文件夹操作类型 新增文件夹回调（只用于历史存储）
      this.$emit('handleFolder', _act, type, this.file)
      this.closeUpload()
    },
    // 文件夹删除操作
    handleDel () {
      if (this.file_checked_data.length === 0) {
        this.$message({
          showClose: true,
          message: '请选择要删除的文件或文件夹',
          type: 'error'
        })
        return
      }
      // 删除确认
      MessageBox
        .confirm('是否确认删除选中数据？', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        })
        .then(() => {
          this.$emit('del', this.file_checked_data)
        })
        .catch(() => {
          this.$message({
            type: 'info',
            message: '已取消删除'
          })
        })
    },
    // 更多操作
    handleDropdown (val) {
      if (typeof val === 'function') {
        val(this.file)
        return
      }
      if (val === 'doc-move') {
        this.showMoveList()
      } else if (val === 'doc-download') {
        this.wlDownload()
      }
    },
    // 显示文件路径输入框
    handleFilePath () {
      this.layout.edit_path = true
      this.$nextTick(() => {
        this.$refs['file-path-ipt'].focus()
      })
    },
    // 输入文件路径
    filePathChange (item) {
      if (!this.matched_path) {
        this.$confirm
          .alert(`文件管理器内找不到"${this.file.path}"。请检查拼写并重试。`, '文件资源管理器', {
            confirmButtonText: '确定',
            callback: () => {},
            closeOnClickModal: true,
            closeOnPressEscape: true,
            type: 'error'
          })
        return
      }
      const _act_item = this.path.history.find(i => i.id === item.id)
      if (_act_item) {
        this.routerActive(_act_item, _act_item.data)
      } else {
        this.routerPush({
          id: item.id,
          pid: item.parentid,
          path: item.name
        })
      }

      this.$emit('search', this.file, !_act_item)
      this.layout.edit_path = false
    },
    // 搜索文件
    fileSearch () {
      if (this.file.key !== '') {
        this.$emit('search', this.file, true)
        return
      }
      const _act_item = this.path.history.find(i => i.id === this.file.id)
      _act_item
        ? this.routerActive(_act_item, _act_item.data)
        : this.$emit('search', this.file, true)
    },
    /**
     * 往历史里添加新的步骤
     * file: Object 路径数据{id: 路径id, pid: 父级路径id, path: 路径名}
     * data: Array 当前路径下的数据
     */
    routerPush (file, data = []) {
      splicParentsUntil(this.allPath, file)
      this.clearSearchKey()
      this.path.history.push({
        ...file,
        data
      })
      this.self_data = data
      this.file.pid = file.pid
      this.file.id = file.id
      this.file.path = splicParentsUntil(this.allPath, file)
      this.path.level = !file.id || file.id === guid ? 1 : 2
      this.path.index = -1 // 将步骤从新回到原位
    },
    /**
     * 处理当前步骤数据
     * file: Object 路径数据{id: 路径id, pid: 父级路径id, path: 路径名}
     * data: Array 当前路径下的数据
     */
    routerActive (file, data) {
      this.clearSearchKey()
      this.file.pid = file.pid
      this.file.id = file.id
      this.file.path = splicParentsUntil(this.allPath, file)
      this.self_data = data
      this.path.level = !file.id || file.id === guid ? 1 : 2
    },
    // 显示可移动目录
    showMoveList () {
      if (this.file_checked_data.length === 0) {
        this.$message({
          showClose: true,
          message: '请选择要移动的文件或文件夹',
          type: 'error'
        })
        return
      }
      console.info('tree_path: ' + JSON.stringify(this.tree_path))
      this.layout.move = true
    },
    // 显示下载
    wlDownload () {
      // if (this.file_checked_data.length === 0) {
      //   this.$message({
      //     showClose: true,
      //     message: '请选择要下载的文件或文件夹',
      //     type: 'error'
      //   })
      //   return
      // }
      this.$emit('download', this.currentRow, download)
    },
    // 前进后退按钮操作
    pathBtn (type) {
      if (type === 'prv') {
        if (this.pathIsStart) return
        if (this.path.index === -1) {
          this.path.index = this.path.history.length - 1
        }
        this.path.index -= 1
        const _prv = this.path.history[this.path.index]
        this.routerActive(_prv, _prv.data)
      } else if (type === 'next') {
        if (this.pathIsEnd) return
        this.path.index += 1
        const _next = this.path.history[this.path.index]
        this.routerActive(_next, _next.data)
      } else {
        if (this.path.level === 1) return
        const _pid = this.file.pid !== guid ? this.file.pid : ''
        const _parent_history = this.path.history.find(i => i.id === _pid)
        if (_parent_history) {
          this.path.history.splice(this.path.history.findIndex(i => i.id === _pid), 1)
          this.routerPush(_parent_history, _parent_history.data)
          return
        }
        // 历史记录没有时 从全部路径里找
        const _parent = this.selfPathHistory.find(i => i.id === _pid)
        if (!_parent) return
        this.routerPush({
          id: _parent.id,
          pid: _parent.parentid,
          path: _parent.name
        })

        this.$emit('search', this.file, true)
      }
    },
    /**
     * 文件夹时进入下一级-文件时预览文件
     * row: Object 行数据
     * isFolder: Boolean 行是否文件夹
     */
    enterTheLower (row, isFolder) {

      if (!isFolder) {
        // this.previewFile(row)
        return
      }
      const _children = this.path.history.find(i => i.id === row.id)
      if (_children) { // 历史找到子集时
        this.path.history.splice(this.path.history.findIndex(i => i.id === row.id), 1)
        this.routerPush(_children, _children.data)
        return
      }
      // 历史找不到子集时 请求更新
      this.routerPush({
        id: row.id,
        pid: row.parentid,
        path: row.name
      })
      this.$emit('search', this.file, true)
    },
    // 文件、文件夹移动
    fileMove () {
      this.$emit('move', this.move_selected[0], this.file_checked_data, this.load.move)
      this.$nextTick(() => {
        this.layout.move = false
      })
    },
    // 显示上传界面
    showUpload () {
      if (this.useUpload) {
        this.layout.upload = true
        this.$emit('closeFade')
      } else {
        this.layout.upload = false
        this.$emit('showUpload')
      }
    },
    // 关闭上传界面
    closeUpload () {
      this.layout.upload = false
    },
    // 文件上传提交操作
    saveUpload () {
      console.info('info:' + JSON.stringify(this.file) + ' || ' + JSON.stringify(this.upload_selected))
      this.layout.upload = false
      this.$emit('upload', this.file, this.handleUpload)
    },
    // 手动上传文件
    handleUpload () {
      this.$refs['upload-item'].toUpload()
    },
    // 文件上传成功回调
    uploadSuccess (res) {
      console.info('upload:' + JSON.stringify(res))
      this.$emit('uploadSuccess', res)
      // this.closeUpload()
      if (!res.Data) return
      const _res_data = res.Data || {}
      if (this.isFolderFn) {
        _res_data.isFolder = this.isFolderFn(_res_data)
      }
      if (this.isLockFn) {
        _res_data.isLock = this.isLockFn(_res_data)
      }
      if (this.explorer_upload_data.bizId === this.file.id) {
        this.self_data.push(_res_data) // 当前文件夹上传 当即展示 因对象引用 历史记录也会自动更改
        return
      }
      // 非当前 如在历史记录里已有所选路径 则更新历史记录内的数据
      const _act = this.path.history.find(i => i.id === this.explorer_upload_data.bizId)
      if (!_act) return
      _act.data.push(_res_data)
    },
    // 文件上传前回调
    uploadBefore (file) {
      this.$emit('uploadBefore', file, this.file)
    },
    // 文件上传失败回调
    uploadError (err) {
      this.$emit('uploadError', err)
      this.load.upload = false
    },
    // 地址输入框匹配
    pathQuerySearch (queryString, cb) {
      const history = this.selfPathHistory
      const results = queryString ? history.filter(this.createFilter(queryString)) : history
      this.matched_path = results.length > 0
      // 调用 callback 返回建议列表的数据
      cb(results)
    },
    createFilter (queryString) {
      return (restaurant) => {
        return (restaurant.value.toLowerCase().indexOf(queryString.toLowerCase()) === 0)
      }
    },
    // 根据文件类型显示图标
    fileTypeIcon (row) {
      // console.info('row:' + JSON.stringify(row))
      let _path = ''
      // console.info('folder:' + JSON.stringify(this.selfIsFolder))
      // 文件夹
      if (row[this.selfIsFolder]) {
        _path = row[this.selfIsLock]
          ? require('./images/file_automatic@3x.png')
          : require('./images/folder@3x.png')
        return _path
      }
      // 其他根据后缀类型
      const _suffix = row[this.selfProps.suffix]
      if (!_suffix) {
        _path = require('./images/file_none@3x.png')
        return _path
      }
      if (['jpg', 'jpeg', 'png', 'gif', 'bmp'].includes(_suffix)) { // 图片
        _path = require('./images/file_img@3x.png')
      } else if (['zip', 'rar', '7z'].includes(_suffix)) {
        _path = require('./images/file_zip@3x.png')
      } else if (['avi', 'mp4', 'rmvb', 'flv', 'mov', 'm2v', 'mkv'].includes(_suffix)) {
        _path = require('./images/file_video@3x.png')
      } else if (['mp3', 'wav', 'wmv', 'wma'].includes(_suffix)) {
        _path = require('./images/file_mp3@3x.png')
      } else if (['xls', 'xlsx'].includes(_suffix)) {
        _path = require('./images/file_excel@3x.png')
      } else if (['doc', 'docx'].includes(_suffix)) {
        _path = require('./images/file_docx@3x.png')
      } else if (_suffix === 'pdf') {
        _path = require('./images/file_pdf@3x.png')
      } else if (_suffix === 'ppt') {
        _path = require('./images/file_ppt@3x.png')
      } else if (_suffix === 'txt') {
        _path = require('./images/file_txt@3x.png')
      } else {
        _path = require('./images/file_none@3x.png')
      }
      return _path
    },
    // 记录多选列表数据
    fileChecked (val) {
      this.self_data.forEach(i => i._checked = false)
      val.forEach(i => i._checked = true)
      this.file_checked_data = val
    },
    // 列表模式记录多选数据
    listItemCheck (check, val) {
      this.$refs['doc-table'].toggleRowSelection(val)
    },
    // 清空关键词
    clearSearchKey () {
      this.file.key = ''
    },
    // 预览文件
    previewFile (row) {
      console.info('preview:' + row)
      this.$emit('preview', row, this.showPreview)
      this.$router.push({
        path: '/document/previewer',
        query: {
          id: row.id
        }
      })
      // this.showPreview()
    },
    // 打开预览组件
    showPreview () {
      // console.info('preview:' + JSON.stringify(this.layout))
      this.layout.view = true
    },
    // 处理数据变动
    handleDataChange (val) {
      const _data = val || []
      if (this.isFolderFn) {
        _data.forEach(i => {
          i.isFolder = this.isFolderFn(i)
        })
      }
      if (this.isLockFn) {
        _data.forEach(i => {
          i.isLock = this.isLockFn(i)
        })
      }
      if (this.file.key) {
        this.self_data = _data
        return
      }
      const _act = this.path.history.find(i => i.id === this.file.id)
      if (!_act) return
      _act.data = _data
      this.routerActive(_act, _data)
    }
  },
  computed: {
    // 自身头部更多操作自定义内容
    selfHeaderDropdown () {
      const _data = this.headerDropdown || []
      _data.forEach((i, idex) => {
        i.id = i.id || `h-drop-id-${idex}`
      })
      return _data
    },
    // 自身表头数据
    selfColumns () {
      const _data = this.columns || []
      _data.forEach((i, idx) => {
        i._id = `_col_${idx}`
      })
      return _data
    },
    // 自身配置项
    selfProps () {
      return {
        isFolder: 'isFolder', // Boolean 用于有布尔值字段表示数据是否文件夹类型的情况,当使用isFolderFn函数时，此参数会被忽略
        isLock: 'isLock', // Boolean 用于有布尔值字段表示数据是否锁定文件类型的情况,当使用isLockFn函数时，此参数被忽略
        name: 'name', // String 用于显示名称列的字段
        suffix: 'suffix', // String 用于判断后缀或显示文件类型列的字段
        match: 'name', // String 用于设定输入框自动补全的匹配字段
        splic: true, // Boolean 用于设定输入框自动补全的匹配字段是否需要将match字段和祖先节点拼接
        pathName: 'name', // String 路径数据 显示名称字段
        pathId: 'id', // String 路径数据 id字段
        pathPid: 'pid', // String 路径数据 pid字段
        pathChildren: 'children', // String 路径数据 children字段
        pathDisabled: 'disabled', // String 路径数据 禁用字段
        status: 'status',
        keywords: 'keywords',
        ...this.props
      }
    },
    // 自身移动 下拉框树 配置项
    selfMoveProps () {
      return {
        label: this.selfProps.name,
        children: this.selfProps.pathChildren,
        disabled: this.selfProps.pathDisabled
      }
    },
    // 将是否文件夹的两种判断方式合并返回
    selfIsFolder () {
      return this.isFolderFn ? 'isFolder' : this.selfProps.isFolder
    },
    // 将是否锁定文件、文件夹的两种判断方式合并返回
    selfIsLock () {
      return this.isLockFn ? 'isLock' : this.selfProps.isLock
    },
    // 当前是否最后一步
    pathIsEnd () {
      return this.path.history[this.path.history.length - 1].id === this.file.id
    },
    // 当前是否最后一步
    pathIsStart () {
      return this.path.history[0].id === this.file.id
    },
    // 自身文件路径输入框提示列表
    selfPathHistory () {
      const _all_path = this.allPath || []
      if (this.selfProps.splic) {
        this.allPath.forEach(i => {
          // i.id = i.id
          i.value = splicParentsUntil(_all_path, i)
        })
      } else {
        this.allPath.forEach(i => {
          i.value = i[this.selfProps.match]
        })
      }
      return this.allPath || this.path.history || []
    },
    // 是否禁用编辑文件夹按钮
    disabledEditFolder () {
      return this.file_checked_data.length !== 1 || !this.file_checked_data[0][this.selfIsFolder]
    }
  },
  watch: {
    // 检测data数据更新列表
    data (val) {
      this.handleDataChange(val)
    },
    // 检测所有路径，组成树
    allPath (val) {
      const options = {
        id: this.selfProps.pathId,
        pid: this.selfProps.pathPid,
        children: this.selfProps.pathChildren
      }
      // this.tree_path = arrayToTree(val || [], options)
      // console.info('tree_path: ' + JSON.stringify(this.tree_path))
    }
  },
  created () {
    if (this.data && this.data.length > 0) {
      this.handleDataChange(this.data)
    }
    this.tree_path = this.catTreeList
    console.info('tree_path: ' + JSON.stringify(this.tree_path))
  }
}
</script>

<style lang="scss">
  @import './css/index.css';
  @import './css/clear.css';
  /*@import './icons/iconfont.css';*/
  .menu__item {
    z-index: 999;
    display: block;
    line-height: 20px;
    text-align: left;
    margin:10px;
    cursor: default;
  }
  .menu__item:hover{
    color: #20a0ff;
  }

  .menu {
    height: auto;
    width: auto;
    position: absolute;
    font-size: 14px;
    text-align: left;
    border-radius: 10px;
    border: 1px solid #c1c1c1;
    background-color: #ffffff;
  }

  li:hover {
    background-color: #E0E0E2;
    color: white;
  }

  .toolbar-icon {
     padding: 3px 5px;
     width: 3em;
     height: 3em;
     vertical-align: -0.15em;
     fill: currentColor;
     overflow: hidden;
   }

  .column-icon {
    padding: 3px 1px;
    width: 1.5em;
    height: 1.5em;
    vertical-align: -0.15em;
    fill: currentColor;
    overflow: hidden;
  }


</style>
