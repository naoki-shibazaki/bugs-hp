<template>
  <div id="top">
    <div class="parallax" :style="{height: '100vh'}">
      <img :src="require('~/assets/imgs/works-black.jpg')" class="parallaxImg">
      <v-row>
        <v-col cols="12">
          <div class="companyTitleBox">
            <h1 class="title">Bug.s</h1>
            <h4 class="subTitle">Best Unique Gather</h4>
          </div>        
          <span class="arrow" >Scroll</span>
        </v-col>
      </v-row>
    </div>
  </div>
</template>

<script>
export default {
  data () {
    return {
      height: 0
    }
  },
  created () {
    if (process.client) {
      window.addEventListener('resize', this.handleResize)
      this.handleResize()
    }
  },
  destroyed () {
    if (process.client) {
      window.removeEventListener('resize', this.handleResize)
    }
  },
  methods: {
    handleResize () {
      this.height = window.innerHeight
    }
  }
}
</script>



<style lang="scss" scoped>
.parallax{
  width: 100%;
  position: relative;
}
.parallaxImg{
  width: 100%;
  height: 100%;
  object-fit: cover;
}
.companyTitleBox{
  background: rgba(34, 34, 34, 0.9);
  position: absolute;
  width: 100%;
  height: 20vh;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  color: #fff;
  .title{
    position: absolute;
    left: 50%;
    transform: translate(-50%, -50%);
    font-family: 'bugs-font01' !important;
    font-size: calc(4em + 4vw) !important;
    margin-bottom: 5rem;
  }
  .subTitle{
    position: absolute;
    bottom: 0;
    left: 50%;
    transform: translate(-50%, -50%);
    font-family: 'bugs-font01' !important;
    font-size: calc(.3em + 1vw) !important;
    letter-spacing: 1rem;
  }
}
.arrow {
  display: inline-block;
  position: absolute;
  right: 40px;
  bottom: 20px;
  z-index: 2;
  padding: 10px 10px 220px;
  overflow: hidden;
  color: #fff;
  font-size: 14px;
  font-family: 'Josefin Sans', sans-serif;
  line-height: 1;
  letter-spacing: .2em;
  text-transform: uppercase;
  text-decoration: none;
  writing-mode: vertical-lr;
  &::after {
    content: '';
    position: absolute;
    bottom: 0%;
    left: 50%;
    width: 1px;
    height: 200px;
    background: #fff;
    animation: sdl 2s cubic-bezier(1, 0, 0, 1) infinite;
  }
}
@keyframes sdl {
  0% {
    opacity: 1;
    transform: scale(1, 0);
    transform-origin: 0 0;
  }
  30% {
    transform: scale(1, 1);
    transform-origin: 0 0;
  }
  30.1%, 70% {
    transform: scale(1, 1);
    transform-origin: 0 100%;
  }
  100% {
    opacity: 0;
    transform: scale(1, 0);
    transform-origin: 0 100%;
  }
}
</style>