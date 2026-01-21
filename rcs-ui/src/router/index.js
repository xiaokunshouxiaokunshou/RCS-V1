import { createRouter, createWebHistory } from 'vue-router'

import AGVView from '@/views/agv/index.vue'
import IndexView from '@/views/index/index.vue'
import LayoutView from '@/views/layout/index.vue'
import LoginView from '@/views/login/index.vue'
import MapView from '@/views/map/index.vue'
import MapInfoView from '@/views/map/mapinfo/index.vue'
import CarAuthView from '@/views/map/carauth/index.vue'
import TaskView from '@/views/task/index.vue'
import TDeviceView from '@/views/tdevice/index.vue'
import SysView from '@/views/sys/index.vue'
import UserView from '@/views/user/index.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: '',
      component: LayoutView,
      redirect: '/index',
      children: [
        {path: 'agv',name: 'agv',component: AGVView},
        {path: 'index',name: 'index',component: IndexView},
        {path: 'map',name: 'map',component: MapView},
        {path: 'mapinfo',name: 'mapinfo',component: MapInfoView},
        {path: 'carauth',name: 'carauth',component: CarAuthView},
        {path: 'task',name: 'task',component: TaskView},
        {path: 'tdevice',name: 'tdevice',component: TDeviceView},
        {path: 'sys',name: 'sys',component: SysView},
        {path: 'user',name: 'user',component: UserView}
      ]
    },
    {path: '/login',name: 'login',component: LoginView}
  ]
})

export default router
