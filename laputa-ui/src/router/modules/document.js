import layoutHeaderAside from '@/layout/header-aside'

// 由于懒加载页面太多的话会造成webpack热更新太慢，所以开发环境不使用懒加载，只有生产环境使用懒加载
const _import = require('@/libs/util.import.' + process.env.NODE_ENV)

const meta = { auth: true }

export default {
  path: '/document',
  name: 'document',
  meta,
  redirect: { name: 'document-index' },
  component: layoutHeaderAside,
  children: (pre => [
    {
      path: 'index',
      name: `${pre}index`,
      component: _import('document/index.vue'),
      meta: { ...meta, title: '文件列表' }
    },
    {
      path: 'mimetype',
      name: `${pre}mimetype`,
      component: _import('document/docmimetype/index.vue'),
      meta: { ...meta, title: '文件类型' }
    },
    {
      path: 'previewer',
      name: `${pre}previewer`,
      component: _import('document/previewer.vue'),
      meta: { ...meta, title: '文件预览' }
    }

  ])('document-')
}
