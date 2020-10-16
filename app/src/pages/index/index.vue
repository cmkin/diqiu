<template>
	<view class="index">
			
		<casem class="animate__animated" :class="{'animate__fadeInRight':tabbarActive==0}" v-if="tabbarActive==0"></casem>
		<consulting class="animate__animated" :class="{'animate__fadeInRight':tabbarActive==1}" v-if="tabbarActive==1"></consulting>
		<mine class="animate__animated" :class="{'animate__fadeInRight':tabbarActive==2}" v-if="tabbarActive==2"></mine>
		 
		 
		 
		<tabbar :actives="tabbarActive" @change="tabbarChange"></tabbar>


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
				tabbarActive: 0
			}
		},
		components: {
			tabbar,
			casem,
			consulting,
			mine
		},
		onLoad() {
		
			
		},
		methods: {
			tabbarChange(index) {

				this.tabbarActive = index
			},
			
			getFilelist() {
				
	
			},


		}
	}
</script>

<style lang="less" scoped>
	.index {
		overflow-x: hidden;
	}
</style>
