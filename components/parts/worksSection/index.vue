<template>
  <div id="works">
    <SectionLeft :sectionName="param1" :title="param2" :photoUrl="param3" :content="param4" :scrollText="param5" :scrollTextColor="param6" :isCarousel="param7" :slides="param8"/>
  </div>
</template>

<style lang="scss" scoped>
#works{
  height: 150vh;
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
      param3: require("~/assets/imgs/top-black.jpg"),
      param4:'人生は挑戦の連続家族の様に助け合い、友人の様に認め合い ライバルの様に高め合うそんな会社を目指しています。'
            + '遊びも仕事も楽しんだもん勝ち一人でも生きていける力を身につけよう',
      param5:'Open The Developer Tools',
      param6:'#fff',
      param7:true,
      param8:[
        {
          title: 'SES',
          content: 'SESとは、特定の業務への技術者の能力の提供をサービス対価とする委託契約の一種です。'
                  + '現在多数のパートナー会社様と提携しており、経験豊富なエンジニアにより、'
                  + 'お客様のプロジェクトを幅広く支援致します。'
        },
        {
          title: '自社システム開発',
          content: 'Webアプリケーション'
        },
        {
          title: 'xxxx',
          content: 'yyyy'
        }
      ]
    }
  }
}
</script>