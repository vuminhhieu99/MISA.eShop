<template>
<div class="relative">
    <select v-model="select" ref="select">
        <option
                  v-for="option in data"
                  :key="option.value"
                  v-bind:value="option.value"
                >
                  {{ option.text }}
                </option>
    </select>
    <input type="checkbox" id="btnControl"/>
    <label  for="btnControl">
<div class="select">
           <span class="select-value">{{showText}}</span>
           <i class="fas fa-chevron-down"></i>
            <span class="dropdown">
                <div class="form-input">
                    <input type="text"  class="form-search" v-model="search">
                </div>
                
                <ul class="select-result-option">
                   <li v-for="option in data" :key="option.value" v-bind="option.value" @click="chooseOption(option)">{{option.text}}</li>
            </ul>
            </span>
            

    </div>
    </label>

    
   

</div>
  
</template>

<script>
export default {
 
   props: ['data','select' ],
  data() {
    return {
    // data: false,
    //   value: 0,
    search: "",
    showText:""
    };
  },
  methods: {
      chooseOption: function(option){
        this.select= option.value;
        this.showText= option.text;
      }
  }

 
   
};
</script>
<style scoped>
.relative{
    position: relative;
    z-index: 10000;
}
#btnControl {
    display: none;
}
#btnControl:checked + label .dropdown {
    display: block;
}

#btnControl:checked + label .select {
    border-color: #66afe9;
    outline: 0;
    
    box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px rgba(102, 175, 233, 0.6);
}



.select{
        height: 40px;
    width: 160px;
    border: 1px solid #cccccc;
    border-radius: 4px ;
     color: #555555;
         /* display: flex; */
}
.select-value{
        float: left;
    width: 80%;
    height: 100%;
    padding: 4px 16px;
    line-height: 2.128571;
}

i{
  float: left;    
    height: 100%;
    line-height: 40px;
    margin-left: auto;
    margin-right: 12px;
}

.dropdown{
    display: none;
    padding-top: 40px;
        border-left: 1px solid #cccccc;
    border-right: 1px solid #cccccc;
    border-bottom: 1px solid #cccccc;
}

.select-result-option{
        padding: 0;
    margin: 0;
}

li {
    list-style: none;
    margin: 0 0 0 0;
    box-sizing: border-box;
    line-height: 40px;
    padding-left: 10px;
}
li:hover{
    background-color: #0088c1;
}




.dropdown a {
    position:absolute;
}

.form-input{
    margin-top: 0;
    padding: 4px 8px;
    top: 40px;
    left: 0px;
    height: 100%;
    border-bottom: 1px solid #cccccc;
    width: 100%;
    display: flex;

}

.form-search{
    height: 40px;
    margin: 0 0 0 0;
    width: 100%;
        padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    background-color: #fff;
    border-radius: 4px;
    top: 0px;
}

.form-search:focus{
    border-color: #66afe9;
    outline: 0;
    
    box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px rgba(102, 175, 233, 0.6);
}


input:focus{
     border-color: #66afe9;
    outline: 0;
    
    box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px rgba(102, 175, 233, 0.6);
    
}
</style>