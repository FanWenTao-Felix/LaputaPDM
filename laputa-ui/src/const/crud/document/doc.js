export const tableOption = {
  border: true,
  card: true,
  index: true,
  indexLabel: '序号',
  stripe: true,
  menu: true,
  menuAlign: 'center',
  filterBtn: false,
  menuWidth: 300,
  align: 'center',
  viewBtn: false,
  editBtn: false,
  delBtn: false,
  addBtn: false,
  dialogWidth: '85%',
  labelWidth: 130,
  dialogHeight: '78%',
  column: [
    {
      label: 'jobId',
      prop: 'jobId',
      hide: true,
      addDisplay: false,
      editDisplay: false,
      rules:
          [{
            required: true,
            message: '请输入任务类型',
            trigger: 'blur'
          }]
    },
    {
      label: '任务名称',
      prop: 'jobName',
      search: true,
      placeholder: '任务名称',
      rules: [{
        required: true,
        message: '请输入任务名称',
        trigger: 'blur'
      }],
      editDisabled: true
    },
    {
      label: '任务组名',
      prop: 'jobGroup',
      search: true,
      rules:
          [{
            required: true,
            message: '请输入任务组名',
            trigger: 'blur'
          }],
      editDisabled: true
    },
    {
      label: '任务状态',
      prop: 'jobStatus',
      type: 'select',
      dicUrl: '/admin/dict/type/job_status',
      addDisplay: false,
      search: true,
      slot: true
    },
    {
      label: '执行状态',
      prop: 'jobExecuteStatus',
      type: 'select',
      dicUrl: '/admin/dict/type/job_execute_status',
      addDisplay: false,
      search: true,
      slot: true
    },
    {
      label: '创建者',
      prop: 'createBy',
      hide: true,
      addDisplay: false,
      editDisplay: false
    },
    {
      label: '创建时间',
      prop: 'createTime',
      type: 'datetime',
      hide: true,
      format: 'yyyy-MM-dd HH:mm:ss',
      valueFormat: 'yyyy-MM-dd HH:mm:ss',
      width: 120,
      addDisplay: false,
      editDisplay: false
    },
    {
      label: '更新者',
      prop: 'updateBy',
      hide: true,
      addDisplay: false,
      editDisplay: false
    },
    {
      label: '更新时间',
      prop: 'updateTime',
      type: 'datetime',
      hide: true,
      format: 'yyyy-MM-dd HH:mm:ss',
      valueFormat: 'yyyy-MM-dd HH:mm:ss',
      width: 160,
      addDisplay: false,
      editDisplay: false
    },
    {
      label: '首次执行时间',
      prop: 'startTime',
      type: 'datetime',
      format: 'yyyy-MM-dd HH:mm:ss',
      valueFormat: 'yyyy-MM-dd HH:mm:ss',
      width: 160,
      addDisplay: false,
      editDisabled: true
    }, {
      label: '上次执行时间',
      prop: 'previousTime',
      type: 'datetime',
      format: 'yyyy-MM-dd HH:mm:ss',
      valueFormat: 'yyyy-MM-dd HH:mm:ss',
      width: 160,
      addDisplay: false,
      editDisabled: true
    }, {
      label: '下次执行时间',
      prop: 'nextTime',
      type: 'datetime',
      format: 'yyyy-MM-dd HH:mm:ss',
      valueFormat: 'yyyy-MM-dd HH:mm:ss',
      width: 160,
      addDisplay: false,
      editDisabled: true
    },
    {
      label: '组内顺序',
      prop: 'jobOrder',
      hide: true,
      addDisplay: false,
      editDisplay: false,
      type: 'silder',
      step: 1,
      min: 1,
      max: 9,
      showStops: true
    },
    {
      label: '类型',
      prop: 'jobType',
      type: 'select',
      dicUrl: '/admin/dict/type/job_type',
      width: 100,
      rules:
          [{
            required: true,
            message: '请输入任务类型',
            trigger: 'blur'
          }]
    },
    {
      label: '执行路径',
      prop: 'executePath',
      overHidden: true
    },
    {
      label: '执行文件',
      prop: 'className',
      overHidden: true
    },
    {
      label: '执行方法',
      prop: 'methodName',
      overHidden: true,
      width: 120
    },
    {
      label: '执行参数值',
      prop: 'methodParamsValue',
      width: 100,
      overHidden: true
    },
    {
      label: 'cron表达式',
      prop: 'cronExpression',
      width: 100,
      formslot: true,
      rules:
          [{
            required: true,
            max: 200,
            message: '请输入cron表达式',
            trigger: 'change'
          }]
    },
    {
      label: '错失执行策略',
      prop: 'misfirePolicy',
      type: 'select',
      dicUrl: '/admin/dict/type/misfire_policy',
      width: 120,
      rules:
          [{
            required: true,
            message: '请输入任务错失执行策略',
            trigger: 'blur'
          }]
    },
    {
      label: '租户',
      prop: 'tenantId',
      hide: true,
      addDisplay: false,
      editDisplay: false
    },
    {
      label: '备注信息',
      prop: 'remark',
      type: 'textarea',
      span: 20,
      overHidden: true,
      rules:
          [{
            max: 500,
            message: '备注信息不得超过500',
            trigger: 'blur'
          }]
    }
  ]
}
const _TB = 1024 * 1024 * 1024 * 1024
const _GB = 1024 * 1024 * 1024
const _KB = 1024
const _MB = 1024 * 1024
export const fileTableColumns = [
  {
    label: '名称',
    prop: 'name',
    minWidth: 200
  },
  {
    label: '类型',
    align: 'center',
    width: 60,
    prop: 'suffix',
    formatter (row) {
      return row.type === 1 ? '文件夹' : row.suffix
    }
  },
  {
    label: '大小',
    minWidth: 100,
    align: 'center',
    prop: 'size',
    formatter (row) {
      if (row.size === null) return '-'
      if (row.size < _KB) {
        // 1024以下显示kb
        return row.size + 'B'
      }
      if (row.size < _MB) {
        const _mb = (row.size / _KB).toFixed(2)
        return parseFloat(_mb) + 'KB'
      }
      if (row.size < _GB) {
        const _mb = (row.size / _MB).toFixed(2)
        return parseFloat(_mb) + 'MB'
      }
      if (row.size < _TB) {
        const _mb = (row.size / _GB).toFixed(2)
        return parseFloat(_mb) + 'GB'
      }
      const _gb = (row.size / _TB).toFixed(2)
      return parseFloat(_gb) + 'TB'
    }
  },
  {
    label: '关键字',
    align: 'center',
    width: 200,
    prop: 'keywords',
    formatter (row) {
      return row.keywords || '-'
    }
  },
  {
    label: '创建日期',
    align: 'center',
    width: 120,
    prop: 'createTime',
    formatter (row) {
      return row.createTime.split('t')[0] || '-'
    }
  },
  {
    label: '作者',
    minWidth: 80,
    align: 'center',
    prop: 'createUsername',
    formatter (row) {
      return row.createUsername || '-'
    }
  },
  {
    label: '描述',
    minWidth: 150,
    prop: 'describe',
    formatter (row) {
      return row.describe || '-'
    }
  },
  {
    label: '状态',
    align: 'center',
    width: 80,
    prop: 'status',
    formatter (row) {
      return row.status || 0
    }
  },
  {
    label: '版本',
    minWidth: 80,
    align: 'center',
    prop: 'version',
    formatter (row) {
      return row.version || '-'
    }
  }
]
export const tableLogOption = {
  border: true,
  index: false,
  menu: false,
  page: true,
  indexLabel: '序号',
  stripe: true,
  filterBtn: false,
  editBtn: false,
  delBtn: false,
  addBtn: false,
  columnBtn: false,
  column: [
    {
      label: 'id',
      prop: 'jobLogId',
      hide: true
    },
    {
      label: '任务id',
      prop: 'jobId',
      hide: true
    },
    {
      label: '任务名称',
      prop: 'jobName'
    },
    {
      label: '任务组名',
      prop: 'jobGroup'
    },
    {
      label: '状态',
      prop: 'jobLogStatus',
      type: 'select',
      dicUrl: '/admin/dict/type/job_execute_status',
      slot: true
    },
    {
      label: '组内顺序',
      prop: 'jobOrder',
      hide: true
    },
    {
      label: '类型',
      prop: 'jobType',
      type: 'select',
      dicUrl: '/admin/dict/type/job_type',
      width: 100
    },
    {
      label: '执行路径',
      prop: 'executePath',
      overHidden: true
    },
    {
      label: '执行文件',
      prop: 'className',
      overHidden: true
    },
    {
      label: '执行方法',
      prop: 'methodName',
      overHidden: true,
      width: 120
    },
    {
      label: '执行参数值',
      prop: 'methodParamsValue',
      width: 100,
      overHidden: true
    },
    {
      label: 'cron表达式',
      prop: 'cronExpression',
      width: 100,
      overHidden: true
    },
    {
      label: '状态描述',
      prop: 'jobMessage'
    },
    {
      label: '执行时间(ms)',
      prop: 'executeTime',
      width: 120
    },
    {
      label: '异常信息',
      prop: 'exceptionInfo',
      overHidden: true
    },
    {
      label: '开始时间',
      prop: 'createTime',
      type: 'datetime',
      format: 'yyyy-MM-dd HH:mm:ss',
      valueFormat: 'yyyy-MM-dd HH:mm:ss',
      width: 160
    }
  ]
}
