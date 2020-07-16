<template>
  <div>

    <style>
    #{{sectionName}}{
      width: 100vw;
      height: 100vh;
      background: rgb(163, 143, 143);
    }
    #{{sectionName}} .bugs-relative{
      width: 100vw;
      height: 150vh;

      background: rgb(162, 233, 168);
      position: relative;
    }

    #{{sectionName}} .bugs-absolute{
      position: absolute;
    }
    #{{sectionName}} .bugs-ab-title{
      top: 0;
      left: 0;
      transform: translateY(-50%) translateX(0em);
      font-size: 5em;
      z-index: 3;
      display: inline-block;
      background: linear-gradient(#222 50%, #fff 50%);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      white-space: nowrap;
    }
    #{{sectionName}} .bugs-section1{
      top: 2rem;
    }
    #{{sectionName}} .bugs-section1, .bugs-photo{
      width: 65vw;
      height: 100vh;
      background: rgb(255, 156, 156);
      z-index: 1;
    }
    #{{sectionName}} .bugs-section2{
      width: 50vw;
      height: 90vh;
      background: rgb(232, 156, 255);
      right: 0;
      bottom: 0;
      z-index: 2;
    }
    #{{sectionName}} .bugs-section3{
      width: 100%;
      height: 40vh;
      background: rgb(255, 226, 133);
      bottom: 0;
    }

    #{{sectionName}} .bugs-title-image{
      object-fit: cover;
      width: 100%;
      height: 100%;
    }

    #{{sectionName}} .bugs-text-scroll {
      width : 50%;
      font-size : 15rem;
      text-align : center;
      overflow : hidden;
    }
    #{{sectionName}} .bugs-text-scroll p{
      margin:0;
      display : inline-block;
      padding-left: 100%;
      white-space : nowrap;
      line-height : 1em;
      animation : {{sectionName}}textScroll 60s linear infinite;
    }
    @keyframes {{sectionName}}textScroll{
      0% { transform: translateX(0)}
      100% { transform: translateX(-100%)}
    }
    </style>
    <div class="bugs-relative">
      <div class="bugs-absolute bugs-section1">
        <div class="bugs-absolute bugs-ab-title">{{ title }}</div>
        <img v-bind:src="photoUrl" class="bugs-title-photo bugs-title-image"/>
      </div>
      <div class="bugs-absolute bugs-section2">{{ content }}</div>
      <div class="bugs-absolute bugs-section3">
        <div class="bugs-text-scroll">
          <p>{{ scrollText }}</p>
      </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
    props: ['sectionName', 'title','photoUrl', 'content', 'scrollText']
}
</script>
