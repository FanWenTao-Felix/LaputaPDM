<template>
  <d2-container class="page">

      <el-row :gutter="8">
          <el-col :xs="{span: 24}" :sm="{span: 12}" :md="{span: 12}" :lg="{span: 6}" :xl="{span: 6}" style="margin-bottom:30px;">
              <box-card />
          </el-col>
          <el-col :xs="24" :sm="24" :lg="8">
              <div class="chart-wrapper">
                  <bar-chart />
              </div>
          </el-col>
          <el-col :xs="24" :sm="24" :lg="8">
              <div class="chart-wrapper">
                  <raddar-chart />
              </div>
          </el-col>
      </el-row>


      <panel-group  />

      <el-row :gutter="32">

          <el-col :xs="{span: 24}" :sm="{span: 24}" :md="{span: 24}" :lg="{span: 12}" :xl="{span: 12}" style="padding-right:8px;margin-bottom:30px;">
              <project-table />
          </el-col>
          <el-col :xs="{span: 24}" :sm="{span: 12}" :md="{span: 12}" :lg="{span: 6}" :xl="{span: 6}" style="margin-bottom:30px;">
              <todo-list :todos="todos" />
          </el-col>

      </el-row>

      <div class="unread-mail-container">
          <div class="unread-mail-title">事件列表</div>
          <div class="unread-mail-wrapper" >
              <template v-if="unreadMails.length!=0">
                  <div class="unread-mail-item" v-for="mail in unreadMails" :key="mail.id">
                            <span class="unread-mail-content" @click="toUnreadMail(mail.title)">
                                {{mail.title}}
                            </span>
                      <el-tag type="danger">{{mail.receiveDate | parseTime('{m}-{d} {h}:{i}')}}</el-tag>
                      <el-tag type="primary">{{mail.sendName}}</el-tag>
                  </div>

              </template>
              <template v-else>
                  <div class="unread-mail-emptyTitle">所有邮件都被你读过了</div>
              </template>
          </div>
      </div>


  </d2-container>

</template>

<script>

import PanelGroup from './components/PanelGroup'
import RaddarChart from './components/RaddarChart'
// import PieChart from './components/PieChart'
import BarChart from './components/BarChart'
import TodoList from '@/components/TodoList'
import BoxCard from './components/BoxCard'
import ProjectTable from './components/ProjectTable'


import { fetchUnReadList } from '@/api/mail/inbox'

import 'vue-organization-chart/dist/orgchart.css'


const defalutList = [
  { text: 'ET6326项目验证', done: false },
  { text: 'ET6332新品计划', done: false },
  { text: 'ET5443产品质量报告', done: false },
  { text: '数字产品类型定义', done: true },
  { text: '5G新技术学习', done: true }
]
export default {
  components: {
    RaddarChart,
    PanelGroup,
    TodoList,
    BoxCard,
    BarChart,
    ProjectTable
  },
  data () {
    return {
      ds: {
        'id': '1',
        'name': 'Lao Lao',
        'title': 'general manager',
        'children': [
          { 'id': '2', 'name': 'Bo Miao', 'title': 'department manager' },
          { 'id': '3',
            'name': 'Su2 Miao',
            'title': 'department2 manager',
            'children': [
              { 'id': '4', 'name': 'Tie Hua', 'title': 'senior engineer' },
              { 'id': '5',
                'name': 'Hei Hei',
                'title': 'senior engineer',
                'children': [
                  { 'id': '6', 'name': 'Pang Pang', 'title': 'engineer' },
                  { 'id': '7', 'name': 'Xiang Xiang', 'title': 'UE engineer' }
                ]
              }
            ]
          },
          { 'id': '8', 'name': 'Hong Miao', 'title': 'department manager' },
          { 'id': '9', 'name': 'Chun Miao', 'title': 'department manager' }
        ]
      },
      todos: defalutList,
      msg: '',
      client: '',
      filename: __filename,
      unreadList: []
    }
  },
  created () {
    this.fetchData()

  },
  computed: {
    unreadMails () {
      return this.unreadList.slice(0, 5)
    }
  },
  methods: {
    fetchData () {
      fetchUnReadList().then(res => {
        // console.info('resp:' + res.data.items)
        this.unreadList = res.data.items
      })
    },
    toUnreadMail (id) {
      this.$store.commit('SET_MAIL_TYPE', 'receive')
      this.$router.push({ path: '/mail_detail/index/' + id })
    }

  }


}
</script>

<style lang="scss" scoped>
    .vuecal__event.leisure {background-color: rgba(253, 156, 66, 0.9);border: 1px solid rgb(233, 136, 46);color: #fff;}
    .vuecal__event.sport {background-color: rgba(255, 102, 102, 0.9);border: 1px solid rgb(235, 82, 82);color: #fff;}
    .dashboard-editor-container {
        padding: 32px;
        background-color: rgb(240, 242, 245);
        position: relative;

        .github-corner {
            position: absolute;
            top: 0px;
            border: 0;
            right: 0;
        }

        .chart-wrapper {
            background: #fff;
            padding: 16px 16px 0;
            margin-bottom: 32px;
        }
    }

    @media (max-width:1024px) {
        .chart-wrapper {
            padding: 8px;
        }
    }
    .unread-mail-emptyTitle {
        font-size: 16px;
        color: #F38181;
        padding-top: 20px;
        text-align: center;
    }
    .dashboard-container {
        &:hover {
            background-color: blue;
        }
        padding: 20px 50px;
        .pan-info-roles {
            font-size: 12px;
            font-weight: 700;
            color: #333;
            display: block;
        }
        .info-container {
            position: relative;
            margin-left: 190px;
            height: 150px;
            line-height: 200px;
            .display_name {
                font-size: 48px;
                line-height: 48px;
                color: #212121;
                position: absolute;
                top: 25px;
            }
            .info-wrapper {
                line-height: 40px;
                position: absolute;
                bottom: 0px;
                .info-item {
                    display: inline-block;
                    margin-right: 95px;
                    .info-item-num {
                        color: #212121;
                        font-size: 24px;
                        display: inline-block;
                        padding-right: 5px;
                    }
                    .info-item-text {
                        color: #727272;
                        font-size: 14px;
                        padding-right: 5px;
                        display: inline-block;
                    }
                }
            }
            .dashboard-icon {
                width: 22px;
                height: 22px;
            }
        }
        .btn-group {
            margin: 30px 36px 30px 0;
        }
        .main-dashboard-container {
            width: 100%;
            position: relative;
            border: 1px solid #DEE1E2;
            padding: 0 10px;
        }
        .chart-container {
            float: left;
            position: relative;
            padding-right: 10px;
            width: 40%;
            border-right: 1px solid #DEE1E2;
        }

    }
    .unread-mail-container {
        padding: 12px 12px 0px;
        float: left;
        width: 40%;
        height: 380px;
        position: relative;

        .unread-mail- {
            &title {
                font-size: 16px;
                color: #F38181;
                letter-spacing: 1px;
                padding-left: 15px;
                padding-bottom: 10px;
                border-bottom: 1px solid #DEE1E2;
            }
            &more {
                color: #2C3E50;
                font-size: 12px;
                float: right;
                margin-right: 25px;
                line-height: 40px;
                &:hover {
                    color: #3A71A8;
                }
            }
            &wrapper {

                padding: 0 20px 0 22px;
                .unread-mail- {
                    &item {

                        cursor: pointer;
                        padding: 16px 8px 16px 16px;
                        border-bottom: 1px solid #DEE1E2;
                        position: relative;
                        .el-tag {
                            margin: 0 3px;
                        }
                        &:before {
                            content: "";
                            height: 90%;
                            width: 3px;
                            background: #F38181;
                            display: inline-block;
                            position: absolute;
                            opacity: 1;
                            left: 0px;
                            top: 5px;
                            transition: 0.3s ease all;
                        }
                        &:hover {
                            &:before {
                                content: "";
                                height: 90%;
                                width: 3px;
                                background: #30B08F;
                                display: inline-block;
                                position: absolute;
                                opacity: 1;
                                left: 0px;
                                top: 5px;
                                transition: 0.3s ease all;
                            }
                        }
                    }
                    &status {
                        font-size: 12px;
                        display: inline-block;
                        color: #9B9B9B;
                        padding-right: 6px;
                    }
                    &content {
                        font-size: 13px;
                        color: #2C3E50;
                        &:hover {
                            color: #3A71A8;
                        }
                    }
                    &time {
                        position: absolute;
                        right: 16px;
                        top: 16px;
                        color: #9B9B9B;
                    }
                }
            }
        }
    }
</style>

