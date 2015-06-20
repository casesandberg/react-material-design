var path = require('path');
var gulp = require('gulp');
var webpack = require('webpack');
var WebpackDevServer = require('webpack-dev-server');
var cjsx = require('gulp-cjsx');
var rename = require('gulp-rename');
var coffee = require('gulp-coffee');

var fs = require('fs');


var config = {
  docs: {
    entry: ['webpack-dev-server/client?http://localhost:3000', 'webpack/hot/dev-server', './docs/index.coffee'],
    output: {
      path: path.join(__dirname, 'docs/build'),
      filename: 'bundle.js',
      publicPath: 'http://localhost:3000/docs/build'
    },
    module: {
      loaders: [
        {
          exclude: /node_modules/,
          test: /\.js$/,
          loaders: ['react-hot-loader']
        }, {
          test: /\.coffee$/,
          loaders: ['coffee-loader']
        }, {
          test: /\.cjsx$/,
          loaders: ['react-hot-loader', 'coffee-jsx-loader', 'react-map-styles']
        }, {
          test: /\.css$/,
          loaders: ['css-loader']
        }
      ]
    },
    resolve: {
      extensions: ['', '.js', '.coffee', '.cjsx'],
      fallback: [path.resolve(__dirname, './modules')]
    },
    plugins: [
      new webpack.HotModuleReplacementPlugin({ quiet: true }),
      new webpack.NoErrorsPlugin()
    ],
    devtool: 'eval',
    alias: {
      react: path.join(__dirname, 'node_modules', 'react')
    }
  }
};

gulp.task('bundle', function(done){

  gulp.src('./src/**/*.cjsx')
    .pipe(cjsx({bare: true}))
    .pipe(gulp.dest('lib'));

  gulp.src('./src/**/*.coffee')
    .pipe(coffee({bare: true}))
    .pipe(gulp.dest('lib'));

  done();
});

gulp.task('move', function(){
  gulp.watch([ './src/**/*.coffee', './src/**/*.cjsx' ], [ 'bundle' ]);
});


gulp.task('docs', function(done){
  done();
  return new WebpackDevServer( webpack( config.docs ), {
    publicPath: config.docs.output.publicPath,
    hot: true
  }).listen(3000, 'localhost', function(err, result) {
    if (err) {
      return console.log(err);
    } else {
      return console.log('webpack dev server listening at localhost:3000');
    }
  });
});
