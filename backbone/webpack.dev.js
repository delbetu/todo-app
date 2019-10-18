const merge = require('webpack-merge')
const common = require('./webpack.common.js')
const webpack = require('webpack')

module.exports = function (env) {
  return merge(common, {
    mode: 'development',
    devtool: 'inline-source-map',
    devServer: {
      contentBase: './dist',
    },
    plugins: [
      new webpack.DefinePlugin({
        'process.env.apiHost': JSON.stringify('http://localhost:3000')
      })
    ]
  });
}
