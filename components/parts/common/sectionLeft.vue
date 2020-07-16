<template>
  <div>

    <style>
    #{{sectionName}}{
      padding-top:10rem;
      width: 100vw;
      height: 100vh;
    }
    #{{sectionName}} .bugs-relative{
      width: 100vw;
      height: 130vh;
      position: relative;
    }

    #{{sectionName}} .bugs-absolute{
      position: absolute;
    }
    #{{sectionName}} .bugs-ab-title{
      top: 1rem;
      left: 1rem;
      transform: translateY(-58%) translateX(0em);
      font-family: 'bugs-font01';
      font-weight:200;
      font-size: 8em;
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
      width: 75vw;
      height: 100vh;
      z-index: 1;
    }
    #{{sectionName}} .bugs-section2{
      width: 55vw;
      height: 100vh;
      background: rgba(0, 0, 0, 0.8);
      right: 0;
      bottom: 0;
      z-index: 2;
    }
    #{{sectionName}} .bugs-section2 p{
      color:rgb(230,230,230);
      font-size:1.7em;
    }
    #{{sectionName}} .bugs-section3{
      width: 100%;
      height: 40vh;
      bottom: -43px;
    }

    #{{sectionName}} .bugs-title-image{
      object-fit: cover;
      width: 100%;
      height: 100%;
    }

    #{{sectionName}} .bugs-text-scroll-section {
      width : 45%;
      font-size : 15rem;
      text-align : center;
      overflow : hidden;
    }
    #{{sectionName}} .bugs-text-scroll-section p{
      margin:0;
      display : inline-block;
      padding-left: 100%;
      white-space : nowrap;
      line-height : 1em;
      font-family: 'bugs-font01';
      font-weight:400;
      animation : {{sectionName}}textScroll 180s linear infinite;
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
      <div class="bugs-absolute bugs-section2">
        <p>{{ content }}</p>
      </div>
      <div class="bugs-absolute bugs-section3">
        <div class="bugs-text-scroll-section">
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
