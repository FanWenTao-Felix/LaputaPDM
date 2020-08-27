<template>
  <el-tooltip
    effect="dark"
    :content="tooltipContent"
    placement="bottom">
    <el-button
      class="d2-ml-0 d2-mr btn-text can-hover"
      type="text"
      @click="handleClick">
      <el-badge
        :max="99"
        :value="10"
        >
        <d2-icon
          name="bell-o"
          style="font-size: 20px"/>
      </el-badge>

    </el-button>
  </el-tooltip>
</template>

<script>
import { mapGetters, mapMutations } from 'vuex'
export default {
  computed: {
    ...mapGetters('d2admin', {
      logLength: 'info/length'
    }),
    tooltipContent () {
      return this.logLength === 0
        ? '你有通知消息10条'
        : `${this.logLength} 条日志${this.logLengthError > 0
          ? ` | 包含 ${this.logLengthError} 个异常`
          : ''}`
    }
  },
  methods: {
    ...mapMutations('d2admin/log', [
      'clean'
    ]),
    handleClick () {
      this.$router.push({
        name: 'mail-inbox'
      })
    }
  }
}
</script>
