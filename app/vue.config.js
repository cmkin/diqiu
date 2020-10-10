const webpack = require('webpack'),
	path = require('path');

const resolve = dir => {
	return path.join(__dirname, dir)
}


module.exports = {
	css: {
		loaderOptions: {
			less: {
				// 若使用 less-loader@5，请移除 lessOptions 这一级，直接配置选项。
				lessOptions: {
					modifyVars: {
						// 直接覆盖变量
	
						// 或者可以通过 less 文件覆盖（文件路径为绝对路径）
						hack: `true; @import "./src/assets/less/common.less";`,
					},
				},
			},
		},
	},
	chainWebpack: config => {
		config.resolve.alias
			.set('@', resolve('src')) // key,value自行定义，比如.set('@@', resolve('src/components'))
			.set('_c', resolve('src/components'))
			.set('_a', resolve('src/assets'))
	},
}
