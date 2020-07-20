<template>
  <div id="benefits">
    <SectionRight :sectionName="param1" :title="param2" :photoUrl="param3" :content="param4" :scrollText="param5" :scrollTextColor="param6"/>
  </div>
</template>

<style lang="scss" scoped>
#benefits{
  height: 150vh;
}
</style>

<script>
import SectionRight from '~/components/parts/common/sectionRight.vue'
export default {
  components: {
    SectionRight
  },
  data() {
    return{
      param1:'benefits',
      param2:'BENEFITS',
      param3: require("~/assets/imgs/top-black.jpg"),
      param4:'Hello!',
      param5:'Foooooooooooo!',
      param6:'#222'
    }
  }
}
</script>