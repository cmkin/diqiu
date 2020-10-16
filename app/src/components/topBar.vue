<template>
	<view class="top_barbar">
		<view class="main">
			<text @click="back" class="font_family icon-fanhui"></text>
		</view>
	</view>
</template>

<script>
	export default{
		name:"topbar",
		data(){
			return{
				
			}
		},
		methods:{
			back(){
				uni.navigateBack({
					delta:1
				})
			}
		}
	}
</script>

<style lang="less">
	.top_barbar{
		position: absolute;
		
		width: 95%;
		z-index: 100;
		.main{
			box-sizing: border-box;
			padding: 10rpx;
			text{
				font-size: 30rpx;
				color: @shs;
			}
		}
	}
</style>
