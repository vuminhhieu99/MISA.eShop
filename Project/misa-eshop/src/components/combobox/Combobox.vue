<template>
  <div class="relative" v-on-clickaway = "hide">
    <select v-model="select" ref="select">
      <option
        v-for="option in data"
        :key="option.value"
        v-bind:value="option.value"
      >
        {{ option.text }}
      </option>
    </select>
    <!-- <input type="checkbox" id="btnControl" /> -->

    <!-- <input v-model="dataSearch[0].text" /> -->
    <div
      class="select"
     
      @click="toggleVisibility()"
     
      @keydown.space.exact.prevent="toggleVisibility()"
   
    >
      <span class="select-value">{{ showText }}</span>
      <i class="fas fa-chevron-down"></i>
    </div>
    <transition name="component-fade">
    <div class="dropdown" v-if="visible">
      <div class="form-input">
        <input type="text" class="form-search" v-model="search" />
      </div>

      <ul class="select-result-option">
        <li
          v-for="option in dataSearch"
          :key="option.value"
          @click="chooseOption(option)"
        >
          {{ option.text }}
        </li>
      </ul>
    </div>
    </transition>
    
  </div>
</template>

<script>
import Vue from "vue";
import { mixin as clickaway } from 'vue-clickaway';

export default {
     mixins: [ clickaway ],
  props: ["data", "select"],
  data() {
    return {
      debounce: null, // biến delay
      visible: false,
      search: "",
      showText: "",
    };
  },
  methods: {
    chooseOption: function (option) {
      //this.select = Vue.util.extend(option.value);
      this.search = Vue.util.extend(option.text);
      this.showText = option.text;
      this.visible = false;
      this.$emit("input", JSON.parse(JSON.stringify(option.value)));
    },
    toggleVisibility: function() {
        this.visible = !this.visible;
    },
    hide: function() {
        this.visible  = false;
    }

    //   initiative: function(){
    //       this.dataSearch = this.data.filter(option => option.text.includes(this.search));
    //   }
  },
  //   watch:{

  //       search: function(){
  //            clearTimeout(this.debounce);
  //            this.debounce = setTimeout(()=> {
  //                 this.dataSearch = this.data.filter(option => option.text.includes(this.search));
  //            },200)

  //       }
  //   },
  computed: {
    dataSearch: function () {
      return this.data.filter((option) =>
        option.text.toLowerCase().includes(this.search.toLowerCase())
      );
    },
  },
  mounted() {
    this.showText = Vue.util.extend(this.data[this.select].text);
    //   this.dataSearch = Vue.util.extend({}, this.optionCountry);
    //   console.log(this.optionCountry);
    //     //this.dataSearch = JSON.parse(JSON.stringify());
  },
};
</script>
<style scoped>
.relative {
  padding: 0 !important;
  position: relative;

  width: 160px;
}
/* #btnControl {
  display: none;
}
#btnControl:checked + label .dropdown {
  display: block;
  z-index: 10000;
}

#btnControl:checked + label .select {
  border-color: #66afe9;
  outline: 0;
  border-radius: 4px 4px 0 0;  
} */
select {
  display: none;
}

.select {
  height: 100%;
  width: 100%;

  border-radius: 4px;
  color: #555555;
  display: flex;
  align-items: center;
}
.select-value {
  float: left;
  width: 80%;
  height: 100%;
  padding: 4px 16px;
  line-height: 2.128571;
}

i {
  margin-left: auto;
  margin-right: 12px;
}

.dropdown {
  position: relative;
  border: 1px solid #cccccc;
  background: #ffffff;
  width: calc(100% + 2px);
  left: -1px;
  margin-top: 2px;
  border-color: #66afe9;
  z-index: 10000;
  overflow: hidden;
  box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075),
    0 0 8px rgba(102, 175, 233, 0.6);
}

.select-result-option {
  padding: 0;
  margin: 0;
   max-height: 150px;
  overflow-y: auto;
}

li {
  list-style: none;
  margin: 0 0 0 0;
  box-sizing: border-box;
  line-height: 40px;
  padding-left: 10px;
}
li:hover {
  background-color: #0088c1;
}

.form-input {
  margin-top: 0;
  padding: 4px 8px;
  top: 40px;
  left: 0px;
  border-bottom: 1px solid #cccccc;
  width: 100%;
  display: flex;
}

.form-search {
  height: 30px;
  margin: 0 0 0 0;
  width: 100%;
  padding: 6px 12px;
  font-size: 14px;
  line-height: 1.42857143;
  background-color: #fff;
  border-radius: 4px;
  top: 0px;
  border: 1px solid #ccc;
  color: #555555;
}
.form-search:focus {
  outline: none;
  border-color: #66afe9;
}

.component-fade-enter-active,
.component-fade-leave-active {
   transition: all 0.3s ease-in-out;
  max-height: 180px;
}
.component-fade-enter, .component-fade-leave-to
/* Trước 2.1.8 thì dùng .slide-fade-leave-active */ { 
  max-height: 0px;
}
</style>