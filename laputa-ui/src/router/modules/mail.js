import layoutHeaderAside from '@/layout/header-aside'

// 由于懒加载页面太多的话会造成webpack热更新太慢，所以开发环境不使用懒加载，只有生产环境使用懒加载
const _import = require('@/libs/util.import.' + process.env.NODE_ENV)

const meta = { auth: true }

export default {
  path: '/mail',
  name: 'mail',
  meta,
  // redirect: { name: 'activiti-index' },
  component: layoutHeaderAside,
  children: (pre => [
    {
      path: 'inbox',
      name: `${pre}inbox`,
      component: _import('mail/inbox/index.vue'),
      meta: { ...meta, title: '接收邮件' }
    },
    {
      path: 'contacts',
      name: `${pre}contacts`,
      component: _import('mail/contact/index.vue'),
      meta: { ...meta, title: '通讯录' }
    },
    {
      path: 'send',
      name: `${pre}send`,
      component: _import('mail/send/index.vue'),
      meta: { ...meta, title: '发送邮件' }
    },
    {
      path: 'detail',
      name: `${pre}detail`,
      component: _import('mail/detail/index.vue'),
      meta: { ...meta, title: '邮件详情' }
    }

  ])('mail-')
}
