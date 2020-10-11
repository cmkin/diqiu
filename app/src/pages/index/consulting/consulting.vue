<template>
	<view class="index_consulting">
		<tab class="tab" @change="tabChange" :lists="tabLists"></tab>
		
		
		
		<strategy class="" v-if="tabActive==0"></strategy>
		
		<news class=""  v-if="tabActive==1"></news>
		
		
	</view>
</template>



<script>
	import tab from '_c/tab'
	import strategy from './strategy'
	import news from './news'
	export default {
		data(){
			return{
				tabLists:[
					{
						text:"攻略"
					},
					{
						text:"新闻"
					},
				],
				tabActive:0
			}
		},
		components:{tab,strategy,news},
		mounted() {
			
		},
		methods:{
			tabChange(index){
				this.tabActive = index
			}
		}
	}
</script>

<style lang="less" scoped="scoped">
	.index_consulting{
		width: 100%;
		min-height: 100vh;
		background: url(~@/assets/imgs/bg1.png) no-repeat 0 0;
		background-size: 100% 100%;
		background-repeat:no-repeat; 
		background-attachment:fixed;
		padding: 6vh 20px 0;
		box-sizing: border-box;
		.tab{
			width: 70%;
			margin: auto;
		}
	}
</style>
