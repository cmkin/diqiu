<template>
	<view class="g_back">
		<text @click.native="back()" class="font_family icon-fanhui"></text>
		<view class="main">
			{{ content}}
		</view>
	</view>
</template>

<script>
	export default{
		data(){
			return{
				
			}
		},
		props:{
			content:{}
		},
		methods:{
			back(){
				console.log("返回")
				uni.navigateBack({
					delta:1
				})
			}
		}
	}
</script>

<style lang="less" scoped>
	.g_back{
		z-index: 1000;
		padding: 30rpx;
		box-sizing: border-box;
		position: relative;
		.font_family{
			position: absolute;
			top: 40rpx;
			left: 60rpx;
			font-size: 24rpx;
			z-index: 100;
			color: @blue-q;
		}
		.main{
			width: 80%;
			padding-bottom: 3px;
			font-size: 32rpx;
			margin: auto;
			text-align: center;
			//border-bottom: 2px solid @blue-q;
			color: @blue-q;
		}
	}
</style>
