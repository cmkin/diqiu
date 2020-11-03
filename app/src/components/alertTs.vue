<template>
	<view class="g_alert_ts animate__animated animate__zoomIn">
		<view class="main" :style="mainStyle">
			<view class="input" v-if="type=='input'">
				<input type="text" placeholder-style="color:rgb(61, 187, 228)" :placeholder="placeholder" v-model="input" />
			</view>
			<view v-else class="font" :style="{fontSize:fontSize}">
				<typed class="f" :style="{fontSize:fontSize}" :nospeend="nospeend" :str="content"></typed>
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
			placeholder:{
				type:String,
				default:"请输入"
			},
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
			},
			mainStyle:{},
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
		top: 0;
		left: 0;
		z-index: 1000000;
		background: rgba(0,0,0,0.6);
		width: 100vw;
		height: 100vh;
		.main{
			position: absolute;
			top: 30%;
			left: 50%;
			transform: translateX(-50%);
			width:55%;
			padding: 40rpx 60rpx;
			box-sizing: border-box;
			//background-image: url(/assets/imgs/alertts.png);
			background: linear-gradient(to right, rgba(61, 187, 228,.6),rgba(20, 64, 77,.6));
			background-size: 150% 220%;
			background-position: 65% 80%;
			border-left: 1px solid @blue-q;
			border-right: 1px solid @blue-q;
			.input{
				input{
					background: #fff;
					width: 100%;
					padding: 5px 10px;
					color: @blue-q;
				}
			}
			.font{
				text-align: center;
				
				
				.f{
					font-size: 28rpx;
					color: rgb(71, 230, 252);
					line-height: 30rpx;
				}
				line-height: 30rpx;
			}
			.btns{
				margin-top: 40rpx;
				font-size: 28rpx;
				overflow: hidden;
				color: rgb(71, 230, 252);
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
