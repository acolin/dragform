var path = require('path');
var webpack = require('webpack');
var HtmlWebpackPlugin = require('html-webpack-plugin');
var CleanPlugin = require('clean-webpack-plugin');

var PATHS = {
  src: path.join(__dirname, 'src'),
  dist: path.join(__dirname, 'dist'),
  template: path.join(__dirname, 'html-webpack-template/index.ejs')
};

module.exports = {
  entry: {
    src: PATHS.src
  },
  devtool: 'source-map',
  output: {
    path: PATHS.dist,
    filename: 'dragform.min.js',
    libraryTarget: 'umd',
    library: 'DragForm'
  },
  plugins: [
    new webpack.optimize.UglifyJsPlugin({
      compress: { warnings: false }
    }),
    new HtmlWebpackPlugin({
      template: PATHS.template,
      title: 'dragform',
      appMountId: 'dragform',
      inject: false
    }),
    new CleanPlugin([PATHS.dist], {
      verbose: false
    })
  ],
  module: {
    loaders: [
      {test: /\.coffee/, loader: "coffee"}
    ]
  },
  resolve: {
    extensions: ["", ".web.coffee", "web.js", ".coffee", ".js"]
  }
};
