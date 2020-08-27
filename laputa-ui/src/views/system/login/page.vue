<template>
  <div class="page-login">
    <div class="page-login--layer page-login--layer-area">
      <ul class="circles">
        <li v-for="n in 10" :key="n"></li>
      </ul>
    </div>
    <div
            class="page-login--layer page-login--layer-time"
            flex="main:center cross:center">
      {{time}}
    </div>
    <div class="page-login--layer">
      <div
              class="page-login--content"
              flex="dir:top main:justify cross:center box:justify">
        <div class="page-login--content-header">
          <p class="page-login--content-header-motto">
            时间是一切财富中最宝贵的财富。 <span>—— 德奥弗拉斯多</span>
          </p>
        </div>
        <div
                class="page-login--content-main"
                flex="dir:top main:center cross:center">
          <!-- logo -->
          <div class="login-logo">
            <img src="/image/logo.png" alt="">
          </div>
          <p class="login-tip">{{ website.infoTitle}} V{{ website.version}}</p>
          <!-- 表单 -->
          <el-tabs v-model="activeName">
            <el-tab-pane label="用户密码登录" name="first">
              <div class="page-login--form">
                <el-card shadow="never">
                  <el-form ref="loginForm" label-position="top" :rules="rules" :model="formLogin" size="default">
                    <el-form-item prop="username">
                      <el-input type="text" v-model="formLogin.username" placeholder="请输入用户名">
                        <i slot="prepend" class="fa fa-user-circle-o"></i>
                      </el-input>
                    </el-form-item>
                    <el-form-item prop="password">
                      <el-input type="password" v-model="formLogin.password" placeholder="请输入密码">
                        <i slot="prepend" class="fa fa-keyboard-o"></i>
                      </el-input>
                    </el-form-item>
                    <el-form-item prop="code">
                      <el-input type="text" v-model="formLogin.code" placeholder="请输入验证码">
                        <template slot="prepend">验证码</template>
                        <template slot="append">
                          <img class="login-code" :src="code.src" @click="refreshCode">
                        </template>
                      </el-input>
                    </el-form-item>
                    <el-button size="default" @click="submit" type="primary" class="button-login">登录</el-button>
                  </el-form>
                </el-card>
              </div>
            </el-tab-pane>
            <el-tab-pane label="手机号登录" name="second">
              <div class="page-login--form">
                <el-card shadow="never">
                  <el-form ref="mobileForm" label-position="top" :rules="mobileRules" :model="mobileLogin" size="default">
                    <el-form-item prop="mobile">
                      <el-input type="text" v-model="mobileLogin.mobile" placeholder="请输入手机号">
                        <i slot="prepend" class="fa fa-mobile" style="font-size:22px"></i>
                      </el-input>
                    </el-form-item>
                    <el-form-item prop="code">
                      <el-input type="text" v-model="mobileLogin.code" placeholder="请输入4位验证码">
                        <template slot="append">
                          <el-button @click="sendMsg" :disabled="sms.isDisabled">{{sms.btnName}}</el-button>
                        </template>
                      </el-input>
                    </el-form-item>
                    <el-button size="default" @click="mobileSubmit" type="primary" class="button-login">登录</el-button>
                  </el-form>
                </el-card>
              </div>
            </el-tab-pane>
          </el-tabs>
          <p
                  class="page-login--options"
                  flex="main:justify cross:center">
            <span><d2-icon name="question-circle"/> 忘记密码</span>
            <span>注册用户</span>
          </p>
        </div>
        <div class="page-login--content-footer">
          <!-- <p class="page-login--content-footer-options">
            <a href="#">帮助</a>
            <a href="#">隐私</a>
            <a href="#">条款</a>
          </p> -->
          <p class="page-login--content-footer-copyright">
            Copyright <d2-icon name="copyright"/> 2019 LaputaPDM <a href="https://github.com/sommer78/LaputaPDMAdminUi">@github</a>
          </p>
        </div>
      </div>
    </div>
  </div>
</template>

<script>

import { randomLenNum } from '@/util/util'
import dayjs from 'dayjs'
import { mapActions, mapGetters } from 'vuex'
import './style.scss'
// import { getStore, setStore } from '@/util/store'
import localeMixin from '@/locales/mixin.js'
import request from '@/plugin/axios'


const MSGINIT = '发送验证码', MSGTIME = 60, MSGSCUCCESS = `${MSGTIME}秒后重发`


export default {
  mixins: [
    localeMixin
  ],
  data () {
    return {
      timeInterval: null,
      time: dayjs().format('HH:mm:ss'),
      // 快速选择用户
      dialogVisible: false,
      activeName: 'first',
      msgText: MSGINIT,
      msgTime: MSGTIME,
      // 表单
      formLogin: {
        username: 'admin',
        password: '123456',
        randomStr: '',
        code: ''
      },
      // 校验
      rules: {
        username: [
          { required: true, message: '请输入用户名', trigger: 'blur' }
        ],
        password: [
          { required: true, message: '请输入密码', trigger: 'blur' }
        ]
        // code: [
        //   { required: true, message: '请输入验证码', trigger: 'blur' }
        // ]
      },
      mobileLogin: {
        mobile: '17034642111',
        code: ''
      },
      mobileRules: {
        mobile: [
          { required: true, message: '请输入手机号', trigger: 'blur' },
          { pattern: /^1([38][0-9]|4[579]|5[0-3,5-9]|6[6]|7[0135678]|9[89])\d{8}$/, message: '手机号不合法', trigger: 'blur' }
        ],
        code: [
          { required: true, message: '请输入验证码', trigger: 'blur' }
        ]
      },
      code: {
        len: 4,
        src: ''
      },
      sms: {
        btnName: '发送短信',
        isDisabled: false,
        time: 60
      },
      users: [
        {
          name: 'Admin',
          username: 'admin',
          password: 'admin'
        },
        {
          name: 'Editor',
          username: 'editor',
          password: 'editor'
        },
        {
          name: 'User1',
          username: 'user1',
          password: 'user1'
        }
      ]
    }
  },
  computed: {
    ...mapGetters(['website', 'tagWel'])
  },
  mounted () {
    this.timeInterval = setInterval(() => {
      this.refreshTime()
    }, 1000)
    this.refreshCode()
  },
  beforeDestroy () {
    clearInterval(this.timeInterval)
  },
  methods: {
    ...mapActions('d2admin/account', [
      'login'
    ]),
    sendMsg () {
      request({
        url: '/admin/mobile/' + this.mobileLogin.mobile,
        method: 'get'
      }).then(response => {
        if (response.data.data) {
          this.$message.success('验证码发送成功')
        } else {
          this.$message.error(response.data.msg)
        }
      })


      const time = setInterval(() => {
        this.msgTime--
        this.msgText = MSGSCUCCESS.replace(`${time}`, this.msgTime)
        if (this.msgTime === 0) {
          this.msgTime = MSGTIME
          this.msgText = MSGINIT
          clearInterval(time)
        }
      }, 1000)
      // this.msgText = MSGSCUCCESS.replace(`${time}`, this.msgTime)
    },
    mobileSubmit () {
      console.info('mobileSubmit')
      this.$refs.mobileForm.validate(valid => {
        if (valid) {
          this.$store.dispatch('LoginByPhone', this.mobileLogin).then(() => {
            // this.$router.push({ path: this.tagWel.value })
            this.$router.replace(this.$route.query.redirect || '/')
          })
        }
      })
    },
    refreshCode () {
      this.formLogin.code = ''
      this.formLogin.randomStr = randomLenNum(this.code.len, true)
      this.code.src = `${this.codeUrl}?randomStr=${this.formLogin.randomStr}`
      // this.code.type === 'text' ? (this.code.value = randomLenNum(this.code.len)) : (this.code.src = `${this.codeUrl}?randomStr=${this.loginForm.randomStr}`)
    },
    refreshTime () {
      this.time = dayjs().format('HH:mm:ss')
    },
    /**
     * @description 接收选择一个用户快速登录的事件
     * @param {Object} user 用户信息
     */
    handleUserBtnClick (user) {
      this.formLogin.username = user.username
      this.formLogin.password = user.password
      this.submit()
    },
    /**
     * @description 提交表单
     */
    // 提交登录信息
    submit () {
      this.$refs.loginForm.validate((valid) => {
        if (valid) {
          // 登录
          this.$store.dispatch('LoginByUsername', this.formLogin).then(() => {
            // this.$router.push({ path: this.tagWel.value })
            console.info('login success')
            this.$router.replace(this.$route.query.redirect || '/')
          }).catch((err) => {
            console.error('login err', err)
            this.refreshCode()
          })
          // // 登录
          // // 注意 这里的演示没有传验证码
          // // 具体需要传递的数据请自行修改代码
          // this.login({
          //   username: this.formLogin.username,
          //   password: this.formLogin.password
          // })
          //   .then(() => {
          //     // 重定向对象不存在则返回顶层路径
          //     this.$router.replace(this.$route.query.redirect || '/')
          //   })
        } else {
          // 登录表单校验失败
          this.$message.error('表单校验失败，请检查')
        }
      })
    }
  }
}
</script>
