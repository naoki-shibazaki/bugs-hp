<template>
  <div id="benefits">
    <SectionRight :sectionName="param1" :title="param2" :photoUrl="param3" :content="param4" :scrollText="param5" :scrollTextColor="param6" :isCarousel="param7" :slides="param8"/>
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
      param6:'#222',
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