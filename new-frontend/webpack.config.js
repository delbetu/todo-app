const path = require('path');

module.exports = {
  entry: {
    app: './src/index.js',
    helpers: './src/helpers/backbone_cors.js'
  },
  output: {
    filename: '[name].bundle.js',
    path: path.resolve(__dirname, 'dist'),
  },
};
