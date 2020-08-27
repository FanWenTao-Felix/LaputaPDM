import layoutHeaderAside from '@/layout/header-aside'

// 由于懒加载页面太多的话会造成webpack热更新太慢，所以开发环境不使用懒加载，只有生产环境使用懒加载
const _import = require('@/libs/util.import.' + process.env.NODE_ENV)

const meta = { auth: true }

export default {
  path: '/admin',
  name: 'admin',
  meta,
  redirect: { name: 'admin-index' },
  component: layoutHeaderAside,
  children: (pre => [
    {
      path: 'user/index',
      name: `${pre}user`,
      component: _import('admin/user/index.vue'),
      meta: { ...meta, title: '用户管理' }
    },
    {
      path: 'group/index',
      name: `${pre}group`,
      component: _import('admin/group/index.vue'),
      meta: { ...meta, title: '用户组管理' }
    },
    {
      path: 'role/index',
      name: `${pre}role`,
      component: _import('admin/role/index.vue'),
      meta: { ...meta, title: '角色管理' }
    },
    {
      path: 'menu/index',
      name: `${pre}menu`,
      component: _import('admin/menu/index.vue'),
      meta: { ...meta, title: '菜单管理' }
    },
    {
      path: 'permission/index',
      name: `${pre}permission`,
      component: _import('admin/permission/index.vue'),
      meta: { ...meta, title: '权限管理' }
    },
    {
      path: 'dept/index',
      name: `${pre}dept`,
      component: _import('admin/dept/index.vue'),
      meta: { ...meta, title: '部门管理' }
    },
    {
      path: 'file/index',
      name: `${pre}file`,
      component: _import('admin/file/index.vue'),
      meta: { ...meta, title: '文档管理' }
    },
    {
      path: 'log/index',
      name: `${pre}log`,
      component: _import('admin/log/index.vue'),
      meta: { ...meta, title: '日志管理' }
    },
    {
      path: 'route/index',
      name: `${pre}route`,
      component: _import('admin/route/index.vue'),
      meta: { ...meta, title: '路由管理' }
    },
    {
      path: 'param/index',
      name: `${pre}param`,
      component: _import('admin/param/index.vue'),
      meta: { ...meta, title: '参数设置' }
    },
    {
      path: 'dict/index',
      name: `${pre}dict`,
      component: _import('admin/dict/index.vue'),
      meta: { ...meta, title: '数据字典' }
    },
    {
      path: 'system/index',
      name: `${pre}system`,
      component: _import('admin/wel.vue'),
      meta: { ...meta, title: '系统信息' }
    },
    {
      path: 'tenant/index',
      name: `${pre}tenant`,
      component: _import('admin/tenant/index'),
      meta: { ...meta, title: '租户管理' }
    },
    {
      path: 'social/index',
      name: `${pre}social`,
      component: _import('admin/social/index'),
      meta: { ...meta, title: '密钥管理' }
    },
    {
      path: 'token/index',
      name: `${pre}token`,
      component: _import('admin/token/index'),
      meta: { ...meta, title: '令牌管理' }
    },
    {
      path: 'client/index',
      name: `${pre}client`,
      component: _import('admin/client/index'),
      meta: { ...meta, title: '终端信息' }
    }

  ])('admin-')
}
