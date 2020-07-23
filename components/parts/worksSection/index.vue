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
          title: '各種社会保険完備',
          content: '女性でも働きやすい環境を。'
                  + '家庭も仕事を両立できるよう時短勤務・産休育休等、様々な休暇を設けております。'
        },
        {
          title: '年間休日120日以上',
          content: 'xxxx'
        },
        {
          title: '交通費全額支給',
          content: 'xxxx'
        },
        {
          title: '奨学金全額負担制度',
          content: '勤めている間、奨学金の支払い分を給与に充当します'
        },
        {
          title: '資格取得支援制度',
          content: '資格取得にかかる費用は会社が支給致します'
        },
        {
          title: '勉強援助',
          content: '自らのスキルを上げる為の勉強を応援します'
        }
      ]
    }
  }
}
</script>