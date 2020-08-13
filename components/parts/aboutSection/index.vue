<template>
  <div id="about">
    <SectionLeft :sectionName="param1" :title="param2" :photoUrl="param3" :content="param4" :scrollText="param5" :scrollTextColor="param6" :isCarousel="param7" :slides="param8"/>
  </div>
</template>

<style lang="scss" scoped>
#about{
  margin-bottom: 15em;
}
@media screen and (max-width:600px){
  #about{
    margin-bottom: 6.9em;
  }
}
</style>

<script>
import SectionLeft from '~/components/parts/common/sectionLeft.vue'
export default {
  components: {
    SectionLeft
  },
  data() {
    return{
      param1:'about',
      param2:'ABOUT',
      param3: require("~/assets/imgs/about-black.jpg"),
      param4:`挑戦することが人生の醍醐味だ！
              連続家族の様に助け合い友人の様に認め合いライバルの様に高め合う`,
      param5:'Best Unique Gather',
      param6:'#222',
      param7:false,
      param8:''
    }
  }
}
</script>