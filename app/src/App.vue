<script>
	export default {
		onLaunch: function() {
			plus.navigator.setFullscreen(true);
			console.log('App Launch')
			uni.getStorage({
				key:'chatContactActive',
				success:(data)=>{
					this.$store.commit('updeteChatActive',data.data)
					//console.log(data)
				},
				fail(err) {
					console.log(err)
				}
			})
			
			uni.getStorage({
				key:'chatFriends',
				success:(data)=>{
					this.$store.commit('resetFrinend',data.data)
					//console.log(this.$store.state.pagesPlay.message.friends)
				},
				fail(err) {
					console.log(err)
				}
			})
			
		},
		onUnload() {
			uni.setStorage({
				key: 'chatContactActive',
				data: this.$store.state.pagesPlay.message.chat.active
			})
			uni.setStorage({
				key: 'chatFriends',
				data: this.$store.state.pagesPlay.message.friends
			})
		},
		onShow: function() {
			console.log('App Show')
		},
		onHide: function() {
			console.log('App Hide')
			uni.setStorage({
				key: 'chatContactActive',
				data: this.$store.state.pagesPlay.message.chat.active
			})
			uni.setStorage({
				key: 'chatFriends',
				data: this.$store.state.pagesPlay.message.friends
			})
		}
	}
</script>

<style>
	/*每个页面公共css */
	@import url("https://at.alicdn.com/t/font_2041681_mwb8s58cgn.css");
	@import url("animate.css");
	@font-face {
	  font-family: "regular";
	  src: url('./assets/fonts/RTWSYueGoTrial-Regular.otf');
	 
	}
	.font_family{
		font-size: 40rpx;
	}
	.animate__animated{
		animation-duration: .5s ;
	}
	
	page{
		font-family: 'regular';
		background-image: url(assets/imgs/bg1.png);
		background-size: 100% 100%;
		background-repeat:no-repeat; 
		background-attachment:fixed;
		font-size: 24rpx;
		padding-top: var(--status-bar-height);
		box-sizing: border-box;
		min-height: 100vh;
	}
	
</style>
