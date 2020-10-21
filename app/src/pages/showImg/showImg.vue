<template>
	<view class="g_show_img">
		<back @click.native="back"  class="back"  content="查看图片"></back>
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
			this.src = data.src
		},
		methods:{
			back(){
				uni.navigateBack({
					delta:1
				})
			}
		}
	}
</script>

<style lang="less">
	page{
		background-image: none;
		background-color: #000;
		width: 100vw;
		height: 100vh;
	}
	.g_show_img{
		image{
			display: block;
			width: 100%;
			margin-top: 2vh;
		}
	}
</style>
