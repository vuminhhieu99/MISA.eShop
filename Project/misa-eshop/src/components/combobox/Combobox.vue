<template>
<div class="relative">
    <!-- <select id="">
        <option
                  v-for="option in data"
                  :key="option.value"
                  v-bind:value="option.value"
                >
                  {{ option.text }}
                </option>
    </select> -->
    <div class="form-control">
            <input type="text"/>
            <span class="drop-hover">
                <div class="dropdown">
                    <a href=""> option1</a>  
                      <a href=""> optio2</a>  
                        <a href=""> option3</a>  
            </div>
            </span>
            

    </div>
   

</div>
  
</template>

<script>
export default {
 
//   props: ['data','value' ],
  data() {
    return {
    // data: false,
    //   value: 0,
    };
  },

 
   
};
</script>
<style scoped>
.relative{
    position: relative;
}
select{
    display: none;
}
.drop-hover{
    float: left;
    position: relative;
    /* display: inline-block; */
}
.drop-hover:hover .dropdown{
    display: block;
}
.dropdown{
    position: relative;
    display: none;
}
.dropdown a {
    position:absolute;
}

.form-control{
        height: 40px;
    margin: 0 0 0 0;
    display: block;
    width: 100%;
    padding: 0;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555555;
    background-color: #fff;
    border: none;
    border-radius: 4px;
}

.form-control:focus{
    border-color: #66afe9;
    outline: 0;
    
    box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px rgba(102, 175, 233, 0.6);
}
input{
       border: none;
    height: 100%;
    margin: 0 0 0 0;
    display: block;
    width: 100%;
    top: 0;
    left: 0;
    padding: 6px 12px;
    font-size: 14px;
    border-radius: 4px;
    line-height: 1.42857143;
}

input:focus{
     border-color: #66afe9;
    outline: 0;
    
    box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px rgba(102, 175, 233, 0.6);
    
}
</style>