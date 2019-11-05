const path = require('path');
const HtmlWebPackPlugin = require('html-webpack-plugin')

module.exports = {
  entry: {
    app: ['./src/index.js',
          './src/models/group-item-model.js',
          './src/models/item-model.js',
          './src/models/auth-model.js',
          './src/collections/group-item-collection.js',
          './src/collections/item-collection.js',
          './src/views/group-item-card-view.js',
          './src/views/group-item-collection-view.js',
          './src/views/group-item-view.js',
          './src/views/item-view.js',
          './src/views/login.js'
    ]
  },
  output: {
    filename: '[name].bundle.js',
    path: path.resolve(__dirname, 'dist'),
    publicPath: '/',
  },
  module: {
    rules: [
      { test: /\.html$/ , use: [ 'html-loader' ] },
      { test: /\.css$/ , use: [ 'style-loader', 'css-loader' ] },
      {
        test: /\.jpe?g$|\.ico$|\.gif$|\.png$|\.svg$|\.woff$|\.ttf$|\.wav$|\.mp3$/,
        loader: 'file-loader?name=[name].[ext]'
      },
    ]
  },
  plugins: [
    new HtmlWebPackPlugin({
      template: "./src/index.html",
      filename: "./index.html"
    })
  ]
};
