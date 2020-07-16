<template>
  <div id="about">
    <SectionLeft :sectionName="param1" :title="param2" :photoUrl="param3" :content="param4" :scrollText="param5"/>
  </div>
</template>

<style lang="scss" scoped>
#about{
  height: 100vh;
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
      param4:'人生は挑戦の連続家族の様に助け合い、友人の様に認め合い ライバルの様に高め合うそんな会社を目指しています。'
            + '遊びも仕事も楽しんだもん勝ち一人でも生きていける力を身につけよう',
      param5:'Best Unique Gather'
    }
  }
}
</script>