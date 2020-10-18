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

<style lang="less">
	page{
		width: 100%;
		height: calc(100vh - var(--status-bar-height));
		background: url(~@/assets/imgs/case.png) no-repeat 0 0;
		background-size: 100% 100%;
		background-position:0  var(--status-bar-height);
		background-repeat:no-repeat; 
		background-attachment:fixed;
		box-sizing: border-box;
	}
	.index {
		overflow-x: hidden;
	}
</style>
