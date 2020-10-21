<template>
	<view class="index_case">
		<view class="items">
			<view @click="goDetail" class="item animate__animated animate__flipInX">
				<view class="img">
					<image src="https://dss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1548534188,1221265134&fm=26&gp=0.jpg" mode=""></image>
				</view>
				<text>三体</text>
				<text>地球往事</text>
			</view>
		</view>
	</view>
</template>

<script>
	export default {
		data(){
			return{
				
			}
		},
		mounted() {
			
		},
		methods:{
			goDetail(e){
				uni.navigateTo({
					url:"/pages/index/case/details/details"
				})
			}
		}
	}
</script>

<style lang="less" scoped="scoped">
	
	.index_case{
		width: 100%;
		height: 100vh;
		background: url(~@/assets/imgs/case.png) no-repeat 0 0;
		background-size: 100% 100%;
		background-repeat:no-repeat; 
		background-attachment:fixed;
		padding-top: 12vh;
		box-sizing: border-box;
		
		.items{
			
			.item{
				margin-bottom: 10px;
				position: relative;
				.img{
					width: 60vw;
					height: 60vw;
					margin: auto;
					border: 2px dashed @shs;
				}
				image{
					display: block;
					width: 100%;
					height: 100%;
					
				}
				text{
					position: absolute;
					left: 23vw;
					bottom: 24%;
					color: @qhs;
					font-size: 36rpx;
				}
				text:last-child{
					bottom: 15%;
				}
			}
		}
	}
</style>
