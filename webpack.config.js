var path = require('path');
var webpack = require('webpack');
var CleanWebpackPlugin = require('clean-webpack-plugin');
var CopyWebpackPlugin = require('copy-webpack-plugin');

var plugins = [];

if (process.env.NODE_ENV === 'production') {
  plugins.push(
    new webpack.optimize.OccurenceOrderPlugin(),
    new webpack.EnvironmentPlugin([
        'NODE_ENV'
    ]),
    new webpack.optimize.UglifyJsPlugin({
      compress: {
        warnings: false
      }
    }),
    new CleanWebpackPlugin(['build'], {
      root: __dirname,
      verbose: true, 
      dry: false
    }),
    new CopyWebpackPlugin([
      { from: 'src/assets', to: 'assets'}
    ])
  )
}

module.exports = {
  devServer: {
    hot: true,
    inline: true,
    stats: 'errors-only'
  },

  devtool: 'source-map',

  entry: './src/index',

  module: {
    loaders: [
      {
        test: /\.css$/,
        loaders: ['style', 'css', 'postcss']
      },
      {
        test: /\.html$/,
        exclude: /node_modules/,
        loader: 'file?name=[name].[ext]'
      },
      {
        test: /\.elm$/,
        exclude: [/elm-stuff/, /node_modules/],
        loader: 'elm-hot!elm-webpack?verbose=true&warn=true'
      }
    ],

    noParse: /\.elm$/
  },

  output: {
    path: path.join(__dirname, 'build'),
    filename: 'index.js',
    publicPath: '/static/'
  },

  plugins: plugins,

  postcss: function(webpack) {
    return [
      require("postcss-import"),
      require('postcss-cssnext')
    ];
  },

  resolve: {
    root: path.join(__dirname, 'src'),
    modulesDirectores: ['node_modules'],
    extensions: ['', '.js', '.elm']
  }
}