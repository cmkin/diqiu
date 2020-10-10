<template>
	<view 
	 class="wyb-transition-box"
	 v-if="isShow"
	 :class="bounceClass"
	 :style="{
		 '--bouncemiddle': 'scale(' + bounceMiddle + ')',
		 animationDuration: duration + 'ms',
		 animationTimingFunction: 'ease',
		 animationDelay: delay + 'ms',
		 transformOrigin: origin,
		 transitionDuration: duration + 'ms',
		 transitionDelay: delay + 'ms',
		 transitionTimingFunction: mode,
		 opacity: opacity || (typeList.includes('fade') ? 0 : 1),
		 transform: transform || autoTransform}">
		<slot></slot>
	</view>
</template>

<script>
	export default {
		name:'uni-transition',
		data() {
			return {
				isShow: false,
				opacity: null,
				transform: '',
				bouncing: false,
				bounceClass: ''
			}
		},
		computed: {
			autoTransform() {
				let result = ''
				const space = ' '
				const hundred = 100 
				if (this.typeList.includes('zoom-largen') || this.typeList.includes('bounce')) {
					result += `${space}scale(0)`
				} else if (this.typeList.includes('zoom-lessen')) {
					result += `${space}scale(${this.zoomLessenMulti})`
				}
				if (this.typeList.includes('rotate-cw')) {
					result += `${space}rotate(-180deg)`
				} else if (this.typeList.includes('rotate-aw')) {
					result += `${space}rotate(180deg)`
				}
				if (this.typeList.includes('slide-up')) {
					result += `${space}translateY(${hundred * this.multi}%)`
				} else if (this.typeList.includes('slide-down')) {
					result += `${space}translateY(-${hundred * this.multi}%)`
				}
				if (this.typeList.includes('slide-left')) {
					result += `${space}translateX(-${hundred * this.multi}%)`
				} else if (this.typeList.includes('slide-right')) {
					result += `${space}translateX(${hundred * this.multi}%)`
				}
				return result
			}
		},
		props: {
			isContentShow: {
				type: Boolean,
				default: false
			},
			duration: {
				type: Number,
				default: 400
			},
			typeList: {
				type: Array,
				default () {
					return ['fade']
				}
			},
			mode: {
				type: String,
				default: 'ease'
			},
			origin: {
				type: String,
				default: '50% 50%'
			},
			multi: {
				type: Number,
				default: 1
			},
			zoomLessenMulti: {
				type: Number,
				default: 1.5
			},
			bounceMiddle: {
				type: Number,
				default: 1.5
			},
			delay: {
				type: Number,
				default: 0
			}
		},
		watch: {
			// 监视isContentShow值的改变，演出相应动画
			isContentShow(val) {
				// 处理动画的函数
				this.init(val)
			}
		},
		methods: {
			init(val) {
				if (val) {
					this.isShow = true
					this.wait(10).then(() => {
						// 注册入场动画开始事件
						this.$emit('onComeIn')
						this.contentIn()
						this.wait(this.duration + 1).then(() => {
							// 注册入场动画结束事件
							this.$emit('finishComeIn')
						})
					})

				} else {
					// 注册退场动画开始事件
					this.$emit('onGoOut')
					this.contentOut()
					this.wait(this.duration + 1).then(() => {
						this.isShow = false
						// 注册退场动画结束事件
						this.$emit('finishGoOut')
					})
				}
			},
			contentIn() {
				const space = ' '
				if (this.typeList.includes('fade')) {
					this.opacity = 1
				}
				if (this.typeList.includes('zoom-largen') || this.typeList.includes('zoom-lessen')) {
					this.transform += `${space}scale(1)`
				} else if (this.typeList.includes('bounce')) {
					this.bounceClass = 'wyb-transition-bounce-in'
				}
				if (this.typeList.includes('rotate-cw') || this.typeList.includes('rotate-aw')) {
					this.transform += `${space}rotate(0)`
				}
				if (this.typeList.includes('slide-up') || this.typeList.includes('slide-down')) {
					this.transform += `${space}translateY(0)`
				}
				if (this.typeList.includes('slide-left') || this.typeList.includes('slide-right')) {
					this.transform += `${space}translateX(0)`
				}
			},
			contentOut() {
				if (this.typeList.includes('bounce')) {
					this.bounceClass = 'wyb-transition-bounce-out'
				}
				this.opacity = null
				this.transform = null
			},
			wait(time) {
				return new Promise(resolve => {
					setTimeout(() => {
						resolve()
					}, time)
				})
			}
		}
	}
</script>

<style>
	.wyb-transition-box {
		transition-property: opacity, transform;
	}
	
	.wyb-transition-bounce-in {
		animation-name: bounce-in;
		animation-fill-mode: forwards;
	}
	
	.wyb-transition-bounce-out {
		animation-name: bounce-out;
	}
	
	@keyframes bounce-in {
		0% {
			transform: scale(0);
		}
		
		50% {
			transform: var(--bouncemiddle);
		}
		
		100% {
			transform: scale(1);
		}
	}
	
	@keyframes bounce-out {
		0% {
			transform: scale(1);
		}
		
		50% {
			transform: var(--bouncemiddle);
		}
		
		100% {
			transform: scale(0);
		}
	}
</style>
