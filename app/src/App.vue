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
	@import url("assets/css/iconfont.css");
	@import url("animate.css");
	.font_family{
		font-size: 40rpx;
	}
	.animate__animated{
		animation-duration: .5s !important;
	}
	page{
		background: url(assets/imgs/bg1.jpg) no-repeat 0 0;
		background-size: 100% 100%;
		background-repeat:no-repeat; 
		background-attachment:fixed;
	}
</style>
