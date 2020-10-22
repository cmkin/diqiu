<template>
	<view class="pagesplay_index_message">
		<view class="main">
			<view class="title">WuChang</view>
			<view class="add" @click="gofriend">
				<text class="font_family icon-jia"></text>
				添加好友
			</view>
			<view class="items">
				<view class="item">
					<view class="icon"></view>
					<text>文件传输助手</text>
				</view>
				<view class="item">
					<view class="icon"></view>
					<text>私人邮箱</text>
				</view>
			</view>
			<view class="friends">
				<view class="item" @click="gochat(item)" v-for="item in friends">
					<view class="tx">
						<text v-if="item.isNew"></text>
					</view>
					<view class="r">
						<view class="name">{{item.name}}</view>
						<view class="info" v-if="item.contacts.length" v-html="item.contacts[contactActive].value"></view>
					</view>
				</view>
			</view>
			
		</view>
	</view>
</template>

<script>
	export default{
		data(){
			return{
				
			}
		},
		methods:{
			gofriend(){
				uni.navigateTo({
					url:"/pagesPlay/index/meaasge/addfriend"
				})
			},
			gochat(item){
				uni.navigateTo({
					url:"/pagesPlay/index/meaasge/chat?item=" +JSON.stringify(item)
				})
			}
		},
		computed:{
			friends(){
				return this.$store.state.pagesPlay.message.friends
			},
			contactActive() {
				return this.$store.state.pagesPlay.message.chat.active
			},
		}
	}
</script>

<style lang="less" scoped>
	.pagesplay_index_message{
		.main{
			.title{
				color: @blue-q;
				font-size: 32rpx;
				padding-left: 40rpx;
				padding-bottom: 5px;
			}	
			.add{
				background-image: url(/pagesPlay/img/index/addFriend.png);
				background-size: 140% 150%;
				background-position: -110rpx -35rpx;
				border-top: 2px solid @blue-q;
				color: @blue-q;
				font-size: 34rpx;
				font-weight: bold;
				letter-spacing: 10rpx;
				padding: 60rpx 40rpx;
				text-align: right;
				.font_family{
					font-size: 26rpx;
					margin-right: 20rpx;
				}
			}
			
			.items{
				padding: 30rpx;
				.item{
					margin-bottom: 20rpx;
					.icon{
						background-image: url(/pagesPlay/img/index/wj.png);
						background-size: 100% 100%;
						width: 80rpx;
						height: 80rpx;
						display: inline-block;
					}
					text{
						font-weight: bold;
						color: @blue-q;
						font-size: 32rpx;
						position: relative;
						top: -30rpx;
						margin-left: 20rpx;
					}
				}
			}
			
			.friends{
				padding: 20rpx;
				.item{
					display: flex;
					.tx{
						width: 80rpx;
						height: 80rpx;
						background-image: url(/pagesPlay/img/message/tx-nan.png);
						background-size: 100% 100%;
						margin-right: 10rpx;
						position: relative;
						text{
							position: absolute;
							right: 0;
							top: 0;
							width: 20rpx;
							height: 20rpx;
							border-radius: 50%;
							background: @blue-q;
						}
					}
					.r{
						color: @blue-q;
						.name{
							font-size: 32rpx;
							margin-bottom: 5px;
						}
						.info{
							.omg;
							font-size: 20rpx;
							max-width: 300rpx;
							
						}
					}
				}
			}
		}
	}
</style>
