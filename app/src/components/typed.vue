<template>
	<view class="g_typed">
		<view v-html="strShow"></view>
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
			nospeend:{
				type:Boolean,
				default:false
			},
			speend:{
				type:[Number,String],
				default:150
			},
			className:{
				type:String
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
				 
				 if(this.nospeend){
					 
					 _this.strShow = str
					 _this.$emit("typedEd")
					 return
				 }
				 
				function typing(){
					if (i <= str.length) {
						_this.strShow = str.slice(0, i++) + '_'
						timer = setTimeout(typing, _this.speend)
					} else {
						_this.strShow = str //结束打字,移除 _ 光标
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
		display: inline-block;
	}
</style>
