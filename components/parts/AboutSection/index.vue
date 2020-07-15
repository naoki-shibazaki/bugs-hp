<template>
  <div id="about">
    about
    <v-container>
      <div class="relative">
        <div class="absolute">
          <v-parallax class="about01" src="https://cdn.vuetifyjs.com/images/parallax/material.jpg"></v-parallax>
        </div>
        <div class="absolute">
          <v-card class="mx-auto" max-width="344" outlined>
            <v-list-item three-line>
              <v-list-item-content>
                <div class="overline mb-4">OVERLINE</div>
                <v-list-item-title class="headline mb-1">Headline 5</v-list-item-title>
                <v-list-item-subtitle>Greyhound divisely hello coldly fonwderfully</v-list-item-subtitle>
              </v-list-item-content>

            </v-list-item>

            <v-card-actions>
              <v-btn text>Button</v-btn>
            </v-card-actions>
          </v-card>
        </div>
      </div>
    </v-container>
  </div>
</template>

<style lang="scss" scoped>
  #about {
    height: 100vh;
  }

  .text-center {
    color: red;
  }
  .relative {
    position: relative;
    width: 100%;
  }
  .absolute {
    position: absolute;
    top: 0;
    width: 100%;
  }
  .about01 {
    width: 10%;
  }
</style>