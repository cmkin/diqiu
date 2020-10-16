import Vue from 'vue'
import App from './App'

Vue.config.productionTip = false

import { test } from './utils/index.js'

import './router' // 引入路由

App.mpType = 'app'

const app = new Vue({
  ...App
})
app.$mount()

