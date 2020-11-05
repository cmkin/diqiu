<template>
	<view class="pagesplay_index_message_chat" :class="{hide:isHide}">
			<view class="top_bg"></view>
		<back class="back" :isback="false" content="SuMo"></back>

		<scroll-view :scroll-top="scrollTop" scroll-y="true" class="scroll-Y" @scrolltoupper="upper" @scrolltolower="lower"
		 @scroll="scroll">
			<view class="items_wrap">
				<view class="items">
					<view class="item animate__animated animate__slideInUp" :class="{'nan':item.type==1}" v-for="item in contacts">
						<view class="tx"></view>
						<view class="info" :class="{'wrap_img':item.value=='img'}">
							<view class="bgg">
								<view class="img" v-if="item.value=='img'">
									<image @click="bigImg(item.img,item.action?item.action:0)" @load="imgLoad" mode="widthFix" :src="item.img"></image>
								</view>
								<typed @click.native="showCt(item)" v-else @typedEd="typedEd" nospeend :speend="1" class="b" :str="item.value"></typed>
								
							</view>
						</view>
					</view>

				</view>
			</view>
		</scroll-view>




		<!-- <view class="bottom_bg"></view> -->
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
			<view class="input" v-else-if="!isSend">
				<typed :speend="80" str="......"></typed>
			</view>
			<text class="input" v-else v-html="nextContact"></text>
			<button type="default" @click="send()" hover-class="h" class="btn"></button>
		</view>



		<fonterx :type="1"></fonterx>


		<gts style="bottom: 200rpx;right:0rpx;z-index: 1000;" v-if="setp.active" @click.native="tsClick"></gts>
		<alertts fontSize="28rpx"  @action="alertAction" v-if="flag.jt" content="以下内容涉及剧透"></alertts>
		<alertts fontSize="22rpx" :mainStyle="{padding:'20rpx',width:'60%'}"  nospeend @action="flag.ct = false" v-if="flag.ct" :content="flag.ctConent"></alertts>



	</view>
</template>

<script>
	import back from '_c/back'
	import typed from '_c/typed'
	import gts from '_c/gts'
	import alertts from '_c/alertTs'
	import fonterx from '../../common/fonter.vue'
	export default {
		data() {
			return {
				scrollTop: 90000,
				old: {
					scrollTop: 0
				},
				isHide: true,
				flag: {
					jt: false,
					ct:false,
					ctConent:''
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
					isEnding: null, //章节 1 -第一章节
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
				/* let str = syArr.length > 0 ?
					syArr.filter(item => item.type == 1).length > 0 ? syArr.filter(item => item.type == 1)[0].value : '暂无更多' :
					'暂无更多' */
					let str = syArr.length > 0 ?syArr[0].value:'暂无更多'
				return str
			}

		},
		components: {
			back,
			typed,
			gts,
			alertts,
			fonterx
		},
		onLoad(optings) {
			let item = JSON.parse(optings.item)
			this.item = item
			/* console.log(this.contactActive)
			if(this.contactActive ==0){
				let contacts =  this.$store.state.pagesPlay.message.friendsOne.map((item, index) => {
						item.index = index
						return item
					}).slice(1,this.$store.state.pagesPlay.message.friendsOne.length)
					console.log(contacts)
				this.$store.commit('addFrinend', {
					name: 'SuMo',
					isNew: true,
					contacts:contacts
				})
				console.log(this.allContacts)
			} */
			

			setTimeout(() => {
				this.isHide = false
			}, 500)


			return
			uni.getStorage({
				key: 'progress',
				success: (res) => {
					console.log(res.data)
					var id = this.allContacts[this.contactActive].id
					console.log(id)
					let progress = res.data
					switch (progress) {
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
				this.scrollTop +=10
			},
			'scrollTop'(n){
				console.log(n)
			}
		},
		onShow() {
			uni.setStorage({
				key: 'chatContactActive',
				data: this.contactActive
			})
			uni.setStorage({
				key: 'chatFriends',
				data: this.$store.state.pagesPlay.message.friends
			})
		},
		onHide() {
			console.log("chatHide")
			uni.setStorage({
				key: 'chatContactActive',
				data: this.contactActive
			})
			uni.setStorage({
				key: 'chatFriends',
				data: this.$store.state.pagesPlay.message.friends
			})
		},
		onUnload() {
			console.log("chatun")
			uni.setStorage({
				key: 'chatContactActive',
				data: this.contactActive
			})
			uni.setStorage({
				key: 'chatFriends',
				data: this.$store.state.pagesPlay.message.friends
			})
		},
		methods: {
			send() {

				if (this.setp.active != null) {
					var id = this.allContacts[this.contactActive].id
					console.log(this.setp.active)
					if (this.setp.sendInput == '') {
						return
					}
					switch (this.setp.active) {
						case 1:


							if (this.setp.sendInput == 'KVAX') {
								//正确
								//保存进度
								this.setp.taiqiuActive = 0
								uni.setStorage({
									key: 'progress',
									data: this.setp.active,
									success: () => {
										this.setp.active = null
										this.$store.commit('concatFrinend', {
											name: this.item.name,
											arr: this.$store.state.pagesPlay.message.friendsTwo.map(item => {
												item.id = id + 1
												return item
											})
										})
										this.$store.commit("updeteChatActive", this.contactActive + 1)
									}
								})

								this.setp.sendInput = ''
							} else {
								//错误
								let obj1 = {
									name: this.item.name,
									obj: {
										id: id + 1,
										type: 1,
										value: this.setp.sendInput,
										isEnd:1
									}
								}
								this.$store.commit('updeteFrinend', obj1)
								this.$store.commit("updeteChatActive", this.contactActive + 1)


								let obj = {
									name: this.item.name,
									obj: {
										id: id + 1,
										type: 0,
										value: '错了啦，学长，我都已经想到答案啦。',
										isEnd:1
									}
								}
								setTimeout(()=>{
									this.$store.commit('updeteFrinend', obj)
									this.$store.commit("updeteChatActive", this.contactActive + 1)
								},500)
								
								this.setp.sendInput = ''
							}


							break;

						case 2:
							if (this.setp.sendInput == '124121') {
								//正确
								//保存进度
								this.setp.taiqiuActive = 0
								uni.setStorage({
									key: 'progress',
									data: this.setp.active,
									success: () => {
										this.setp.active = null
										this.$store.commit('concatFrinend', {
											name: this.item.name,
											arr: this.$store.state.pagesPlay.message.friendsThree.map(item => {
												item.id = id + 1
												return item
											})
										})
										this.$store.commit("updeteChatActive", this.contactActive + 1)
									}
								})

								this.setp.sendInput = ''
							} else {
								//错误
								let obj1 = {
									name: this.item.name,
									obj: {
										id: id + 1,
										type: 0,
										value: this.setp.sendInput,
										isEnd:2
									}
								}
								this.$store.commit('updeteFrinend', obj1)
								this.$store.commit("updeteChatActive", this.contactActive + 1)


								let obj = {
									name: this.item.name,
									obj: {
										id: id + 1,
										type: 1,
										value: '嗯，似乎和正确答案还有点距离，再想想吧.',
										isEnd:2
									}
								}
								setTimeout(()=>{
									this.$store.commit('updeteFrinend', obj)
									this.$store.commit("updeteChatActive", this.contactActive + 1)
								},500)
								
								this.setp.sendInput = ''
							}


							break;

						case 3:
						
							if (this.setp.sendInput == '56') {
								//正确
								//保存进度
								this.setp.taiqiuActive = 0
								uni.setStorage({
									key: 'progress',
									data: this.setp.active,
									success: () => {
										this.setp.active = null
										this.$store.commit('concatFrinend', {
											name: this.item.name,
											arr: this.$store.state.pagesPlay.message.friendsFour.map(item => {
												item.id = id + 1
												return item
											})
										})
										this.$store.commit("updeteChatActive", this.contactActive + 1)
									}
								})

								this.setp.sendInput = ''
							} else {
								//错误
								let obj1 = {
									name: this.item.name,
									obj: {
										id: id + 1,
										type: 0,
										value: this.setp.sendInput,
										isEnd:3
									}
								}
								this.$store.commit('updeteFrinend', obj1)
								this.$store.commit("updeteChatActive", this.contactActive + 1)


								let obj = {
									name: this.item.name,
									obj: {
										id: id + 1,
										type: 1,
										value: '嗯，好像哪里不对，老师的题目应该不会那么简单吧。让我再想想.',
										isEnd:3
									}
								}
								setTimeout(()=>{
									this.$store.commit('updeteFrinend', obj)
									this.$store.commit("updeteChatActive", this.contactActive + 1)
								},500)
								
								this.setp.sendInput = ''
							}


							break;


					}
					this.scrollTop +=10
				console.log(this.scrollTop)
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
				if (nowItem.hasOwnProperty("isEnd")) {
					
					this.setp.active = nowItem.isEnd
					return
				}
				//结束，下一章
				if (nowItem.isEnding) {
					this.setp.isEnding = nowItem.isEnding
					return
				}
				if (!nextItem) {
					return
				}
				this.scrollTop +=10
				setTimeout(() => {
					//this.isSend = true
				//	this.$store.commit("updeteChatActive", active + 1)
					
					if (nowItem.type == 1 && nextItem.type == 0) {
						setTimeout(() => {
							this.isSend = false
							this.$store.commit("updeteChatActive", active + 1)
							this.scrollTop +=10
						}, this.getSendTime(nowItem.value))
						return
					}
					
					if (nextItem.type ==0 && nowItem.type==0) {
						setTimeout(() => {
							this.isSend = false
							this.$store.commit("updeteChatActive", active + 1)
							this.scrollTop +=10
						}, this.getSendTime(nowItem.value))
						return
					} 
					
					this.isSend = true
				
				}, this.getSendTime(nowItem.value))
				
				
				
				
				return

				

				if (nowItem.type == 0 && nextItem.type == 1) {
					this.isSend = true
					//this.$store.commit("updeteChatActive",active+1)
					return
				}
				if (nowItem.type == 1 && nextItem.type == 0) {
					setTimeout(() => {
						this.isSend = false
						this.$store.commit("updeteChatActive", active + 1)
					}, this.getSendTime(nowItem.value))
					return
				}
				if (nextItem.type == nowItem.type) {
					setTimeout(() => {
						this.isSend = false
						this.$store.commit("updeteChatActive", active + 1)
					}, this.getSendTime(nowItem.value))
				} else {
					this.isSend = true
				}
				 this.scrollTop +=10

			},
			getSendTime(value) {
				let length = value.length
				let time = 0
				switch (length) {
					case length <= 10:
						time = 500
						break;
					case length <= 30:
						time = 1000
						break;
					case length <= 50:
						time = 2000
						break;
					default:
						time = 3000
				}

				return time
			},
			imgLoad() {
				//图片加载完成
				this.typedEd()
				this.scrollTop +=10
			},
			showCt(item){
				if(item.isCt){
					this.flag.ct = true
					this.flag.ctConent = item.isCt
				}
			},
			bigImg(src,action) {
				uni.navigateTo({
					url: "/pages/showImg/showImg?src=" + src + "&action="+action
				})
				this.showImg.src = src
				this.showImg.flag = true
			},
			goTop() {
				uni.pageScrollTo({
					scrollTop: 0,
					duration: 300
				});
			},
			tsClick() {
				console.log(123)
				//this.flag.jt = true
				if(this.setp.taiqiuActive <=1){
					this.alertAction('ok')
				}else{
					this.flag.jt = true
				}
				
			},
			alertAction(type) {
				if (type == 'ok') {
					this.flag.jt = false
					if (this.setp.active != null) {
						var id = this.allContacts[this.contactActive].id
						//进度到那一步了
						switch (this.setp.active) {
							case 1:
								switch (this.setp.taiqiuActive) {
									case 0:
										let obj = {
											name: this.item.name,
											obj: {
												id: id + 1,
												type: 0,
												value: '哈哈，我已经知道答案了，学长还没猜到嘛.试试利用格尺在老师笔记本中画画看.',
												isEnd:1
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
												value: '不同的力度，击出的长度不一样哟.',
												isEnd:1
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
												value: '学长真笨，答案是“KVAX”啦.',
												isEnd:1
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
												value: '认真的看看，这些弹孔之间都是有规律的.',
												isEnd:2
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
												value: '其实每行每列的弹孔都是独数.',
												isEnd:2
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
												value: '真笨，答案是“124121”.',
												isEnd:2
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
												value: '...嗯，这些米粒数字之间，似乎存在着什么样的规律，让我再想想.',
												isEnd:3
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
												value: '我发现了，原来后一位数为前一位数乘以3减1.可似乎还有什么地方不对劲.',
												isEnd:3
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
												value: '老师真实太聪明了，这些数字都是时间，单位为秒，去掉分钟数，这样规律就出来了.',
												isEnd:3
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
												value: '真笨,答案是"56"',
												isEnd:3
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
			},
			upper: function(e) {
				//console.log(e)
			},
			lower: function(e) {
				//console.log(e)
				//this.scrollTop = 90000
			},
			scroll: function(e) {
				//console.log(e)
				this.old.scrollTop = e.detail.scrollTop
			},
			goTop: function(e) {
				this.scrollTop = this.old.scrollTop
				this.$nextTick(function() {
					this.scrollTop = 0
				});
				uni.showToast({
					icon: "none",
					title: "纵向滚动 scrollTop 值已被修改为 0"
				})
			}
		},
		
	}
</script>

<style lang="less">
	page {
		background-image: none;
		background-color: #000;
	}
	
	.hide {
		opacity: 0;
	}

	.pagesplay_index_message_chat {
		position: relative;
		.playbg;
		background-image: url(/pagesPlay/img/index/addbg.png);
		background-size: 105% 100%;
		background-position: 0 0;
		color: #6BC9E5;
	
		height: 92vh;
		.scroll-Y{
			height: 70vh;
		}
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
			left: 5%;
			width: 90%;
			padding: 0;
			z-index: 15;

			.font_family {
				top: 0;
			}
		}

		.items_wrap {
			padding-bottom: 60rpx;
			padding-top: 80rpx;
		}

		.items {

			box-sizing: border-box;
			padding: 40rpx;
			padding-top: 60rpx;
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
					background-image: url(/pagesPlay/img/message/nan.png);
					background-size: 100% 100%;
				}

				.info {

					padding-right: 20%;
					font-size: 22rpx;
					line-height: 30rpx;
					.clearfix;

					.b {
						color: #6BC9E5;
					}

					.bgg {
						padding: 15rpx;
						box-sizing: border-box;
						border-radius: 2px;
						overflow: hidden;
						background-image: url(/pagesPlay/img/index/chat.png);
						background-size: 300% 100%;
						background-position: -200% 0rpx;
						display: inline-block;
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
					background-image: url(/pagesPlay/img/message/nv.png);
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

		.bottom_bg {
			position: fixed;
			bottom: 14vh;
			background: #000;
			box-sizing: border-box;
			width: 90vw;
			left: 4.5vw;
			height: 20vh;
			z-index: 10;
			background-image: url(/pagesPlay/img/index/addbg_b.png);
			background-size: 100% 120rpx;
			background-position: 0vh -1vh;
			background-repeat: no-repeat;
		}

		.top_bg {
			position: fixed;
			top: 0;
			left: 0;
			width: 100vw;
			height: 12vh;
			background: #000;
			z-index: 10;
			background-image: url(/pagesPlay/img/index/addbg.png);
			background-size: 105% 112vh;
			background-position: 0 0vh;
		}

		.send {
			position: fixed;
			bottom: 11vh;
			left: 5vw;
			z-index: 10;
			width: 90vw;
			height: 80px;
			z-index: 12;
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

			.ending {
				width: 70%;
				display: inline-block;
				padding-left: 10%;
				text-align: center;
				position: relative;
				top: -20rpx;

				text {
					display: inline-block;
					font-size: 32rpx;
					letter-spacing: 10rpx;
				}

				text:last-child {
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
