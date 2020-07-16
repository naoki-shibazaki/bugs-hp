<template>
  <div id="about">
    <div class="relative">
      <div class="absolute ab1">
        <div class="absolute ab0">ABOUT</div>
        <img src="~assets/imgs/about.jpg" class="photo imageTest"/>
      </div>
      <div class="absolute ab2">ab2</div>
      <div class="absolute ab3">
        <div class="text-Scroll">
          <p>Please press F12</p>
      </div>
      </div>
    </div>
  </div>
</template>

<style lang="scss" scoped>
#about{
  width: 100vw;
  height: 100vh;
  background: rgb(163, 143, 143);
}
.relative{
  width: 100vw;
  height: 150vh;

  background: rgb(162, 233, 168);
  position: relative;
}

.absolute{
  position: absolute;
}
.ab0{
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
.ab1{
  top: 2rem;
}
.ab1, .photo{
  width: 65vw;
  height: 100vh;
  background: rgb(255, 156, 156);
  z-index: 1;
}
.ab2{
  width: 50vw;
  height: 90vh;
  background: rgb(232, 156, 255);
  right: 0;
  bottom: 0;
  z-index: 2;
}
.ab3{
  width: 100%;
  height: 40vh;
  background: rgb(255, 226, 133);
  bottom: 0;
}

.imageTest{
  object-fit: cover;
  width: 100%;
  height: 100%;
}

.text-Scroll {
  width : 50%;
  font-size : 15rem;
  text-align : center;
  overflow : hidden;
}
.text-Scroll p{
  margin:0;
  display : inline-block;
  padding-left: 100%;
  white-space : nowrap;
  line-height : 1em;
  animation : textScroll 60s linear infinite;
}
@keyframes textScroll{
  0% { transform: translateX(0)}
  100% { transform: translateX(-100%)}
}
</style>