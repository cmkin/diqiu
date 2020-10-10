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
	@import url("//at.alicdn.com/t/font_2041681_rde6s50nsyi.css");
	
	.font_family{
		font-size: 40rpx;
	}
	body{
		background: url(assets/imgs/bg1.jpg) no-repeat 0 0;
		background-size: 100% 100%;
		background-repeat:no-repeat; 
		background-attachment:fixed;
	}
</style>
