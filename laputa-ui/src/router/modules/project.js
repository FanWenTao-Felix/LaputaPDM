import layoutHeaderAside from '@/layout/header-aside'

// 由于懒加载页面太多的话会造成webpack热更新太慢，所以开发环境不使用懒加载，只有生产环境使用懒加载
const _import = require('@/libs/util.import.' + process.env.NODE_ENV)

const meta = { auth: true }

export default {
  path: '/project',
  name: 'project',
  meta,
  // redirect: { name: 'demo-playground-index' },
  component: layoutHeaderAside,
  children: (pre => [
    {
      path: 'kanban',
      name: `${pre}kanban`,
      component: _import('project/kanban/drag-kanban'),
      meta: { ...meta, title: 'Kanban' }
    },
    {
      path: 'list',
      name: `${pre}list`,
      component: _import('project/index'),
      meta: { ...meta, title: '项目列表' }
    },
    {
      path: 'new',
      name: `${pre}new`,
      component: _import('project/new'),
      meta: { ...meta, title: '创建项目' }
    },
    {
      path: 'gantt',
      name: `${pre}gantt`,
      component: _import('project/gantt/gantt'),
      meta: { ...meta, title: '项目任务分解' }
    }
  ])('project-')
}
