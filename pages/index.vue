<template>
      <div class="text-center main-container">
        <TopSection />
        <AboutSection />
        <BenefitsSection />
        <WorksSection />
        <!--UniqueSection /-->
      </div>
</template>

<script>
import TopSection from '~/components/parts/topSection/index.vue'
import AboutSection from '~/components/parts/aboutSection/index.vue'
import BenefitsSection from '~/components/parts/benefitsSection/index.vue'
import WorksSection from '~/components/parts/worksSection/index.vue'
import UniqueSection from '~/components/parts/uniqueSection/index.vue'

export default {
  components: {
    TopSection,
    AboutSection,
    BenefitsSection,
    WorksSection,
    UniqueSection
  }
}
</script>
<style lang="scss" scoped>
  .main-container{
    overflow: hidden;
  }
</style>