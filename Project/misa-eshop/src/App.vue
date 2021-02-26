<template>
   <div class="wrapper">
    <Sidebar msg="Welcome to Your Vue.js App"/>
    <Header msg="Welcome to Your Vue.js App"/>
    <Content />
    
  </div>
</template>

<script>
import Header from './components/layouts/Header.vue'
import Sidebar from './components/layouts/Sidebar.vue'
import Content from './components/layouts/Content.vue'

export default {
  name: 'App',
  components: {
    Header,
    Sidebar,
    Content 
  }
}
</script>

<style src="./styles/app.scss" lang="scss" />
