<template>
    <div class="execution">

    </div>
</template>

<script>


export default {

  data () {
    return {
      id: '',
      name: ''
    }
  },
  computed: {
    src () {
      return `${this.actUrl}${this.id}`
    }
  },
  created () {
    this.id = this.$route.query.id
    this.name = this.$route.query.name
  },
  methods: {
    breaks () {
      this.$router.push({ path: '/activiti/index' })
    }
  }
}
</script>

<style lang="scss" scoped>
    .execution {
        height: 99%;

        .header {
            position: relative;
            display: flex;
            align-items: center;

            &__title {
                font-size: 22px;
            }

            &__btn {
                position: absolute;
                right: 10px;
            }
        }

        .main {
            margin: 0 auto;
            width: 99%;
            height: calc(100% - 100px);
            background-color: #fff;
            padding: 20px;
            border-radius: 3px;
            box-sizing: border-box;
        }
    }
    .iframe {
        width: 100%;
        height: 100%;
        border: 0;
        overflow: hidden;
        box-sizing: border-box;
    }

</style>
