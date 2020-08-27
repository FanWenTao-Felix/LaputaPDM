import layoutHeaderAside from '@/layout/header-aside'

// 由于懒加载页面太多的话会造成webpack热更新太慢，所以开发环境不使用懒加载，只有生产环境使用懒加载
const _import = require('@/libs/util.import.' + process.env.NODE_ENV)

const meta = { auth: true }

export default {
  path: '/gen',
  name: 'gen',
  meta,
  // redirect: { name: 'activiti-index' },
  component: layoutHeaderAside,
  children: (pre => [
    {
      path: 'datasource',
      name: `${pre}datasource`,
      component: _import('gen/datasource.vue'),
      meta: { ...meta, title: '数据源管理' }
    },
    {
      path: 'index',
      name: `${pre}index`,
      component: _import('gen/index.vue'),
      meta: { ...meta, title: '代码生成' }
    },
    {
      path: 'design',
      name: `${pre}design`,
      component: _import('gen/design.vue'),
      meta: { ...meta, title: '表单设计' }
    },
    {
      path: 'form',
      name: `${pre}form`,
      component: _import('gen/form.vue'),
      meta: { ...meta, title: '表单管理' }
    }

  ])('gen-')
}
