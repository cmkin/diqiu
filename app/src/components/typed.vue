<template>
	<view class="g_typed">
		{{strShow}}
		<view class="element"></view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				strShow: ''
			}
		},
		props:{
			str:{
				default:''
			},
			speend:{
				type:[Number,String],
				default:150
			}
		},
		mounted() {
			this.star()
		},
		methods:{
			star(){
				let i = 0,
					timer = 0,
					_this = this,
					str = this.str
				function typing(){
					if (i <= str.length) {
						_this.strShow = str.slice(0, i++) + '_'
						timer = setTimeout(typing, _this.speend)
					} else {
						_this.str = str //结束打字,移除 _ 光标
						clearTimeout(timer)
						_this.$emit("typedEd")
					}
				}
				typing()
			}
		}
	}
</script>

<style lang="less" scoped>
	.g_typed {
		color: #fff;
	}
</style>
