<template>
  <div>
    <div class="upload-box">
      <!-- 自定义内容区 -->
      <slot></slot>
      <!-- 文件上传区 :disabled="disUpload"-->
      <el-upload
        class="upload-demo"
        ref="upload"
        drag
        multiple
        with-credentials
        :action="url"
        :limit="limit"
        :data="upOptions"
        :headers="headers"
        :file-list="fileList"
        :auto-upload="autoUpload"
        :before-upload="beforeUpload"
        :on-error="handleError"
        :on-exceed="handleExceed"
        :on-success="handleSuccess"
        >
        <i class="el-icon-upload"></i>
        <div class="el-upload__text">
          将文件拖到此处，或
          <em>点击上传</em>
        </div>
      </el-upload>
    </div>
  </div>
</template>

<script>


export default {
  data () {
    return {
      fileList: [] // 已上传文件
    }
  },
  props: {
    // 上传头信息
    headers: Object,
    // 上传地址
    url: {
      type: String,
      default: '' // 通用上传地址
    },
    // 上传参数
    options: Object,
    // 自动上传
    autoUpload: {
      type: Boolean,
      default: true
    },
    // 上传前校验
    reg: {
      type: Boolean,
      default: true
    },
    // 自定义校验函数
    regFuc: Function,
    // 上传个数限制
    limit: Number
  },
  mounted () {
    console.info('url' + this.url)
  },
  methods: {
    // 手动上传
    toUpload () {
      this.$refs.upload.submit()
    },
    // 上传前验证
    beforeUpload (file) {
      this.$emit('beforeUpload', file)
      console.info('beforeUpload' + this.url)
      // 不校验
      if (!this.reg) return true
      // 自定义校验
      if (this.regFuc) return this.regFuc(file)
    },
    // 上传成功回调
    handleSuccess (res, file, fileList) {
      console.info('uploadSuccess', res, file, fileList)
      this.$emit('uploadSuccess', res, file, fileList)
    },
    // 上传失败回调
    handleError (err) {
      console.info('uploadError', err)
      this.$emit('uploadError', err)
    },
    // 文件超出限制
    handleExceed () {
      this.$message.error('超出文件上传个数限制，最大上传个数为：1！')
    }
  },
  computed: {
    // 上传参数
    upOptions () {
      return this.options
    }
  }
}
</script>

<style lang="scss">
.upload-box {
  .el-upload,
  .el-upload-dragger {
    width: 100%;
  }
}
</style>
