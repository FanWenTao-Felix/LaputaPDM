<template>
   <d2-container>
       <template v-for="button in toolbar" >
           <svg-icon :type="button.type"  @click="button.handler" :icon-class="button.icon" ></svg-icon>
           <el-divider direction="vertical"></el-divider>
       </template>
       <el-button-group>

           <el-button type="text" size="medium"><svg-icon  className="svg-button"  icon-class="doc-update" ></svg-icon></el-button>
           <el-button type="text"><svg-icon  className="svg-button"  icon-class="doc-update" ></svg-icon></el-button>
       </el-button-group>
       <el-button-group>
           <el-button  icon="el-icon-edit"></el-button>
           <el-button  icon="el-icon-share"></el-button>
           <el-button  icon="el-icon-delete"></el-button>
       </el-button-group>
<!--       <div  v-if="type === 'video'" class="video_player_input">-->
<!--        <videoPlayer class="player-item" :options="previewOptions" ></videoPlayer>-->
<!--       </div>-->
       <iframe v-if="type==='pdf'" :src="'./pdfjs/web/viewer.html?file='+pdfUrl" width='100%' height='100%' >
           您的浏览器不支持PDF阅读
       </iframe>
       <VueDocPreview v-else-if="type==='office'" :value="docValue" :type="type" :mdStyle="mdStyle"/>
       <!-- 你不需要担心一个页面中过多vue-ueditor-wrap组件会导致混乱,或者重复引用JS(打开控制台瞄一眼),每个组件都保证拥有一个独立的UEditor实例,你可以尝试把数字改成99(根据自己电脑自行斟酌),但依然稳定可用 -->
       <vue-ueditor-wrap v-else-if="type==='other'" ref="ueditor" v-model="content" :destroy="false" :config="config" @ready="ready" v-for="item in 1" :key="item" @beforeInit="addCustomUI"></vue-ueditor-wrap>
       <div class="el-image-viewer__btn el-image-viewer__actions">
           <div class="el-image-viewer__actions__inner">
               <i class="el-icon-zoom-out" ></i>
               <i class="el-icon-zoom-in" ></i>
               <i class="el-image-viewer__actions__divider"></i>

               <i class="el-icon-refresh-left" ></i>
               <i class="el-image-viewer__actions__divider"></i>
               <i class="el-icon-refresh-right" ></i>
           </div>
       </div>
   </d2-container>

</template>

<script>
import videoPlayer from './video-player' // 导入视频播放组件
import VueDocPreview from 'vue-doc-preview'
import VueUeditorWrap from 'vue-ueditor-wrap'
// %3a%2f%2f

export default {
  components: {
    videoPlayer,
    VueUeditorWrap,
    VueDocPreview
  },
  data () {
    return {
      type: 'video',
      mdStyle: {
        pre: {
          'background-color': 'rgb(187, 255, 255)'
        },
        code: {
          'background-color': 'rgb(187, 255, 255)',
          'line-height': '20px'
        }
      },
      docValue: 'http://129.211.7.213/j2ee.docx',
      toolbar: [
        {
          id: 'search',
          type: 'warning',
          text: '查询',
          useable: 'T',
          icon: 'doc-download',
          handler: function () {
            // APP.$options.methods.doSearch(1);
          }
        },
        {
          type: 'error',
          text: '新增',
          useable: 'T',
          icon: 'doc-edit',
          handler: function () {
            // addOsuser();
          }
        },
        {
          type: 'button',
          text: '修改',
          useable: 'T',
          icon: 'doc-update',
          handler: function () {
            // updateOsuser();
          }
        }
      ],

      // 3、v-model绑定数据
      content: '<h2><img src="http://img.baidu.com/hi/jx2/j_0003.gif"/>Vue + UEditor + v-model双向绑定</h2>',
      // 4、根据项目需求自行配置,具体配置参见ueditor.config.js源码或 http://fex.baidu.com/ueditor/#start-start
      config: {
        // 编辑器不自动被内容撑高
        autoHeightEnabled: false,
        // 初始容器高度
        initialFrameHeight: 680,
        // 初始容器宽度
        initialFrameWidth: '100%',
        // 上传文件接口（这个地址是我为了方便各位体验文件上传功能搭建的临时接口，请勿在生产环境使用！！！）
        serverUrl: 'http://35.201.165.105:8000/controller.php',
        // UEditor 资源文件的存放路径，如果你使用的是 vue-cli 生成的项目，通常不需要设置该选项，vue-ueditor-wrap 会自动处理常见的情况，如果需要特殊配置，参考下方的常见问题2
        UEDITOR_HOME_URL: '/UEditor/',
        // 配合最新编译的资源文件，你可以实现添加自定义Request Headers,详情https://github.com/HaoChuan9421/ueditor/commits/dev-1.4.3.3
        headers: {
          access_token: '37e7c9e3fda54cca94b8c88a4b5ddbf3'
        }
      },
      currentPage: 0, // pdf文件页码
      pageCount: 0, // pdf文件总页数
      fileType: 'pdf', // 文件类型
      previewOptions: {
        autoplay: false, //如果true,浏览器准备好时开始回放。
        muted: false, // 默认情况下将会消除任何音频。
        loop: false, // 导致视频一结束就重新开始。
        sources: [
          {
            type: 'video/mp4',
            src: 'http://129.211.7.213/video/hokkaido/14.mp4' //你的视频地址（必填）
          }
        ],
        poster: '', //你的封面地址
        width: 500
      },
      pdfUrl: 'http://localhost:8090/pdf/2.pdf' // pdf文件地址
    }
  },
  created () {

    this.docValue = encodeURIComponent(this.docValue)
    console.info('docValue' + this.docValue)
  },
  methods: {



    // 5、 你可以在ready方法中拿到editorInstance实例,所有API和官方的实例是一样了。http://fex.baidu.com/ueditor/#api-common
    ready (editorInstance) {
      console.log(`实例${editorInstance.key}已经初始化:`, editorInstance)
    },
    // 6. 查看绑定的数据
    showData () {
      alert(this.content)
      console.log(this.content)
    },
    loadPdfHandler (e) {
      this.currentPage = 1 // 加载的时候先加载第一页
    },
    // 7. 借助 beforeInit 钩子，你可以实现对 UEditor 的二次开发，会在 scripts 加载完毕之后、编辑器初始化之前触发，以 编辑器 id 和 配置参数 作为入参
    addCustomUI (editorId, editorConfig) {
      console.log(editorId + '的配置参数是:', JSON.stringify(editorConfig, null, 2))
      // 1. 自定义按钮
      window.UE.registerUI('test-button' + editorId, function (editor, uiName) {
        // 注册按钮执行时的 command 命令，使用命令默认就会带有回退操作
        editor.registerCommand(uiName, {
          execCommand: function () {
            editor.execCommand('inserthtml', `<span style="color: #${editorId.substr(-3)};">这是一段由自定义按钮添加的文字，你点击的编辑器ID是${editorId}</span>`)
          }
        })
        // 创建一个 button
        var btn = new window.UE.ui.Button({
          // 按钮的名字
          name: uiName,
          // 提示
          title: '鼠标悬停时的提示文字',
          // 需要添加的额外样式，可指定 icon 图标，图标路径参考常见问题 2
          cssRules: "background-image: url('/static/test-button.png') !important;background-size: cover;",
          // 点击时执行的命令
          onclick: function () {
            // 这里可以不用执行命令，做你自己的操作也可
            editor.execCommand(uiName)
          }
        })
        // 当点到编辑内容上时，按钮要做的状态反射
        editor.addListener('selectionchange', function () {
          var state = editor.queryCommandState(uiName)
          if (state === -1) {
            btn.setDisabled(true)
            btn.setChecked(false)
          } else {
            btn.setDisabled(false)
            btn.setChecked(state)
          }
        })
        // 因为你是添加 button，所以需要返回这个 button
        return btn
      }, 0 /* 指定添加到工具栏上的哪个位置，默认时追加到最后 */, editorId /* 指定这个 UI 是哪个编辑器实例上的，默认是页面上所有的编辑器都会添加这个按钮 */)
      // 2. 自定义表格居中按钮
      window.UE.registerUI('table-center-button' + editorId, function (editor, uiName) {
        // 注册按钮执行时的 command 命令，使用命令默认就会带有回退操作
        editor.registerCommand(uiName, {
          execCommand: function () {
            var tables = editor.document.querySelectorAll('table')
            if (tables.length) {
              tables.forEach((table) => {
                table.style.margin = '0 auto'
              })
            } else {
              editor.trigger('showmessage', {
                content: '没有表格',
                timeout: 2000
              })
            }
          }
        })
        // 创建一个 button
        var btn = new window.UE.ui.Button({
          // 按钮的名字
          name: uiName,
          // 提示
          title: '点击设置表格居中',
          // 需要添加的额外样式，可指定 icon 图标，图标路径参考常见问题 2
          cssRules: "background-image: url('/static/center.png') !important;background-size: cover;",
          // 点击时执行的命令
          onclick: function () {
            // 这里可以不用执行命令，做你自己的操作也可
            editor.execCommand(uiName)
          }
        })
        // 当点到编辑内容上时，按钮要做的状态反射
        editor.addListener('selectionchange', function () {
          var state = editor.queryCommandState(uiName)
          if (state === -1) {
            btn.setDisabled(true)
            btn.setChecked(false)
          } else {
            btn.setDisabled(false)
            btn.setChecked(state)
          }
        })
        // 因为你是添加 button，所以需要返回这个 button
        return btn
      }, 1 /* 指定添加到工具栏上的哪个位置，默认时追加到最后 */, editorId /* 指定这个 UI 是哪个编辑器实例上的，默认是页面上所有的编辑器都会添加这个按钮 */)
      // 3. 自定义弹窗
      window.UE.registerUI('test-dialog' + editorId, function (editor, uiName) {
        // 创建 dialog
        var dialog = new window.UE.ui.Dialog({
          // 指定弹出层中页面的路径，这里只能支持页面，路径参考常见问题 2
          iframeUrl: '/static/customizeDialogPage.html',
          // 需要指定当前的编辑器实例
          editor: editor,
          // 指定 dialog 的名字
          name: uiName,
          // dialog 的标题
          title: '这是一个自定义的 Dialog 浮层',
          // 指定 dialog 的外围样式
          cssRules: 'width:600px;height:300px;',
          // 如果给出了 buttons 就代表 dialog 有确定和取消
          buttons: [
            {
              className: 'edui-okbutton',
              label: '确定',
              onclick: function () {
                dialog.close(true)
              }
            },
            {
              className: 'edui-cancelbutton',
              label: '取消',
              onclick: function () {
                dialog.close(false)
              }
            }
          ]
        })
        // 参考上面的自定义按钮
        var btn = new window.UE.ui.Button({
          name: 'dialog-button',
          title: '鼠标悬停时的提示文字',
          cssRules: `background-image: url('/static/test-dialog.png') !important;background-size: cover;`,
          onclick: function () {
            // 渲染dialog
            dialog.render()
            dialog.open()
          }
        })
        return btn
      }, 2 /* 指定添加到工具栏上的那个位置，默认时追加到最后 */, editorId /* 指定这个UI是哪个编辑器实例上的，默认是页面上所有的编辑器都会添加这个按钮 */)
    }
  }
}

</script>
<style lang="scss" scoped>
    .svg-icon{
        width: 3em!important;
        height: 3em!important;
        vertical-align: -0.15em;
        fill: currentColor;//此属性为更改svg颜色属性设置
        overflow: hidden;
    }
    .svg-icon:hover{
        fill: #409EFF;
        width: 3em;
        height: 3em;
    }
    .wl-header-btn{padding:20px;margin:20px;box-shadow:10px 10px 25px rgba(0,0,0,0.3)}
    .el-button{
        margin:10px
    }
    .video_player_input{
        width: 400px;
        height: 400px;
        margin-top: 20px;
    }
    .centerp{

        float: left;

        width: 50px;

        border-right: 1px solid black;

        padding-bottom: 100px;/*关键*/

        margin-bottom: -100px;/*关键*/

        }

</style>

