const VueFilenameInjector = require('@d2-projects/vue-filename-injector')

const ThemeColorReplacer = require('webpack-theme-color-replacer')
const forElementUI = require('webpack-theme-color-replacer/forElementUI')

// 拼接路径
const resolve = dir => require('path').join(__dirname, dir)

// 增加环境变量
process.env.VUE_APP_VERSION = require('./package.json').version
process.env.VUE_APP_BUILD_TIME = require('dayjs')().format('YYYY-M-D HH:mm:ss')

// 基础路径 注意发布之前要先修改这里
// let publicPath = process.env.VUE_APP_PUBLIC_PATH || '/'
// const newUrl = 'http://39.105.72.237:10000'
const url = 'http://127.0.0.1:10000'
module.exports = {
  // 根据你的实际情况更改这里
  // publicPath,
  lintOnSave: true,
  devServer: {
    disableHostCheck: true,
    port: 7812,
    proxy: {
      '/': {
        target: url,
        ws: false, // 需要websocket 开启
        pathRewrite: {
          '^/': '/'
        }
      }
    }
    // proxy: {
    //   '/auth': {
    //     target: url,
    //     ws: true,
    //     pathRewrite: {
    //       '^/auth': '/auth'
    //     }
    //   },
    //   '/admin': {
    //     target: url,
    //     ws: true,
    //     pathRewrite: {
    //       '^/admin': '/admin'
    //     }
    //   },
    //   '/code': {
    //     target: url,
    //     ws: true,
    //     pathRewrite: {
    //       '^/code': '/code'
    //     }
    //   },
    //   '/gen': {
    //     target: url,
    //     ws: true,
    //     pathRewrite: {
    //       '^/gen': '/gen'
    //     }
    //   },
    //   '/actuator': {
    //     target: url,
    //     ws: true,
    //     pathRewrite: {
    //       '^/actuator': '/actuator'
    //     }
    //   },
    //   '/monitor': {
    //     target: url,
    //     ws: true,
    //     pathRewrite: {
    //       '^/monitor': '/monitor'
    //     }
    //   },
    //   '/mp': {
    //     target: url,
    //     ws: true,
    //     pathRewrite: {
    //       '^/mp': '/mp'
    //     }
    //   },
    //   '/daemon': {
    //     target: url,
    //     ws: true,
    //     pathRewrite: {
    //       '^/daemon': '/daemon'
    //     }
    //   },
    //   '/job': {
    //     target: url,
    //     ws: true,
    //     pathRewrite: {
    //       '^/job': '/job'
    //     }
    //   },
    //   '/tx': {
    //     target: url,
    //     ws: true,
    //     pathRewrite: {
    //       '^/tx': '/tx'
    //     }
    //   },
    //   '/pay': {
    //     target: url,
    //     ws: true,
    //     pathRewrite: {
    //       '^/pay': '/pay'
    //     }
    //   },
    //   '/act': {
    //     target: url,
    //     ws: true,
    //     pathRewrite: {
    //       '^/act': '/act'
    //     }
    //   },
    //   '/doc': {
    //     target: url,
    //     ws: true,
    //     pathRewrite: {
    //       '^/doc': '/doc'
    //     }
    //   }
    // }
  },
  css: {
    loaderOptions: {
      // 设置 scss 公用变量文件
      sass: {
        data: `@import '~@/assets/style/public.scss';`
      }
    }
  },
  // 默认设置: https://github.com/vuejs/vue-cli/tree/dev/packages/%40vue/cli-service/lib/config/base.js
  chainWebpack: config => {
    /**
     * 删除懒加载模块的 prefetch preload，降低带宽压力
     * https://cli.vuejs.org/zh/guide/html-and-static-assets.html#prefetch
     * https://cli.vuejs.org/zh/guide/html-and-static-assets.html#preload
     * 而且预渲染时生成的 prefetch 标签是 modern 版本的，低版本浏览器是不需要的
     */
    config.plugins
      .delete('prefetch')
      .delete('preload')
    // 解决 cli3 热更新失效 https://github.com/vuejs/vue-cli/issues/1559
    config.resolve
      .symlinks(true)
    config
      .plugin('theme-color-replacer')
      .use(ThemeColorReplacer, [{
        fileName: 'css/theme-colors.[contenthash:8].css',
        matchColors: [
          ...forElementUI.getElementUISeries(process.env.VUE_APP_ELEMENT_COLOR) // Element-ui主色系列
        ],
        externalCssFiles: ['./node_modules/element-ui/lib/theme-chalk/index.css'], // optional, String or string array. Set external css files (such as cdn css) to extract colors.
        changeSelector: forElementUI.changeSelector
      }])
    config
      // 开发环境
      .when(process.env.NODE_ENV === 'development',
        // sourcemap不包含列信息
        config => config.devtool('cheap-source-map')
      )
      // TRAVIS 构建 vue-loader 添加 filename
      .when(process.env.VUE_APP_SCOURCE_LINK === 'TRUE',
        VueFilenameInjector(config, {
          propName: process.env.VUE_APP_SOURCE_VIEWER_PROP_NAME
        })
      )
    // markdown
    config.module
      .rule('md')
      .test(/\.md$/)
      .use('text-loader')
      .loader('text-loader')
      .end()
    // set svg-sprite-loader
    config.module
      .rule('svg')
      .exclude.add(resolve('src/icons'))
      .end()
    config.module
      .rule('icons')
      .test(/\.svg$/)
      .include.add(resolve('src/icons'))
      .end()
      .use('svg-sprite-loader')
      .loader('svg-sprite-loader')
      .options({
        symbolId: 'icon-[name]'
      })
      .end()
    // svg
    // const svgRule = config.module.rule('svg')
    // svgRule.uses.clear()
    // svgRule
    //   .include
    //   .add(resolve('src/assets/svg-icons/icons'))
    //   .end()
    //   .use('svg-sprite-loader')
    //   .loader('svg-sprite-loader')
    //   .options({
    //     symbolId: 'd2-[name]'
    //   })
    //   .end()
    // // image exclude
    // const imagesRule = config.module.rule('images')
    // imagesRule
    //   .test(/\.(png|jpe?g|gif|webp|svg)(\?.*)?$/)
    //   .exclude
    //   .add(resolve('src/assets/svg-icons/icons'))
    //   .end()
    // 重新设置 alias
    config.resolve.alias
      .set('@api', resolve('src/api'))
    // // 判断环境加入模拟数据
    // const entry = config.entry('app')
    // if (process.env.VUE_APP_BUILD_MODE !== 'NOMOCK') {
    //   entry
    //     .add('@/mock')
    //     .end()
    // }
  },
  // i18n
  pluginOptions: {
    i18n: {
      locale: 'zh-chs',
      fallbackLocale: 'en',
      localeDir: 'locales',
      enableInSFC: true
    }
  }
}
