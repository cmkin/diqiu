<template>
	<view class="g_show_img">
		<back style="background: #000;" class="back" content="查看图片"></back>
		<view class="main" v-if="action == 0">
			<movable-area scale-area class="movable_area">
				<movable-view :out-of-bounds="true" direction="all"  :inertia="true" :scale="true" scale-min="1" scale-max="3" >
					<image :src="src" mode="widthFix"></image>
				</movable-view>
			</movable-area>
		</view>
		
		<view class="action_1" v-if="action == 1">
			<image class="mimg" :src="src" mode="widthFix"></image>
			<view class="box">
				<view class="x" v-for="x,xi in dkResult[0].data">
					<view class="y" v-html="DkBg(x,y)" @tap="changeDk(xi,yi)" v-for="y,yi in x">
						
					</view>
				</view>
			</view>
			
			<view class="btns">
				
				<text @click="actionoOk()">确定</text>
				<text @click="actionoClear()">清除</text>
			</view>
			
		</view>
		
		<ts v-if="ts.flag" :styles="{textAlign:'center'}" style="bottom: 20rpx;width: 50%;left: 25%;text-align: center;" :content="ts.title"></ts>
		
	</view>
</template>

<script>
	import back from '_c/back'
	import ts from '_c/ts'
	export default {
		data() {
			return {
				src: '',
				action:0,
				ts:{
					title:'',
					flag:false
				},
				dkResult:[
					{
						data:[ // 0返回 空  1 返回错误 2 // 正确
							[0,0,0,0,0,0,0],
							[0,0,0,0,0,0,0],
							[0,0,0,0,0,0,0],
							[0,0,0,0,0,0,0],
							[0,0,0,0,0,0,0],
							[0,0,0,0,0,0,0],
							[0,0,0,0,0,0,0]
						],
						sure:[
							[],
							[3],
							[1,3],
							[0,2,5,6],
							[1],
							[2,3],
							[3]
						],
						
					}
				]
			}
		},
		components: {
			back,ts
		},
		onLoad(data) {
			console.log(data)
		    this.action = data.action
			this.src = data.src
		},
		methods: {
			changeDk(x,y){
				 this.dkResult[0].data[x][y] = this.dkResult[0].data[x][y] == 1 ? 0 : 1
				/* let flag =  this.dkResult[0].sure[x].some(item=>item==y)
					if(flag){
						this.dkResult[0].data[x][y] = 2
					}else{
						this.dkResult[0].data[x][y] = 1
						setTimeout(()=>{
							this.dkResult[0].data[x][y] = 0
							this.$forceUpdate()
						},1000)
					} */
					this.$forceUpdate()
			},
			DkBg(x,y){
				if(y == 1){
					return `<view class="ok"></view>`
				}else{
					return ''
				}
				/* switch(y){
					case 1:
						return "<view class='error'>x</view>"
					break;
					case 2:
					  return `<view class="ok"></view>`
					break;
					default:
						return ``
				} */
				
			},
			actionoOk(){
				let change = true
				
				let changeArr = this.dkResult[0].data.map(item=>{
					return item.map((tt,ii)=>{
						if(tt==1){
							return ii
						}else{
							return 'no'
						}
					}).filter(tt=>typeof tt == 'number' )
				}) 
				
				this.dkResult[0].sure.forEach((item,index)=>{
					
					if(item.length != changeArr[index].length){
						change = false
					}
					
				})
				
				if(change){
					this.ts.title = "答案正确"
					
					console.log("成功")
				}else{
					console.log("失败")
					this.ts.title = "答案错误,请重试"
					//this.actionoClear()
				}
				this.ts.flag = true
				setTimeout(()=>{
					this.ts.flag = false
				},5000)
			},
			actionoClear(){
				this.dkResult[0].data = this.dkResult[0].data.map(x=>{
					return x.map(y=>y=0)
				})
			}
		}
	}
</script>

<style lang="less">
	page {
		background-image: none;
		background-color: #000;
		width: 100vw;
		height: 100vh;
		padding: 0;
	}

	.g_show_img {
		width: 100vw;
		height: 100vh;
		.back{
			padding-top: calc(20rpx + var(--status-bar-height)) ;
			position: fixed;
			width: 100vw;
			top: 0;
			.font_family{
				top: calc(20rpx var(--status-bar-height));
			}
		}
		.main{
			
		}
		.movable_area{
			position: relative;
			left: -180vw;
			top: -150vw;
			height: 400vh;
			width: 400vw;
			movable-view{
				left: 180vw;
				top: 85vh;
			}
			image{
				display: block;
				width: 100vw;
				
			} 
		}
		
		
		.action_1{
			padding-top: 10vh;
			box-sizing: border-box;
			position: relative;
			.mimg{
			
				display: block;
				width: 100vw;
			}
			.box{
				position: absolute;
				width: 55%;
				height: 31%;
				top: 46.5%;
				left: 24%;
				z-index: 10;
				.x{
					height: calc(100% / 7);
					display: flex;
					.y{
						flex: 1;
						height: 100%;
						position: relative;
						.error{
							position: absolute;
							width: 100%;
							height: 100%;
							text-align: center;
							font-size: 40rpx;
							font-weight: bold;
							color: red;
							line-height: 60rpx;
						}
						.ok{
							position: absolute;
							width: 60%;
							left: 18%;
							top: 20%;
							height: 60%;
							background-image: url("/pagesPlay/img/message/sss_dk.png");
							background-size: 100% 100%;
							
						}
					}
				}
				
			}
			.btns{
				position: absolute;
				bottom: 30rpx;
				left: 0;
				width: 100%;
				padding: 0 60rpx;
				box-sizing: border-box;
				text{
					color: @blue-q;
					font-size: 32rpx;
					font-weight: bold;
					display: inline-block;
					background: none;
					border: none;
					box-shadow: none;
				}
				text:last-child{
					float: right;
				}
			}
		}
		
	}
</style>
