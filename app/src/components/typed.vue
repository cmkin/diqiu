<template>
	<view class="g_typed">
		{{str}}
		<view class="element"></view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				str: ''
			}
		},
		mounted() {
			let i = 0,
				timer = 0,
				_this = this,
				str = '用JS实现动态打字效果'
			function typing(){
				if (i <= str.length) {
					_this.str = str.slice(0, i++) + '_'
					timer = setTimeout(typing, 100)
				} else {
					_this.str = str //结束打字,移除 _ 光标
					clearTimeout(timer)
				}
			}
			typing()
		},
		methods:{
			star(){
				
			}
		}
	}
</script>

<style lang="less" scoped>
	.g_typed {
		color: #fff;
	}
</style>
