<template>
	<view class="play_index ">
		<view class="bg animate__animated animate__backInLeft">
			<view class="topbg">
				<view class="icon1"></view>
				<view class="icon2"></view>
			</view>
			<view class="main">
				<view class="ts">
					<view class="icon">
						<view class="btn">
							<text v-for="item,index in 3" :key="index"></text>
						</view>
					</view>
				</view>
				<view class="login">
					<input type="text" value="" />
					<button hover-class="h" type="default">登录</button>
				</view>
			</view>
			
			<typed str="年底啊哈爱说大话撒谎大 打赏啊说的撒啊 萨达"></typed>
			
		</view>
		
		
		<gts></gts>
		
	</view>
</template>

<script>
	import gts from '_c/gts'
	import typed from '_c/typed'
	export default{
		data(){
			return{
				
			}
		},
		components:{
			gts,typed
		},
		onLoad() {
			console.log(this.$store.state.pagesPlay.t)
		},
	}
</script>

<style lang="less">
	page{ 
		.playbg;
		background-image: url(/pagesPlay/img/loginbg.png);
		background-size: 90% 100%;
	}
	.play_index{
		.bg{
			.playbg;
			background-color: transparent;
			width: 100vw;
			height: calc(100vh - var(--status-bar-height));
			box-sizing: border-box;
			.topbg{
				position: relative;
				padding-top: 10vh;
				.icon1{
					width: 100vw;
					height: 40vh;
					background-image: url(/pagesPlay/img/login2.png);
					background-size: 100% 120%;
				}
				.icon2{
					position: absolute;
					left: 50%;
					top: 60%;
					transform: translate(-55%,-50%);
					width: 420rpx;
					height: 380rpx;
					background-image: url(/pagesPlay/img/login1.gif);
					background-size: 100% 100%;
				}
				
			}
			
			.main{
				.ts{
					position: relative;
					.icon{
						width: 50%;
						margin: auto;
						height: 80rpx;
						background-image: url(/pagesPlay/img/logints.png);
						background-size: 100% 100%;
						position: relative;
					}
					.btn{
						position: absolute;
						top: 0;
						left: 0;
						width: 100%;
						height: 100%;
						display: flex;
						text{
							height: 100%;
							flex: 1;
						}
					}
				}
				.login{
					background-image: url(/pagesPlay/img/login.png);
					background-size: 100% 100%;
					text-align: center;
					padding:60rpx 80rpx;
					width: 50%;			
					margin: auto;
					input{
						padding: 20rpx;
						display: inline-block;
						background: #fff;
					}
					button{
						display: block;
						font-size: 40rpx;
						color: @blue-s;
						letter-spacing: 20rpx;
						width: 50%;
						margin: auto;
						background: none;
					}
					.h{
						color: @blue-q;
					}
				}
			}
			
			
		}
		
	}
</style>
