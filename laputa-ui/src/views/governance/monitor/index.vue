<template>
  <d2-container-iframe :src="src"/>
</template>
<script>
export default {
  name: '系统监控',
  data () {
    return {
      src: `http://localhost:5001/`
    }
  }
}
</script>
