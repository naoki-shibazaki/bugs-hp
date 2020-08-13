<template>
  <div>

    <style>
    #{{sectionName}}{
        width: 100vw;
        height: 100vh;
      }
      #{{sectionName}} .mainBlock{
        width: 100vw;
        height: 130vh;
        position: relative;
      }

      #{{sectionName}} .bugs-absolute{
        position: absolute;
      }
      #{{sectionName}} .titleBlock{
        position: absolute;
        top: 1rem;
        right: 1rem;
        transform: translateY(-63%) translateX(0em);
        font-family: 'bugs-font01';
        font-weight:200;
        font-size: calc(4em + 2vw);
        z-index: 3;
        display: inline-block;
        background: linear-gradient(#222 50%, #fff 50%);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        white-space: nowrap;
      }

      #{{sectionName}} .imgBlock{
        grid-area: {{sectionName}}imgBlock;
        width: 75vw;
        height: 100vh;
        z-index: 1;
        position: absolute;
        top: 2rem;
        right:0;
      }
      #{{sectionName}} .contentBlock{
        grid-area: {{sectionName}}contentBlock;
        width: 55vw;
        height: 65vh;
        position: absolute;
        left: 0;
        bottom: 0;
        z-index: 2;

      }
      #{{sectionName}} .contentBlock p{
        color:rgb(230,230,230);
        font-size: calc(1em + 1vw);
        text-align: left;
        white-space:pre-line;
      }
      #{{sectionName}} .scrollBlock{
        grid-area: {{sectionName}}scrollBlock;
        width: 100%;
        height: 40vh;
        bottom: -70px;
        position: absolute;
      }

      #{{sectionName}} .titleImg{
        object-fit: cover;
        width: 100%;
        height: 100%;
      }

      #{{sectionName}} .textScrollBlock {
        width : 45%;
        font-size : 12rem;
        text-align : center;
        overflow : hidden;
        color:{{scrollTextColor}};
      }
      #{{sectionName}} .textScrollBlock p{
      margin:0;
      display : inline-block;
      padding-left: 100%;
      white-space : nowrap;
      line-height : 1em;
      font-family: 'bugs-font01';
      font-weight:400;
      animation : {{sectionName}}textScroll 300s linear infinite;
    }
    @keyframes {{sectionName}}textScroll{
      0% { transform: translateX(0)}
      100% { transform: translateX(100%)}
    }

    #{{sectionName}} .makiSection {
      width:70%;
      position: absolute;
      top:50%;
      left:50%;
      transform: translateY(-50%) translateX(-50%);
    }
    #{{sectionName}} .makiTitle, #{{sectionName}} .makiContent {
      font-size : 1.5em !important;
    }

    @media screen and (max-width:600px){
        #{{sectionName}} .mainBlock{
        display: grid;
        grid-template:
          "{{sectionName}}scrollBlock "
          "{{sectionName}}imgBlock    "
          "{{sectionName}}contentBlock";
        }
        #{{sectionName}} .imgBlock{
          width : 100%;
          height: 60vh;
          position: static;
          margin-top: 3.5rem;
        }
        #{{sectionName}} .titleBlock{
          margin-top: 2rem;
          width: 100%;
          left: 0;
          transform: translateY(-42%) translateX(0em);
        }

        #{{sectionName}} .contentBlock{
          width : 100%;
          position: static;
        }
        #{{sectionName}} .scrollBlock {
          height: 30vh;
        }
        #{{sectionName}} .textScrollBlock {
          width : 100%;
          font-size: 6rem;
        }
        #{{sectionName}} .makiSection {
          width:60%;
        }
        #{{sectionName}} .makiTitle, #{{sectionName}} .makiContent {
          font-size : 1.3em !important;
        }
      }
    </style>
    <div class="mainBlock">
      <div class="imgBlock">
        <div class="titleBlock">{{ title }}</div>
        <div class="titleBlock">{{ title }}</div>
        <img v-bind:src="photoUrl" class="titleImg"/>
      </div>
      <div class="contentBlock">
        <v-carousel v-if="isCarousel" cycle height="500" hide-delimiter-background show-arrows-on-hover>
          <v-carousel-item v-for="(slide, i) in slides" :key="i">
            <v-sheet height="100%">
              <v-row class="fill-height" align="center" justify="center">
                <div class="makiSection">
                  <p class="makiTitle">{{ slide.title }}</p>
                  <p class="makiContent">{{ slide.content }}</p>
                </div>  
              </v-row>
            </v-sheet>
          </v-carousel-item>
        </v-carousel>
        <p v-if="!isCarousel">{{ content }}</p>
      </div>
      <div class="scrollBlock">
        <div class="textScrollBlock">
          <p>{{ scrollText }}</p>
      </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
    props: [
      'sectionName',
      'title',
      'photoUrl',
      'content',
      'scrollText',
      'scrollTextColor',
      'isCarousel',
      'slides'
    ]
}
</script>
