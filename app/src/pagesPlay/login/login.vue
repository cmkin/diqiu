<template>
	<view class="play_index ">
		<view class="bg animate__animated animate__backInLeft">
			<view class="topbg">
				<view class="icon1"></view>
				<view class="icon2"></view>
			</view>
			<view class="main">
				
				<view class="login">
					<input v-model="password" placeholder-style="color:#fff;" placeholder="输入密码" type="text" value="" />
					<button @click="login" hover-class="h" type="default">登录</button>
				</view>
				
				<view class="ts" :class="{opacity:flag.ts}">
					<ts v-if="flag.tsActive==index && flag.ts" v-for="item,index in tsList" class="f" :content="item"></ts>
					<view class="icon">
						<view class="btn">
							<text @click="changeTs(index)" v-for="item,index in tsList.length" :key="index"></text>
						</view>
					</view>
				</view>
				
			</view>
			
		</view>
		
		
		
		
		<gts @click.native=" flag.ts = true"></gts>
		
		<alertts v-if="flag.jt" @action="alertAction" content="以下内容涉及剧透"></alertts>
		<alertts v-if="flag.error" :isBtn="false" content="指令错误,请重试"></alertts>
		
	</view>
</template>

<script>
	import gts from '_c/gts'
	import typed from '_c/typed'
	import alertts from '_c/alertTs'
	import ts from '_c/ts'
	export default{
		data(){
			return{
				password:'',//wcorz
				player:null,
				flag:{
					jt:false,
					ts:false,
					tsActive:0,
					error:false
				},
				tsList:['请从SuMo的信件中寻找线索',
					'SuMo是个严谨的人，为什么说那么奇怪的话？',
					'请从信件中奇怪的表情中,找出一组英文字母指令;']
			}
		},
		components:{
			gts,typed,alertts,ts
		},
		onLoad() {
			//播放
			
			this.player = plus.audio.createPlayer("/static/mp3/bg.mp3")
			if(this.player.isPaused()){
				this.player.play() 
			}
		},
		onUnload(){
			this.player.stop()
		},
		onHide() {
			console.log("hide")
			
		},
		methods:{
			alertAction(type){
				if(type=='ok'){
					this.flag.jt = false
					this.flag.tsActive = 2
					this.flag.ts = true
				}else{
					this.flag.jt = false
				} 
			},
			changeTs(index){
				if(this.flag.tsActive==0 && index==2){
					return
				}
				if(index==2){
					this.flag.jt = true
					return
				}
				this.flag.tsActive = index
			},
			login(){
				if(this.password.toLocaleLowerCase()=='wcorz'){
					uni.navigateTo({
						url:"/pagesPlay/index/index"
					})
				}else{
					this.flag.error = true
					setTimeout(()=>{
						this.flag.error = false
					},3000)
				}
			}
		}
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
					width: 190rpx;
					height: 185rpx;
					background-image: url(/pagesPlay/img/login1.gif);
					background-size: 100% 100%;
				}
				
			}
			
			.main{
				.ts{
					margin-top: 100rpx;
					position: relative;
					opacity: 0;
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
				.opacity{
					opacity: 1;
				}
				.login{
					background-image: url(/pagesPlay/img/login.png);
					background-size: 100% 100%;
					text-align: center;
					padding:80rpx 80rpx;
					padding-bottom: 20rpx;
					width: 60%;			
					margin: auto;
					input{
						padding: 20rpx;
						display: inline-block;
						color: #fff;
						font-size: 30rpx;
						background: linear-gradient(to right,rgba(64, 193, 235,1),rgba(45, 125, 158,1),rgba(35, 95, 121,1));
					}
					button{
						display: block;
						font-size: 40rpx;
						color: @blue-q;
						letter-spacing: 20rpx;
						width: 50%;
						margin: auto;
						background: none;
					}
					.h{
						color: @blue-s;
					}
				}
			}
			
			
		}
		
	}
</style>
