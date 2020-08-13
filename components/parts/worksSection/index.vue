<template>
  <div id="works">
    <SectionLeft :sectionName="param1" :title="param2" :photoUrl="param3" :content="param4" :scrollText="param5" :scrollTextColor="param6" :isCarousel="param7" :slides="param8"/>
  </div>
</template>

<style lang="scss" scoped>
#works{
  height: auto;
  margin-bottom: 7.5em;
}
@media screen and (max-width:600px){
  #works{
    margin-bottom: 0;
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
          title: 'システム開発',
          content: 'Webアプリケーション',
          content: 'Webアプリケーション'
        },
        {
          title: 'ホームページ制作',
          content: 'セミオーダーシステムのHPを提案しています。'
        },
        {
          title: 'SES',
          content: '現在多数のパートナー会社様と提携しており、経験豊富なエンジニアにより、'
                  + 'お客様のプロジェクトを幅広く支援致します。'
        },
      ]
    }
  }
}
</script>