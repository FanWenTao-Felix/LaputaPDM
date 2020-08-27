<template>
  <div class="q-pa-sm">
    <gantt-elastic
      :options="options"
      :tasks="tasks"
      @tasks-changed="tasksUpdate"
      @options-changed="optionsUpdate"
      @dynamic-style-changed="styleUpdate"
    >
      <gantt-header
              :options="options"
              slot="header"></gantt-header>
    </gantt-elastic>

    <el-button @click="addTask"  label="Add task">添加任务</el-button>
  </div>
</template>

<style>
</style>

<script>
import GanttElastic from 'gantt-elastic'
import GanttHeader from 'gantt-elastic-header'
import dayjs from 'dayjs'

// just helper to get current dates
function getDate (hours) {
  const currentDate = new Date()
  const currentYear = currentDate.getFullYear()
  const currentMonth = currentDate.getMonth()
  const currentDay = currentDate.getDate()
  const timeStamp = new Date(
    currentYear,
    currentMonth,
    currentDay,
    0,
    0,
    0
  ).getTime()
  return new Date(timeStamp + hours * 60 * 60 * 1000).getTime()
}
const tasks = [
  {
    id: 1,
    label: 'ET9818产品项目规划',
    user:
      '<a href="#"  style="color:#0077c0;">王国鹏</a>',
    start: getDate(-24 * 5),
    duration: 15 * 24 * 60 * 60 * 1000,
    percent: 85,
    type: 'project'
    //collapsed: true,
  },
  {
    id: 2,
    label: '电路设计，可测性设计，封装设计报告',
    user:
      '<a href="#"  style="color:#0077c0;">陈晖</a>',
    parentId: 1,
    start: getDate(-24 * 4),
    duration: 4 * 24 * 60 * 60 * 1000,
    percent: 50,
    type: 'milestone',
    collapsed: true,
    style: {
      base: {
        fill: '#1EBC61',
        stroke: '#0EAC51'
      }
    }
  },
  {
    id: 3,
    label: '确定工艺',
    user:
      '<a href="#"  style="color:#0077c0;">卢国云</a>',
    parentId: 2,
    start: getDate(-24 * 3),
    duration: 2 * 24 * 60 * 60 * 1000,
    percent: 100,
    type: 'task'
  },
  {
    id: 4,
    label: '分模块设计',
    user:
      '<a href="#"  style="color:#0077c0;">马永健</a>',
    start: getDate(-24 * 2),
    duration: 8 * 24 * 60 * 60 * 1000,
    percent: 50,
    type: 'milestone',
    dependentOn: [3]
  },
  {
    id: 5,
    label:
      'SPI总线模块制作',
    user:
      '<a href="#"  style="color:#0077c0;">吴尧</a>',
    parentId: 4,
    start: getDate(0),
    duration: 5 * 24 * 60 * 60 * 1000,
    percent: 60,
    type: 'task',
    style: {
      base: {
        fill: '#0287D0',
        stroke: '#0077C0'
      }
    }
  },
  {
    id: 6,
    label: 'SPI总线电路设计',
    user:
      '<a href="#"  style="color:#0077c0;">王鹏</a>',
    parentId: 5,
    start: getDate(24),
    duration: 3 * 24 * 60 * 60 * 1000,
    percent: 50,
    type: 'task',
    collapsed: true,
    style: {
      base: {
        fill: '#8E44AD',
        stroke: '#7E349D'
      }
    }
  },
  {
    id: 7,
    label: 'SPI总线RTL编程',
    user:
      '<a href="#"  style="color:#0077c0;">王鹏</a>',
    parentId: 6,
    start: getDate(24 * 1),
    duration: 2 * 24 * 60 * 60 * 1000,
    percent: 20,
    type: 'task',
    collapsed: true
  },
  {
    id: 8,
    label: 'SPI总线仿真',
    user:
      '<a href="#"  style="color:#0077c0;">李瑞林</a>',
    parentId: 6,
    dependentOn: [7],
    start: getDate(24 * 3),
    duration: 1 * 24 * 60 * 60 * 1000,
    percent: 0,
    type: 'task'
  },
  {
    id: 9,
    label: 'SPI总线综合',
    user:
      '<a href="#"  style="color:#0077c0;">王鹏</a>',
    parentId: 6,
    dependentOn: [8],
    start: getDate(24 * 4),
    duration: 4 * 60 * 60 * 1000,
    percent: 20,
    type: 'task'

  },
  {
    id: 10,
    label: 'SPI总线版图设计',
    user:
      '<a href="#"  style="color:#0077c0;">陆浩</a>',
    parentId: 4,
    dependentOn: [7],
    start: getDate(24 * 3),
    duration: 2 * 24 * 60 * 60 * 1000,
    percent: 0,
    type: 'task'
  },
  {

    id: 11,
    label: '综合电源设计',
    user:
      '<a href="#"  style="color:#0077c0;">屠国柱</a>',
    start: getDate(0),
    duration: 5 * 24 * 60 * 60 * 1000,
    percent: 40,
    parentId: 4,
    type: 'task',
    style: {
      base: {
        fill: '#0287D0',
        stroke: '#0077C0'
      }
    }
  },
  {
    id: 12,
    label: '综合电源线路设计',
    user:
      '<a href="#"  style="color:#0077c0;">刘晓敏</a>',
    start: getDate(24 * 1),
    duration: 2 * 24 * 60 * 60 * 1000,
    percent: 40,
    type: 'task',
    parentId: 11

  },
  {
    id: 13,
    label: '综合电源性能测试',
    user:
      '<a href="#"  style="color:#0077c0;">袁广睿</a>',
    start: getDate(24 * 3),
    duration: 2 * 24 * 60 * 60 * 1000,
    percent: 10,
    dependentOn: [12],
    type: 'task'
  },
  {
    id: 14,
    label: '测试规范，可靠性考核规范',
    user:
      '<a href="#s"  style="color:#0077c0;">陆小杰</a>',
    start: getDate(24 * 9),
    duration: 24 * 60 * 60 * 1000,
    percent: 0,
    type: 'task'
  },
  {
    id: 15,
    label: '产品说明书定稿，Approval Sheet',
    user:
      '<a href="#"  style="color:#0077c0;">朱俊丽</a>',
    start: getDate(24 * 16),
    duration: 24 * 60 * 60 * 1000,
    percent: 0,
    type: 'task'
  }
]
const options = {
  taskMapping: {
    progress: 'percent'
  },
  maxRows: 100,
  maxHeight: 500,
  title: {
    label: 'ET9818 项目运行图',
    html: false
  },
  row: {
    height: 24
  },
  calendar: {
    hour: {
      display: true
    }
  },
  chart: {
    progress: {
      bar: false
    },
    expander: {
      display: true
    }
  },
  taskList: {
    expander: {
      straight: false
    },
    columns: [
      {
        id: 1,
        label: '序号',
        value: 'id',
        width: 40
      },
      {
        id: 2,
        label: '任务描述',
        value: 'label',
        width: 200,
        expander: true,
        html: true,
        events: {
          click ({ data, column }) {
            alert('description clicked!\n' + data.label);
          }
        }
      },
      {
        id: 3,
        label: '负责人',
        value: 'user',
        width: 130,
        html: true
      },
      {
        id: 3,
        label: '开始时间',
        value: task => dayjs(task.start).format('YYYY-MM-DD'),
        width: 78
      },
      {
        id: 4,
        label: '类型',
        value: 'type',
        width: 68
      },
      {
        id: 5,
        label: '百分比%',
        value: 'progress',
        width: 68,
        style: {
          'task-list-header-label': {
            'text-align': 'center',
            width: '100%'
          },
          'task-list-item-value-container': {
            'text-align': 'center',
            width: '100%'
          }
        }
      }
    ]
  },
  locale: {
    name: 'zh',
    Now: '现在',
    'X-Scale': 'X 缩放',
    'Y-Scale': 'Y 缩放',
    'Task list width': '任务列表',
    'Before/After': '拓展',
    'Display task list': '任务列表',
    weekdays: '星期日_星期一_星期二_星期三_星期四_星期五_星期六'.split('_'),
    weekdaysShort: 'Sun_Mon_Tue_Wed_Thu_Fri_Sat'.split('_'),
    weekdaysMin: 'Su_Mo_Tu_We_Th_Fr_Sa'.split('_'),
    months: '一月_二月_三月_April_May_June_July_August_September_October_November_十二月'.split('_'),
    monthsShort: 'Jan_Feb_Mar_Apr_May_Jun_Jul_Aug_Sep_Oct_Nov_Dec'.split('_'),
    weekStart: 1,
    relativeTime: {
      future: 'in %s',
      past: '%s ago',
      s: 'a few seconds',
      m: 'a minute',
      mm: '%d minutes',
      h: 'an hour',
      hh: '%d hours',
      d: 'a day',
      dd: '%d days',
      M: 'a month',
      MM: '%d months',
      y: 'a year',
      yy: '%d years'
    },
    formats: {
      LT: 'HH:mm',
      LTS: 'HH:mm:ss',
      L: 'DD/MM/YYYY',
      LL: 'D MMMM YYYY',
      LLL: 'D MMMM YYYY HH:mm',
      LLLL: 'dddd, D MMMM YYYY HH:mm'
    }
  }

}

export default {
  name: 'Gantt',
  components: {
    GanttElastic,
    GanttHeader
  },
  data () {
    return {
      tasks,
      options,
      dynamicStyle: {},
      lastId: 16
    }
  },
  methods: {
    addTask () {
      this.tasks.push({
        id: this.lastId++,
        label:
          '<a href="https://images.pexels.com/photos/423364/pexels-photo-423364.jpeg?auto=compress&cs=tinysrgb&h=650&w=940"  style="color:#0077c0;">Yeaahh! you have added a task bro!</a>',
        user:
          '<a href="https://images.pexels.com/photos/423364/pexels-photo-423364.jpeg?auto=compress&cs=tinysrgb&h=650&w=940"  style="color:#0077c0;">Awesome!</a>',
        start: getDate(24 * 3),
        duration: 1 * 24 * 60 * 60 * 1000,
        percent: 50,
        type: 'project'
      })
    },
    tasksUpdate (tasks) {
      this.tasks = tasks
    },
    optionsUpdate (options) {
      this.options = options
    },
    styleUpdate (style) {
      this.dynamicStyle = style
    }
  }
}
</script>
