<template>
	<view class="index_message_addfriend">
		<back class="back"  content="添加好友"></back>
		
		<view class="main" v-if="setp.type ==1 || setp.type ==0">
			<view class="input">
				<input v-model="friend" type="text" placeholder-style="color:#fff;padding-left:30rpx;" value="" placeholder="请输入好友姓名" />
				<text @click="search">搜索</text>
			</view>
			
			<view class="adding" v-if="false">
				<view class="icon1"></view>
				<view class="icon2"></view>
			</view>
			
			<view class="ts">
				<ts v-if="flag.tsActive==index && setp.type==1" v-for="item,index in tsList" class="f" :content="item"></ts>
				<view class="icon">
					<view class="btn">
						<text @click="changeTs(index)" v-for="item,index in tsList.length" :key="index"></text>
					</view>
				</view>
			</view>
			
		</view>
		
		<view class="result" v-else>
			<view class="t">搜索结果</view>
			<view class="item">
				<text>SuMo</text>
				<view class="a" @click="addFriend">
					<text class="font_family icon-jia"></text>
					加为好友
				</view>
			</view>
		</view>
		
		
		<alertts v-if="flag.zh" :isBtn="false" content="您搜索的账号不存在"></alertts>
		<alertts v-if="flag.jt" @action="alertAction" content="以下内容涉及剧透"></alertts>
		<alertts v-if="flag.input" @action="inputAction" type="input"></alertts>
		<gts style="bottom: 40rpx;" @click.native="flag.jt = true"></gts>
		<ts v-if="flag.ts" class="jttt" :content="setp.title"></ts>
	</view>
</template>

<script>
	import alertts from '_c/alertTs'
	import back from '_c/back'
	import ts from '_c/ts'
	import gts from '_c/gts'
	export default{
		data(){
			return{
				friend:"",
				flag:{
					zh:false,
					jt:false,
					ts:false,
					input:false,
					tsActive:0
				},
				setp:{
					type:0,
					title:'SuMo'
				},
				tsList:['目前没有好友，需要进行添加','请在书信中寻找需要添加的人物','输入寄信人姓名ID(SuMo)，注意英文大小写']
			}
		},
		components:{
			back,alertts,ts,gts
		},
		methods:{
			search(){
				console.log(this.friend,this.friend == 'SuMo')
				if(this.friend == 'SuMo'){
					
					this.setp.type=2
					this.setp.title="将我的名字倒过来看看"
				
				}else{
					this.flag.zh = true
					setTimeout(()=>{
						this.flag.zh = false
					},3000)
				}
			},
			alertAction(type){
				if(type=="ok"){
					if(this.setp.type==0){
						this.setp.type =1
						this.flag.jt = false
					}else{
						
						this.flag.jt = false
						this.flag.ts = true
						setTimeout(()=>{
							this.flag.ts = false
						},5000)
					}
					
				}else{
					this.flag.jt = false
				}
			},
			inputAction(optiongs){
				this.flag.input = false
				if(typeof optiongs == 'string' ){
					//this.flag.input = false
				}else{
					if(optiongs.value == "oMuS"){
						this.$store.commit('addFrinend',{
							name:'SuMo',
							isNew:true,
							contacts:this.$store.state.pagesPlay.message.friendsOne.map((item,index)=>{
								item.index = index
								return item
							})
						})
						
						
						
						uni.navigateBack({
							delta:1
						})
					}else{
						this.flag.ts = true
						this.setp.title = "验证码错误"
						setTimeout(()=>{
							this.flag.ts = false
							this.setp.title="将我的名字倒过来看看"
						},3000)
						
					}
				}
			},
			changeTs(index){
				this.flag.tsActive = index
			},
			addFriend(){
				this.flag.input = true
			}
		}
	}
</script>

<style lang="less" >
	page{
		.playbg;
		background-image: url(/pagesPlay/img/index/addbg.png);
		background-size: 105% 107%;
		background-position: 0 0;
	}
	.index_message_addfriend{
		padding: 40rpx;
		padding-top: 120rpx;
		box-sizing: border-box;
		position: relative;
		.back{
			position: absolute;
			top: -10px;
			left: 0;
			width: 100%;
			z-index: 100; 
		}
		.main{
			position: relative;
			.input{
				input{
					padding:2px 10rpx;
					width: 50%;
					display: inline-block;
					color: white;
					background: linear-gradient(to right ,@blue-q,@blue-s,@blue-s);
				}
				text{
					color: @blue-q;
					position: relative;
					top: -10rpx;
					margin-left: 20rpx;
					font-size: 30rpx;
					letter-spacing: 10rpx;
					font-weight: bold;
				}
			}
			.ts{
				position: absolute;
				top: 60vh;
				left: 50%;
				transform: translateX(-50%);
				width: 100%;
				.f{
					width: 50%;
					left: 50%;
					transform: translateX(-50%);
				}
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
			.adding{
				padding-top: 30%;
				.icon1{
					width: 40vw;
					height: 40vw;
					background-image: url(/pagesPlay/img/index/adding.png);
					background-size: 100% 100%;
					margin: auto;
				}
				.icon2{
					width: 50vw;
					height: 100rpx;
					background-image: url(/pagesPlay/img/index/adding1.gif);
					background-size: 100% 100%;
					margin: auto;
				}
			}
		}
		.result{
			padding: 20rpx;
			color: @blue-q;
			font-size: 32rpx;
			.t{
				font-size: 36rpx;
				margin-bottom: 40rpx;
			}
			.item{
				font-weight: bold;
				.font_family{
					font-size: 24rpx;
				}
				.a{
					float: right;
					letter-spacing: 10rpx;
				}
			}
		}
		.jttt{
			position: fixed;
			bottom: 20%;
			left: 50%;
			transform: translateX(-50%);
			width: auto;
		}
	}
</style>
