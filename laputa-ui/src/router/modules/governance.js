import layoutHeaderAside from '@/layout/header-aside'

// 由于懒加载页面太多的话会造成webpack热更新太慢，所以开发环境不使用懒加载，只有生产环境使用懒加载
const _import = require('@/libs/util.import.' + process.env.NODE_ENV)

const meta = { auth: true }

export default {
  path: '/governance',
  name: 'governance',
  meta,
  redirect: { name: 'governance-index' },
  component: layoutHeaderAside,
  children: (pre => [
    {
      path: 'redis/index',
      name: `${pre}redis`,
      component: _import('governance/redis/index'),
      meta: { ...meta, title: '缓存监控' }
    },
    {
      path: 'monitor/index',
      name: `${pre}monitor`,
      component: _import('governance/monitor/index'),
      meta: { ...meta, title: '系统监控' }
    }
  ])('governance-')
}
