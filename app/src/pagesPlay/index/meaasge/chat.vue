<template>
	<view class="pagesplay_index_message_chat">
		<back class="back" content="SuMo"></back>

		<view class="items_wrap">
			<view class="items">
				<view class="item" :class="{'nan':item.type==1}" v-for="item in contacts">
					<view class="tx"></view>
					<view class="info" :class="{'wrap_img':item.value=='img'}">
						<view class="img" v-if="item.value=='img'">
							<image @click="bigImg(item.img)" @load="imgLoad" mode="widthFix" :src="item.img"></image>
						</view>
						<typed v-else @typedEd="typedEd" :speend="80" class="b" :str="item.value"></typed>
					</view>
				</view>

			</view>
		</view>



		<view class="send">
			<view class="ending" v-if="setp.isEnding">
				<text @click="goTop">上滑</text>
				<text>进入</text>
				<text>下一章</text>
				<text>......</text>
			</view>
			<view class="input_sr" v-else-if="setp.active">
				<input type="text" placeholder-style="color:#fff" placeholder="请输入答案" v-model="setp.sendInput" />
			</view>
			<text class="input" v-else v-html="nextContact"></text>
			<button type="default" @click="send()" hover-class="h" class="btn"></button>
		</view>


		<view class="showImg " @click="showImg.flag = false" v-if="showImg.flag">
			<image :src="showImg.src" mode="widthFix"></image>
		</view>


		<gts v-if="setp.active" @click.native="tsClick"></gts>
		<alertts @action="alertAction" v-if="flag.jt" content="以下内容涉及剧透"></alertts>
			
		
			
	</view>
</template>

<script>
	import back from '_c/back'
	import typed from '_c/typed'
	import gts from '_c/gts'
	import alertts from '_c/alertTs'
	export default {
		data() {
			return {
				flag: {
					jt: false
				},
				item: {},
				isSend: false,
				showImg: {
					flag: false,
					src: ''
				},
				setp: {
					active: null, //1 台球提示 , 2//神射手
					sendInput: '',
					taiqiuActive: 0,
					isEnding:null, //章节 1 -第一章节
				}
			}
		},
		computed: {
			allContacts() {
				return this.$store.state.pagesPlay.message.friends.filter(item => item.name == this.item.name)[0].contacts
			},
			contactActive() {
				return this.$store.state.pagesPlay.message.chat.active
			},
			contacts() {
				let contacts = this.allContacts
				let active = this.contactActive
				return contacts.slice(0, active + 1)
			},
			nextContact() {
				let contacts = this.allContacts
				let active = this.contactActive
				let syArr = contacts.slice(active + 1, contacts.length)
				let str = syArr.length > 0 ?
					syArr.filter(item => item.type == 1).length > 0 ? syArr.filter(item => item.type == 1)[0].value : '暂无更多' :
					'暂无更多'
				return str
			}

		},
		components: {
			back,
			typed,
			gts,
			alertts
		},
		onLoad(optings) {
			let item = JSON.parse(optings.item)
			this.item = item
			
			
			
			uni.getStorage({
				key:'progress',
				success: (res) => {
					console.log(res.data)
					var id = this.allContacts[this.contactActive].id
						console.log(id)
					let progress = res.data
					switch(progress){
						/* case 1:
							this.$store.commit('concatFrinend',{
								name:this.item.name,
								arr:this.$store.state.pagesPlay.message.friendsTwo.map(item=>{
									item.id = id+1
									return item
								})
							})
							this.$store.commit("updeteChatActive", this.contactActive + 1)
						break; */
					}
				}
			})

		},
		watch: {
			'contactActive'(n) {
				uni.pageScrollTo({
					scrollTop: 9000000,
					duration: 300
				});
			}
		},
		onShow() {

		},
		methods: {
			send() {

				if (this.setp.active != null) {
					var id = this.allContacts[this.contactActive].id
						console.log(this.setp.active)
					switch (this.setp.active) {
						case 1:

						
							if (this.setp.sendInput == 'KVAX') {
								//正确
								//保存进度
								uni.setStorage({
									key:'progress',
									data:this.setp.active,
									success:()=>{
										this.setp.active = null
										this.$store.commit('concatFrinend',{
											name:this.item.name,
											arr:this.$store.state.pagesPlay.message.friendsTwo.map(item=>{
												item.id = id+1
												return item
											})
										})
										this.$store.commit("updeteChatActive", this.contactActive + 1)
									}
								})
								
								
							} else {
								//错误
								let obj1 = {
									name: this.item.name,
									obj: {
										id: id + 1,
										type: 1,
										value: this.setp.sendInput
									}
								}
								this.$store.commit('updeteFrinend', obj1)
								this.$store.commit("updeteChatActive", this.contactActive + 1)
								
								
								let obj = {
									name: this.item.name,
									obj: {
										id: id + 1,
										type: 0,
										value: '错了啦，学长，我都已经想到答案啦。'
									}
								}
								this.$store.commit('updeteFrinend', obj)
								this.$store.commit("updeteChatActive", this.contactActive + 1)
								this.setp.sendInput = ''
							}


						break;
						
						case 2:
							if (this.setp.sendInput == '1234') {
								//正确
								//保存进度
								uni.setStorage({
									key:'progress',
									data:this.setp.active,
									success:()=>{
										this.setp.active = null
										this.$store.commit('concatFrinend',{
											name:this.item.name,
											arr:this.$store.state.pagesPlay.message.friendsThree.map(item=>{
												item.id = id+1
												return item
											})
										})
										this.$store.commit("updeteChatActive", this.contactActive + 1)
									}
								})
								
								
							} else {
								//错误
								let obj1 = {
									name: this.item.name,
									obj: {
										id: id + 1,
										type: 0,
										value: this.setp.sendInput
									}
								}
								this.$store.commit('updeteFrinend', obj1)
								this.$store.commit("updeteChatActive", this.contactActive + 1)
								
								
								let obj = {
									name: this.item.name,
									obj: {
										id: id + 1,
										type: 1,
										value: '嗯，似乎和正确答案还有点距离，再想想吧.'
									}
								}
								this.$store.commit('updeteFrinend', obj)
								this.$store.commit("updeteChatActive", this.contactActive + 1)
								this.setp.sendInput = ''
							}
							
							
						break;
						
						case 3:
							if (this.setp.sendInput == '56') {
								//正确
								//保存进度
								uni.setStorage({
									key:'progress',
									data:this.setp.active,
									success:()=>{
										this.setp.active = null
										this.$store.commit('concatFrinend',{
											name:this.item.name,
											arr:this.$store.state.pagesPlay.message.friendsFour.map(item=>{
												item.id = id+1
												return item
											})
										})
										this.$store.commit("updeteChatActive", this.contactActive + 1)
									}
								})
								
								
							} else {
								//错误
								let obj1 = {
									name: this.item.name,
									obj: {
										id: id + 1,
										type: 0,
										value: this.setp.sendInput
									}
								}
								this.$store.commit('updeteFrinend', obj1)
								this.$store.commit("updeteChatActive", this.contactActive + 1)
								
								
								let obj = {
									name: this.item.name,
									obj: {
										id: id + 1,
										type: 1,
										value: '嗯，好像哪里不对，老师的题目应该不会那么简单吧。让我再想想.'
									}
								}
								this.$store.commit('updeteFrinend', obj)
								this.$store.commit("updeteChatActive", this.contactActive + 1)
								this.setp.sendInput = ''
							}
							
							
						break;
						
					
					}

					return
				}

				if (this.isSend && this.setp.active == null) {
					let active = this.contactActive
					this.isSend = false
					this.$store.commit("updeteChatActive", active + 1)

				}

			},
			typedEd() {
				//播放完成

				let active = this.contactActive
				let allContacts = this.allContacts
				let nowItem = allContacts[active]
				let nextItem = allContacts[active + 1]
				//中间穿插的交互
				if(nowItem.hasOwnProperty("isEnd")){
					this.setp.taiqiuActive = 0
					this.setp.active = nowItem.isEnd	
					return
				}
				//结束，下一章
				if(nowItem.isEnding){
					this.setp.isEnding = nowItem.isEnding
					return
				}

				if (!nextItem) {
					return
				}

				if (nowItem.type == 0 && nextItem.type == 1) {
					this.isSend = true
					//this.$store.commit("updeteChatActive",active+1)
					return
				}
				if (nowItem.type == 1 && nextItem.type == 0) {
					this.isSend = false
					this.$store.commit("updeteChatActive", active + 1)
					return
				}
				if (nextItem.type == nowItem.type) {
					this.isSend = false
					this.$store.commit("updeteChatActive", active + 1)
				} else {
					this.isSend = true
				}


			},
			imgLoad() {
				//图片加载完成
				this.typedEd()
				uni.pageScrollTo({
					scrollTop: 9000000,
					duration: 300
				});
			},
			bigImg(src) {
				this.showImg.src = src
				this.showImg.flag = true
			},
			goTop(){
				uni.pageScrollTo({
					scrollTop: 0,
					duration: 300
				});
			},
			tsClick() {
				this.flag.jt = true
			},
			alertAction(type) {
				if (type == 'ok') {
					this.flag.jt = false
					if (this.setp.active != null) {
						var id = this.allContacts[this.contactActive].id
						//进度到那一步了
						switch(this.setp.active){
							case 1:
								switch (this.setp.taiqiuActive) {
									case 0:
										let obj = {
											name: this.item.name,
											obj: {
												id: id + 1,
												type: 0,
												value: '哈哈，我已经知道答案了，学长还没猜到嘛.试试利用格尺在老师笔记本中画画看.'
											}
										}
										this.setp.taiqiuActive++
										this.$store.commit('updeteFrinend', obj)
										this.$store.commit("updeteChatActive", this.contactActive + 1)
									break;
									case 1:
										let obj1 = {
											name: this.item.name,
											obj: {
												id: id + 1,
												type: 0,
												value: '不同的力度，击出的长度不一样哟.'
											}
										}
										this.setp.taiqiuActive++
										this.$store.commit('updeteFrinend', obj1)
										this.$store.commit("updeteChatActive", this.contactActive + 1)
									break;
									case 2:
										let obj2 = {
											name: this.item.name,
											obj: {
												id: id + 1,
												type: 0,
												value: '学长真笨，答案是“KVAX”啦.'
											}
										}
										this.$store.commit('updeteFrinend', obj2)
										this.$store.commit("updeteChatActive", this.contactActive + 1)
									break;
								}
									
							break;
							case 2:
								switch (this.setp.taiqiuActive) {
									case 0:
										let obj = {
											name: this.item.name,
											obj: {
												id: id + 1,
												type: 1,
												value: '认真的看看，这些弹孔之间都是有规律的.'
											}
										}
										this.setp.taiqiuActive++
										this.$store.commit('updeteFrinend', obj)
										this.$store.commit("updeteChatActive", this.contactActive + 1)
									break;
									case 1:
										let obj1 = {
											name: this.item.name,
											obj: {
												id: id + 1,
												type: 1,
												value: '其实每行每列的弹孔都是独数.'
											}
										}
										this.setp.taiqiuActive++
										this.$store.commit('updeteFrinend', obj1)
										this.$store.commit("updeteChatActive", this.contactActive + 1)
									break;
									case 2:
										let obj2 = {
											name: this.item.name,
											obj: {
												id: id + 1,
												type: 1,
												value: '真笨，答案是“1234”.'
											}
										}
										this.$store.commit('updeteFrinend', obj2)
										this.$store.commit("updeteChatActive", this.contactActive + 1)
									break;
								}
									
							break;
							case 3:
								switch (this.setp.taiqiuActive) {
									case 0:
										let obj = {
											name: this.item.name,
											obj: {
												id: id + 1,
												type: 1,
												value: '...嗯，这些米粒数字之间，似乎存在着什么样的规律，让我再想想.'
											}
										}
										this.setp.taiqiuActive++
										this.$store.commit('updeteFrinend', obj)
										this.$store.commit("updeteChatActive", this.contactActive + 1)
									break;
									case 1:
										let obj1 = {
											name: this.item.name,
											obj: {
												id: id + 1,
												type: 1,
												value: '我发现了，原来后一位数为前一位数乘以3减1.可似乎还有什么地方不对劲.'
											}
										}
										this.setp.taiqiuActive++
										this.$store.commit('updeteFrinend', obj1)
										this.$store.commit("updeteChatActive", this.contactActive + 1)
									break;
									case 2:
										let obj2 = {
											name: this.item.name,
											obj: {
												id: id + 1,
												type: 1,
												value: '老师真实太聪明了，这些数字都是时间，单位为秒，去掉分钟数，这样规律就出来了.'
											}
										}
										this.setp.taiqiuActive++
										this.$store.commit('updeteFrinend', obj2)
										this.$store.commit("updeteChatActive", this.contactActive + 1)
									break;
									case 3:
										let obj3 = {
											name: this.item.name,
											obj: {
												id: id + 1,
												type: 1,
												value: '真笨,答案是"56"'
											}
										}
										this.setp.taiqiuActive++
										this.$store.commit('updeteFrinend', obj3)
										this.$store.commit("updeteChatActive", this.contactActive + 1)
									break;
								}
									
							break;
							
						}
						
						return
					}
				} else {
					this.flag.jt = false
				}
			}
		}
	}
</script>

<style lang="less">
	page {
		.playbg;
		background-image: url(/pagesPlay/img/index/addbg.png);
		background-size: 105% 107%;
		background-position: 0 0;
		color: @blue-q;
	}

	.pagesplay_index_message_chat {
		position: relative;

		.showImg {
			position: fixed;
			z-index: 100;
			top: 0;
			left: 0;
			width: 100vw;
			height: 100vh;

			image {
				position: absolute;
				top: 2%;
				left: 0;
				width: 100%;
			}
		}

		.back {
			position: fixed;
			top: 60rpx;
			left: 15%;
			width: 70%;
			padding: 0;
			z-index: 10;

			.font_family {
				top: 0;
			}
		}

		.items_wrap {
			padding-bottom: 30vh;
			padding-top: 80rpx;
		}

		.items {

			box-sizing: border-box;
			padding: 40rpx;

			.item {
				padding-left: 120rpx;
				position: relative;
				margin-bottom: 30rpx;
				min-height: 80rpx;

				.tx {
					position: absolute;
					left: 20rpx;
					top: 0;
					width: 80rpx;
					height: 80rpx;
					background-image: url(/pagesPlay/img/message/nv.jpg);
					background-size: 100% 100%;
				}

				.info {
					padding-right: 20%;
					font-size: 22rpx;
					line-height: 30rpx;
					.clearfix;

					.b {
						color: @blue-q;
					}

					color: @blue-q;
				}

				.wrap_img {
					text-align: right;

					.img {
						width: 30vw;
						display: inline-block;

						image {
							width: 30vw;
							display: inline-block;
							width: 100%;
						}
					}
				}

			}

			.item.nan {
				padding-left: 0;
				padding-right: 120rpx;

				.tx {
					background-image: url(/pagesPlay/img/message/nan.jpg);
					left: auto;
					right: 20rpx;
				}

				.info {
					text-align: right;
					padding-left: 20%;
					padding-right: 0;
					color: @blue-q;

					.b {
						text-align: left;
					}
				}
			}
		}

		.send {
			position: fixed;
			bottom: 40rpx;
			left: 5vw;
			z-index: 10;
			width: 90vw;
			height: 80px;
			box-sizing: border-box;

			.input_sr {
				background-image: url(/pagesPlay/img/index/addFriend.png);
				background-size: 200% 200%;
				background-position: -130rpx -40rpx;
				display: inline-block;
				width: 70%;
				padding: 0 20rpx;
				box-sizing: border-box;

				input {
					height: 70rpx;
					display: block;
					width: 100%;

				}
			}

			.input {
				display: inline-block;
				width: 70%;
				padding: 20rpx;
				background-image: url(/pagesPlay/img/index/addFriend.png);
				background-size: 200% 200%;
				background-position: -130rpx -40rpx;
				font-size: 26rpx;
				.omg;
			}
			
			.ending{
				width: 70%;
				display: inline-block;
				padding-left: 10%;
				text-align: center;
				position: relative;
				top: -20rpx;
				text{
					display: inline-block;
					font-size: 32rpx;
					letter-spacing: 10rpx;
				}
				text:last-child{
					letter-spacing: 1px;
				}
			}
			
			.btn {
				background: none;
				display: inline-block;
				width: 80rpx;
				height: 80rpx;
				background-image: url(/pagesPlay/img/message/send.png);
				background-size: 100% 100%;
				margin-left: 30rpx;
				opacity: .8;
				position: relative;
				top: 2px;
			}

			.h {
				opacity: 1;
			}
		}

	}
</style>
