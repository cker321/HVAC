import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import AirControlView from '../views/AirControlView.vue'
import WindControlView from '../views/WindControlView.vue'
import SettingsView from '../views/SettingsView.vue'
const routes = [
  {
    path: '/',
    name: 'home',
    component: HomeView
  },
  {
    path: '/air-control',
    name: 'airControl',
    component: AirControlView
  },
  {
    path: '/wind-control',
    name: 'windControl',
    component: WindControlView
  },
  {
    path: '/settings',
    name: 'settings',
    component: SettingsView
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
