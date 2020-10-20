<template>
	<view class="g_show_img">
		<back class="back"  content="查看图片"></back>
		<image :src="src" mode="widthFix"></image>
	</view>
</template>

<script>
	import back from '_c/back'
	export default{
		data(){
			return{
				src:''
			}
		},
		components:{
			back
		},
		onLoad(data) {
			
		}
	}
</script>

<style lang="less" scoped>
	page{
		background: #000;
		width: 100vw;
		height: 100vh;
	}
	.g_show_img{
		
	}
</style>
