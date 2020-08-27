import layoutHeaderAside from '@/layout/header-aside'

// 由于懒加载页面太多的话会造成webpack热更新太慢，所以开发环境不使用懒加载，只有生产环境使用懒加载
const _import = require('@/libs/util.import.' + process.env.NODE_ENV)

const meta = { auth: true }

export default {
  path: '/activiti',
  name: 'activiti',
  meta,
  // redirect: { name: 'activiti-index' },
  component: layoutHeaderAside,
  children: (pre => [
    {
      path: 'index',
      name: `${pre}index`,
      component: _import('activiti/index.vue'),
      meta: { ...meta, title: '模型管理' }
    },
    {
      path: 'bpmn',
      name: `${pre}bpmn`,
      component: _import('activiti/bpmn.vue'),
      meta: { ...meta, title: '模型布局' }
    },
    {
      path: 'detail',
      name: `${pre}detail`,
      component: _import('activiti/detail.vue'),
      meta: { ...meta, title: '模型细节' }
    },
    {
      path: 'leave',
      name: `${pre}leave`,
      component: _import('activiti/leave.vue'),
      meta: { ...meta, title: '请假管理' }
    },
    {
      path: 'process',
      name: `${pre}process`,
      component: _import('activiti/process.vue'),
      meta: { ...meta, title: '流程管理' }
    },
    {
      path: 'task',
      name: `${pre}task`,
      component: _import('activiti/task.vue'),
      meta: { ...meta, title: '代办事项' }
    }

  ])('activiti-')
}
