const path = require('path');

module.exports = {
  mode: 'development',
  entry: {
    app: ['./src/index.js',
          './src/models/group-item-model.js',
          './src/models/item-model.js',
          './src/models/session-model.js',
          './src/collections/group-item-collection.js',
          './src/collections/item-collection.js',
          './src/views/group-item-card-view.js',
          './src/views/group-item-collection-view.js',
          './src/views/group-item-view.js',
          './src/views/item-view.js',
          './src/views/login.js'
    ],
    helpers: './src/helpers/backbone_cors.js'
  },
  devServer: {
    contentBase: './dist',
  },
  output: {
    filename: '[name].bundle.js',
    path: path.resolve(__dirname, 'dist'),
  },
  module: {
    rules: [
      { test: /\.html$/ , use: [ 'html-loader' ] },
      { test: /\.css$/ , use: [ 'style-loader', 'css-loader' ] }
    ]
  }
};
