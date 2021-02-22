<template>
   <div class="wrapper">
    <Sidebar msg="Welcome to Your Vue.js App"/>
    <Header msg="Welcome to Your Vue.js App"/>
    <ShopManagement msg="Welcome to Your Vue.js App"/>
    
  </div>
</template>

<script>
import Header from './components/layouts/Header.vue'
import Sidebar from './components/layouts/Sidebar.vue'
import ShopManagement from './components/dictionary/ShopManagement.vue'

export default {
  name: 'App',
  components: {
    Header,
    Sidebar,
    ShopManagement
  }
}
</script>

<style src="./styles/app.scss" lang="scss" />
