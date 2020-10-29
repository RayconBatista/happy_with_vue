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
    meta: {
      title: 'Landing'
    },
    component: Landing
  },
  {
    path: '/orphanages',
    name: 'OrphanagesMap',
    meta: {
      title: 'Map'
    },
    component: OrphanagesMap
  },
  {
    path: '/orphanage/create',
    name: 'CreateOrphanage',
    meta: {
      title: 'Cadastro'
    },
    component: CreateOrphanage
  },
  {
    path: '/orphanage/:id',
    name: 'OrphanageID',
    meta: {
      title: 'Orfanato'
    },
    component: Orphanage
  },
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

router.beforeEach((to, from, next) => {
  if(to.meta.title) {
    document.title = to.meta.title
  }

  next()
})

export default router
