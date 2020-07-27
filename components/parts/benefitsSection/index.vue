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
        },
        {
          title: '家賃補助',
          content: '毎月10,000円を支給'
        },
        {
          title: '交通費全額支給'
        },
        {
          title: '奨学金全額負担制度',
          content: '在職中は奨学金支払い分を会社が負担'
        },
        {
          title: '資格取得支援制度',
          content: '資格取得にかかる費用を会社が支給致します'
        },
        {
          title: 'スキルアップ援助制度',
          content: '自らのスキルを上げる為の勉強を応援します'
        }
      ]
    }
  }
}
</script>