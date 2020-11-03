import Vue from 'vue'
import uniCrazyRouter from "uni-crazy-router";
Vue.use(uniCrazyRouter)

uniCrazyRouter.beforeEach(async (to, from ,next)=>{
    // 逻辑代码
	if(to.url == 'pagesPlay/login/login' && !to.query.ok){
		uni.getStorage({
			key:"chatFriends",
			success(data){
				uni.navigateTo({
					url:"/pagesPlay/index/index"
				})
			},
			fail() {
				uni.navigateTo({
					url:"/pagesPlay/login/login?ok=true"
				})
			}
		})
	}else{
		 next()
	}
   
})

uniCrazyRouter.afterEach((to, from)=>{
    // 逻辑代码
})

uniCrazyRouter.onError((to, from)=>{
    // 逻辑代码
})