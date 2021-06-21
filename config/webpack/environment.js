const { environment } = require('@rails/webpacker')
const { VueLoaderPlugin } = require('vue-loader')
const vue = require('./loaders/vue')
// 作ったstylusをrequireする
const stylus = require('./loaders/stylus') 

environment.plugins.prepend('VueLoaderPlugin', new VueLoaderPlugin())
environment.loaders.prepend('vue', vue)
module.exports = environment
// 作ったstylusをロード
environment.loaders.prepend('stylus', stylus) 
