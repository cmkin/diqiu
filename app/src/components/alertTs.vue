<template>
	<view class="g_alert_ts animate__animated animate__zoomIn">
		<view class="main">
			<view class="input" v-if="type=='input'">
				<input type="text"  v-model="input" />
			</view>
			<view v-else class="font" :style="{fontSize:fontSize}">
				<typed :nospeend="nospeend" :str="content"></typed>
			</view>
			<view  class="btns" v-if="isBtn">
				<text  @click="ok">确定</text>
				<text @click="close">取消</text>
			</view>
		</view>
	</view>
</template>

<script>
	import typed from './typed'
	export default{
		data(){
			return{
				input:''
			}
		},
		props:{
			content:{
				tpye:[Number,String]
			},
			isBtn:{
				type:Boolean,
				default:true
			},
			type:{
				type:String
			},
			nospeend:{
				type:Boolean,
				default:false
			},
			fontSize:{
				type:String,
				default:"40rpx"
			}
		},
		components:{
			typed
		},
		methods:{
			close(){
				this.$emit("action",'cancel')
			},
			ok(){
				if(this.type=='input'){
					this.$emit("action",{
						value:this.input
					})
				}else{
					this.$emit("action",'ok')
				}
				
			}
		}
	}
</script>

<style lang="less" scoped>
	.g_alert_ts{
		position: fixed;
		top: 30%;
		left: 50%;
		transform: translateX(-50%);
		width:60%;
		padding: 40rpx;
		box-sizing: border-box;
		background-image: url(/assets/imgs/alertts.png);
		background-size: 150% 220%;
		background-position: 65% 80%;
		.main{
			.input{
				input{
					background: #fff;
					width: 100%;
					padding: 3px;
					color: @blue-q;
				}
			}
			.font{
				text-align: left;
				font-size: 40rpx;
				line-height: 30rpx;
			}
			.btns{
				margin-top: 40rpx;
				font-size: 28rpx;
				overflow: hidden;
				color: rgba(255,255,255,0.9);
				text:last-child{
					float: right;
				}
				text{
					letter-spacing: 10rpx;
				}
			}
		}
	}
</style>
