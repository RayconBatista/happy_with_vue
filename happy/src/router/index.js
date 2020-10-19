import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import Landing from '../views/Landing.vue'
import CreateOrphanage from '../views/CreateOrphanage.vue'
import OrphanagesMap from '../views/OrphanagesMap.vue'
import Orphanage from '../views/Orphanage.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Landing',
    component: Landing
  },
  {
    path: '/app',
    name: 'OrphanagesMap',
    component: OrphanagesMap
  },
  {
    path: '/orphanages/create',
    name: 'CreateOrphanage',
    component: CreateOrphanage
  },
  {
    path: '/orphanage/:id',
    name: 'OrphanageID',
    component: Orphanage
  },
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
