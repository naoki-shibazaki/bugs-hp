<template>
  <div id="works">
    <SectionLeft :sectionName="param1" :title="param2" :photoUrl="param3" :content="param4" :scrollText="param5"/>
  </div>
</template>

<style lang="scss" scoped>
#works{
  background: rgb(250, 180, 180);
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
      param1:'works',
      param2:'WORK',
      param3: require("~/assets/imgs/about01.jpg"),
      param4:'人生は挑戦の連続家族の様に助け合い、友人の様に認め合い ライバルの様に高め合うそんな会社を目指しています。'
            + '遊びも仕事も楽しんだもん勝ち一人でも生きていける力を身につけよう',
      param5:'ながれちゃうー★彡'
    }
  }
}
</script>