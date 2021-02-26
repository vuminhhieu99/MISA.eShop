import Vue from 'vue'
import VueRouter from 'vue-router'
import ShopManagement from '../components/dictionary/ShopManagement.vue'
import Merchandise from '../components/dictionary/Merchandise.vue'

Vue.use(VueRouter)

const routes = [
  { path: '/ShopManagement', name: 'ShopManagement', component: ShopManagement },
  { path: '/Merchandise', name: 'Merchandise', component: Merchandise },
    
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
