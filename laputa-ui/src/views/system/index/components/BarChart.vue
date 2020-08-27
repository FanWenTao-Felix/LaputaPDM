<template>
  <div :class="className" :style="{height:height,width:width}" />
</template>

<script>
import echarts from 'echarts'
import resize from './mixins/resize'
require('echarts/theme/macarons') // echarts theme


const animationDuration = 6000

export default {
  mixins: [resize],
  props: {
    className: {
      type: String,
      default: 'chart'
    },
    width: {
      type: String,
      default: '100%'
    },
    height: {
      type: String,
      default: '500px'
    }
  },
  data () {
    return {
      chart: null
    }
  },
  mounted () {
    this.$nextTick(() => {
      this.initChart()
    })
  },
  beforeDestroy () {
    if (!this.chart) {
      return
    }
    this.chart.dispose()
    this.chart = null
  },
  methods: {
    initChart () {
      this.chart = echarts.init(this.$el, 'macarons')

      this.chart.setOption({
        tooltip: {
          trigger: 'axis',
          axisPointer: { // 坐标轴指示器，坐标轴触发有效
            type: 'shadow' // 默认为直线，可选为：'line' | 'shadow'
          }
        },
        grid: {
          top: 10,
          left: '2%',
          right: '2%',
          bottom: '3%',
          containLabel: true
        },
        xAxis: [{
          type: 'category',
          data: ['董星', '陈曦东', '夏勇杰', '孙政', '潘小丽', '浦婷', '陆小杰'],
          axisTick: {
            alignWithLabel: true
          }
        }],
        yAxis: [{
          type: 'value',
          axisTick: {
            show: false
          }
        }],
        series: [{
          name: '项目A',
          type: 'bar',
          stack: 'vistors',
          barWidth: '60%',
          data: [5, 10, 20, 23, 25, 20, 56],
          animationDuration
        }, {
          name: '项目B',
          type: 'bar',
          stack: 'vistors',
          barWidth: '60%',
          data: [15, 21, 22, 23, 54, 45, 12],
          animationDuration
        }, {
          name: '项目C',
          type: 'bar',
          stack: 'vistors',
          barWidth: '60%',
          data: [20, 20, 10, 6, 12, 20, 13],
          animationDuration
        }]
      })
    }
  }
}
</script>
