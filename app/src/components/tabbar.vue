<style scoped lang="less">
	.tabbarMain {
		height: 120rpx;
	}

	.tabbarMainIphone {
		height: 256upx;
		padding-bottom: 64upx;
	}

	.tabBtnMina {
		width: 750upx;
		position: fixed;
		z-index: 50;
		width: 750upx;
		flex: 1;
		bottom: 0;
		left: 0;
		display: flex;
	}

	.tabBtnMinaIphone {
		height: 156upx;
		padding-bottom: 64upx;
		display: flex;
	}

	.imgse {
		width: 48upx;
		height: 48upx;
	}

	.txtBtn {
		font-size: 24upx;
		color: #666666;
	}

	.txtBtnSel {
		.txtBtn{
			color: #000;
		}
		.icon{
		  color: #000;	
		}
	}

	.itmMain {
		/* width: 250upx; */
		flex: 1;
		text-align: center;
		color: #666;
		.icon{
			background-color: @hs;
			border: 1px solid rgba(255,255,255,0.5);
			border-radius: 50%;
			width: 80rpx;
			height: 80rpx;
			line-height: 80rpx;
			margin: auto;
			text-align: center;
			.font_family{
				font-size: 80rpx;
				display: block;
			}
		}
	}

	.imgseTs {
		width: 150upx;
		height: 140upx;
		margin-bottom: 90upx;
		position: relative;
		z-index: 1;
		bottom: 0upx;
	}

	.btnfixMin {
		width: 750upx;
	
		position: absolute;
		z-index: 1;
		bottom: 0;
	}

	.btnfixMinIphone {
		bottom: 64upx;
	}

	.fixTpm {
		width: 150upx;
		height: 140upx;
		flex-direction: row;
		justify-content: center;
		align-items: center;
		position: relative;
		z-index: 0;
	}

	.imgseTsAnds {
		width: 150upx;
		height: 150upx;
		position: fixed;
		z-index: 1;
		bottom: 10upx;
		left: 50%;
		border-radius: 150upx;
		transform: translateX(-50%);
	}
</style>


<!-- 
    此版本需要注意
		1、如果此项目有地图模块功能的话   整个底部建议使用<cover-view><cover-image>进行标签改版      或者判断如果当前点击等于地图模块功能时候，却换成<cover-view><cover-image>进行原生渲染
 -->

<template>

	<view class="tabbarMain" :class="[flagTypeInfo? 'tabbarMainIphone':'']">
		
		<view class="tabBtnMina" :class="[flagTypeInfo? 'tabBtnMinaIphone':'']" mode="">
			<view class="itmMain" :class="{'txtBtnSel' :active==0}" @click.stop="switchTabFunc(0, '/pages/home')">
				<view class="icon">
					<text class="font_family icon-case" :class="{'animate__animated animate__bounceIn' :active==0}"></text>
				</view>
				<text class="txtBtn" >案件</text>
			</view>

			<view class="itmMain animate__animated" :class="{'txtBtnSel' :active==1}" @click.stop="switchTabFunc(1, '/pages/home')">
				<view class="icon">
					<text class="font_family icon-info" :class="{'animate__animated animate__bounceIn' :active==1}"></text>
				</view>
				<text class="txtBtn" >咨询</text>
			</view>

			<view class="itmMain animate__animated" :class="{'txtBtnSel' :active==2}" @click.stop="switchTabFunc(2, '/pages/help')">
				<view class="icon">
					<text class="font_family icon-my" :class="{'animate__animated animate__bounceIn' :active==2}"></text>
				</view>
				<text class="txtBtn" >我的</text>
			</view>

		</view>

	</view>
</template>

<script>
	export default {
		data() {
			return {
				active: Number, // 当亲选择那个按钮
				platforms: '', // 终端调整兼容
				leftWidth: 0, // 安卓 端使用
				flagTypeInfo: false, // 检测当前是否是IPHONE 异形屏幕
			}
		},
		mounted() {
			this.flagTypeInfo = this.$is_bang;
			let tempSystem = uni.getSystemInfoSync()
			this.platforms = tempSystem.platform

			this.$nextTick(() => {
				// #ifdef APP-NVUE || APP-PLUS || APP-PLUS-NVUE ||APP-VUE
				if (this.platforms == 'android') {
					let temp = this.$refs.leftWidth
					this.leftWidth = tempSystem.screenWidth / 2
				}
				// #endif
				this.active = this.actives
			})
		},
		props: {
			actives: {
				type: Number,
				default: 0
			}
		},
		//inject: ['_mainFuncInit'], // 父级传递过来的函数
		methods: {
			/**
			 * @name 初始化当前点击索引
			 * 解决初始化闪烁图标问题
			 * */
			getSetting(numbers) {
				this.active = numbers || 0
			},
			/**
			 * @name tab点击事件
			 * @param {number} index 当前点击的索引
			 * @param {string} Urls 当前点击带进来的链接
			 * */
			switchTabFunc(index, Urls) {
				this.active = index
				this.$emit("change",index)
				//this._mainFuncInit(index) // 回调父级函数
			}

		}
	
	}
</script>
