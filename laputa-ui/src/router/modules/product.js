import layoutHeaderAside from '@/layout/header-aside'

// 由于懒加载页面太多的话会造成webpack热更新太慢，所以开发环境不使用懒加载，只有生产环境使用懒加载
const _import = require('@/libs/util.import.' + process.env.NODE_ENV)

const meta = { auth: true }

export default {
  path: '/product',
  name: 'product',
  meta,
  // redirect: { name: 'demo-playground-index' },
  component: layoutHeaderAside,
  children: (pre => [
    {
      path: 'index',
      name: `${pre}index`,
      component: _import('product/index'),
      meta: { ...meta, title: '产品列表' }
    },
    {
      path: 'construct',
      name: `${pre}construct`,
      component: _import('product/construction'),
      meta: { ...meta, title: '产品结构' }
    },
    {
      path: 'edit',
      name: `${pre}edit`,
      component: _import('product/diagram'),
      meta: { ...meta, title: '产品结构图' }
    }
  ])('product-')
}
