<template>
	<view class="index">
		
		<uni-transition :isContentShow="tabbarActive==0">
			<casem></casem>
		</uni-transition>
		
		
		
		<tabbar></tabbar>
		
		
	</view>
</template>

<script>
	import tabbar from '_c/tabbar'
	import casem from './case/case'
	import consulting from './consulting/consulting'
	import mine from './mine/mine'
	export default {
		data() {
			return {
				tabbarActive:0
			}
		},
		components:{tabbar,casem,consulting,mine},
		provide:{
			_mainFuncInit(index){
				this.tabbarActive = index
			}
		},
		onLoad() {

		},
		methods: {

		}
	}
</script>

<style lang="less" scoped>
	
</style>
