<template>
	<div class="index_case_details">
		<topbar></topbar>
		<view class="main">
			<view class="timg">
				<image class="" src="https://dss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1548534188,1221265134&fm=26&gp=0.jpg" mode=""></image>
				<view class="f">
					<text>三体</text>
					<text>地球往事</text>
				</view>
			</view>
			<view class="items">
				<view class="font">三体</view>
				<view class="font">地球往事</view>
				<view class="satr">
					5.0 <rate :size="36" style="display: inline-block;" :disabled="true"></rate>
				</view>
				<view class="nums">99999人游戏</view>
				<view class="font2">开发者:开发者</view>
				<view class="font2">预计时长:10小时</view>
				<view class="font2">难度:中等</view>
				<view class="font2">题材:中等</view>
				<view class="font2">版本:10.0.0</view>
			</view>
			<view class="btns">
				<text @click="goPlay">开始游戏</text>
			</view>
		</view>
	</div>
</template>

<script>
	import topbar from '_c/topBar'
	import rate from '_c/rate'
	export default{
		data(){
			return{
				
			}
		},
		components:{
			topbar,rate
		},
		methods:{
			goPlay(){
				uni.navigateTo({
					url:"/pagesPlay/login/login"
				})
			}
		}
	}
</script>

<style lang="less" scoped>
	.index_case_details{
		position: relative;
		color: #221813;
		padding: 20rpx;
		.timg{
			position: relative;
			image{
				display: block;
				height: 40vh;
				width: 100%;
			}
			.f{
				position: absolute;
				left: 15%;
				bottom: 15%;
				text{
					display: block;
					color: @hs;
					font-size: 34rpx;
				}
				text:last-child{
					margin-top: 2px;
				}
			}
		}
		
		.items{
			border-bottom: 3px dashed #221813;
			padding: 20rpx;
			.font{
				
				font-size: 40rpx;
				margin-bottom: 3px;
			}
			.satr{
				font-size: 40rpx;
				.rate-media{
					margin-left: 10px;
					image{
						
					}
				}
			}
			.nums{
				margin: 5px 0;
				background: #221813;
				color: @hs;
				display: inline-block;
				font-size: 20rpx;
				padding: 2px 5px;
			}
			.font2{
				font-size: 30rpx;
				margin-bottom: 5px;
			}
		}
		.btns{
			padding-top: 80rpx;
			text-align: center;
			font-size: 42rpx;
		}
		
	}
</style>
