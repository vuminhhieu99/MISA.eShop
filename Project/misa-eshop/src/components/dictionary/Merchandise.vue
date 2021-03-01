<template>
  <aside class="content">
       <Combobox v-bind:select="selectedCountry" v-bind:data="optionCountry" @input="selectedCountry = $event" v-bind:style="{'height': '35px'}"/>
           
       <div class="grid">
         <div>1</div>
         <div>2</div>
         <div>3</div>
         <div>4</div>
         <div>5</div>
         <div>6</div>
         <div>7</div>
       </div>
  </aside>
</template>

<script>
import * as axios from "axios";

import Combobox from "../combobox/Combobox.vue";

export default {
  name: "Content",
  data() {
    return{
       selectedCountry: 0,
      optionCountry: [{ text: "--quốc gia--", value: 0 }],
    }
  },
  components:{

      Combobox
  },
  methods: {
    //lấy danh sách quốc gia
    getCounTryData: async function () {
      const response = await axios.get(
        "https://localhost:44336/api/CounTry/BaseAll"
      );
      var optionCountry = [];
      optionCountry.push({ text: "--quốc gia--", value: 0 });
      response.data.data.forEach(function (item) {
        optionCountry.push({
          text: item.countryName,
          value: item.countryId,
        });
      });
      this.optionCountry = optionCountry;
    }
  },
  async created(){
    await this.getCounTryData();
  }

}
</script>
<style scoped>
div{
  /* height: 40px;
  width: 200px; */
  text-align: center;
  
}
.grid div:nth-child(1){
  background-color: tomato;
}
.grid div:nth-child(2){
  background-color: teal;
}
.grid div:nth-child(3){
  background-color: violet;
}
.grid div:nth-child(4){
  background-color: yellow;
}
.grid div:nth-child(5){
  background-color: slateblue;
}
.grid div:nth-child(6){
  background-color: olivedrab;
}
.grid div:nth-child(7){
  background-color: olivedrab;
}

</style>
