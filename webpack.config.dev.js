module.exports = {
  devServer: {
    inline: true,
    stats: 'errors-only'
  }

  devtool: 'source-map',

  entry: './src/index.js',

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
        loader: 'elm-webpack?warn=1'
      }
    ],

    noParse: /\.elm$/
  },

  output: {
    path: './build',
    filename: 'index.js'
  },

  postcss: function(webpack) {
    return [
      require("postcss-import")({ addDependencyTo: webpack }),
      require('postcss-cssnext')
    ];
  },

  resolve: {
    modulesDirectores: ['node_modules'],
    extensions: ['', ',js', '.elm']
  }
}
