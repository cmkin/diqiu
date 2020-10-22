<template>
	<view class="pagesplay_index">
		
		
		
		<message></message>
		
		<fonterx></fonterx>
	</view>
</template>

<script>
	import message from './message.vue'
	import fonterx from '../common/fonter.vue'
	export default{
		data(){
			return{
				
			}
		},
		components:{
			message,fonterx
		}
	}
</script>

<style lang="less" >
	page{
		.playbg2;
	}
	.pagesplay_index{
		padding: 40rpx;
		
		
	}
</style>
