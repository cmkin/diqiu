<template>
	<view class="fonter">
		<view class="item" @click="change(index)" :class="{active:fontActive==index}" v-for="item,index in fonterLists">
			<view class="icon" :class="item.icon" ></view>
			<text>{{item.text}}</text>
		</view>
	</view>
</template>

<script>
	export default{
		data(){
			return{
				fonterLists:[
					{
						icon:'icon1',
						text:"线索"
					},
					{
						icon:'icon2',
						text:"词条"
					},
					{
						icon:'icon3',
						text:"进度"
					},
					{
						icon:'icon4',
						text:"我的"
					}
				],
				fontActive:0
			}
		},
		props:{
			type:{
				type:[String,Number],
				default:0
			}
		},
		methods:{
			change(index){
				switch(index){
					case 0:
					if(this.type == 1){
						uni.navigateBack({
							delta:1
						})
					}
						
					break;
				}
			}
		}
	}
</script>

<style lang="less" scoped>
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
		
</style>
