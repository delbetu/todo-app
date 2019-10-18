const merge = require('webpack-merge')
const common = require('./webpack.common.js')
const webpack = require('webpack')

module.exports = function (env) {
  return merge(common, {
    mode: 'production',
    devtool: 'source-map',
    plugins: [
      new webpack.DefinePlugin({
        'process.env.apiHost': JSON.stringify('https://todo--api.herokuapp.com')
      })
    ]
  });
}
