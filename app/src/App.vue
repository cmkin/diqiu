<script>
	export default {
		onLaunch: function() {
			console.log('App Launch')
		},
		onShow: function() {
			console.log('App Show')
		},
		onHide: function() {
			console.log('App Hide')
		}
	}
</script>

<style>
	/*每个页面公共css */
	@import url("https://at.alicdn.com/t/font_2041681_rde6s50nsyi.css");
	@import url("animate.css");
	@font-face {
	  font-family: "regular";
	  src: url('./assets/fonts/RTWSYueGoTrial-Regular.otf');
	 
	}
	.font_family{
		font-size: 40rpx;
	}
	.animate__animated{
		animation-duration: .5s !important;
	}
	
	page{
		font-family: 'regular';
		background: url(assets/imgs/bg1.png) no-repeat 0 0;
		background-size: 100% 100%;
		background-repeat:no-repeat; 
		background-attachment:fixed;
		font-size: 24rpx;
	}
</style>
