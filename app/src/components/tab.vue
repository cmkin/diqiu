<template>
	<view class="g_tabs">
		<view class="items">
			<view class="item" @click="change(index)" :class="{active:active==index}" v-for="item,index in lists">
				<text>{{item.text}}</text>
			</view>
		</view>
		
	</view>
</template>

<script>
	
	export default{
		data(){
			return{
			  active:0
			}
		},
		props:{
			lists:{
				type:Array,
				default:()=> []
			},
			actives:{
				default:0
			}
		},
		mounted() {
			this.active = this.actives
		},
		methods:{
			change(index){
				this.active = index
				this.$emit('change',index)
			}
		}
	}
</script>

<style lang="less" scoped> 
	.g_tabs{
		.items{
			display: flex;
			.item{
				flex: 1;
				text-align: center;
				font-size: 34rpx;
				color: #78654E;
				font-weight: 600;
				padding: 10px 0;
				transition: all .3s;
			}
			.active{
				color: @shs;
				transform: scale(1.05);
			}
		}
	}
</style>
