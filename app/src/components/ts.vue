<template>
	<view :class="{'g_top':position=='top'}" class="g_ts animate__animated animate__zoomIn">
		<view class="main">
			<view class="font">
				<typed :str="content"></typed>
			</view>
		</view>
	</view>
</template>

<script>
	import typed from './typed'
	export default{
		data(){
			return{
				
			}
		},
		props:{
			content:{
				tpye:[Number,String]
			},
			position:{
				type:String,
				default:'top'
			}
		},
		components:{
			typed
		},
		methods:{
			
		}
	}
</script>

<style lang="less" scoped>
	.g_ts{
		position: absolute;
		width:100%;
		padding:5px 20rpx;
		box-sizing: border-box;
		background-image: url(/assets/imgs/alertts.png);
		background-size: 150% 220%;
		background-position: 65% 80%;
		.main{
			.font{
				text-align: left;
				font-size: 28rpx;	
			}
		}
	}
	.g_top{
		bottom: 110%;
		left: 0;
	}
	
</style>
