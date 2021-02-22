<template>
<BaseModalConfirm ref="BaseModalConfirm_ref" :success="confirm.success">
  <p>{{confirm.message}}</p>
</BaseModalConfirm>
</template>

<script>
 import BaseModalConfirm from "../BaseModalConfirm.vue"
export default {
  props: {
    confirm: Object   
    },
  data() {
    return {
      visible: true,     
    };
  },
 components: {
   BaseModalConfirm
 },
 created(){
   // console.log(this.successConfirm);
 },
  methods: {
    hide: async function() {
     
      await this.$refs.BaseModalConfirm_ref.hide();
    },
    show: async function() { 
      console.log("show confirm");      
        await this.$refs.BaseModalConfirm_ref.show(); 
    },

   
  },
};
</script>

<style src="../modal.scss" lang="scss" />
