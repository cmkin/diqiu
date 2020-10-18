<template>
	<view class="pagesplay_index">
		
		
		
		<message></message>
		
		<view class="fonter">
			<view class="item" :class="{active:fontActive==index}" v-for="item,index in fonterLists">
				<view class="icon" :class="item.icon" ></view>
				<text>{{item.text}}</text>
			</view>
		</view>
	</view>
</template>

<script>
	import message from './message.vue'
	export default{
		data(){
			return{
				fonterLists:[
					{
						icon:'icon1',
						text:"消息"
					},
					{
						icon:'icon2',
						text:"背包"
					},
					{
						icon:'icon3',
						text:"成就"
					},
					{
						icon:'icon4',
						text:"我的"
					}
				],
				fontActive:0
			}
		},
		components:{
			message
		}
	}
</script>

<style lang="less" >
	page{
		.playbg2;
	}
	.pagesplay_index{
		padding: 40rpx;
		
		.fonter{
			position: fixed;
			bottom: 0;
			left: 0;
			width: 100vw;
			box-sizing: border-box;
			display: flex;
			.item{
				transition: all .3s;
				opacity: .6;
				flex: 1;
				text-align: center;
				color: @blue-q;
				.icon{
					width: 70rpx;
					height: 70rpx;
					background-image: url(/pagesPlay/img/index/icon1.png);
					background-size: 100% 100%;
					margin: auto;
				}
				.icon2{
					background-image: url(/pagesPlay/img/index/icon2.png);
				}
				.icon3{
					background-image: url(/pagesPlay/img/index/icon3.png);
				}
				.icon4{
					background-image: url(/pagesPlay/img/index/icon4.png);
				}
				text{
					display: block;
					padding-top: 5px;
					padding-bottom: 30rpx;
				}
			}
			.active{
				opacity: 1;
			}
		}
	}
</style>
