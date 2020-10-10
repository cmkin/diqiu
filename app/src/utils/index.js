import Vue from 'vue'


////////////////公用方法///////////





//插件库引入
import 'animate.css'



//全局组件

import uniTransition from '_c/uni-transition'

const components = [uniTransition]
components.forEach(item=>{
	Vue.component(item.name,item)
})		





//导出对外方法
module.exports = {
	test:{}
}