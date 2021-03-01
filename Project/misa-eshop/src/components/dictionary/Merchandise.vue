<template>
  <aside class="content">
       <Combobox v-bind:select="selectedCountry" v-bind:data="optionCountry" @input="selectedCountry = $event" v-bind:style="{'height': '35px'}"/>
       <div>{{selectedCountry}}</div>    
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
