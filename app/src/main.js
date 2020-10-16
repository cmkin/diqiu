import Vue from 'vue'
import App from './App'

import store from './store'

Vue.config.productionTip = false

Vue.prototype.$store = store

import { test } from './utils/index.js'

import './router' // 引入路由

App.mpType = 'app'

const app = new Vue({
  ...App
})
app.$mount()

