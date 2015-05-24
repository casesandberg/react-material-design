var gulp = require('gulp');
var mocha = require('gulp-mocha');
var coffee = require('gulp-coffee');
var concat = require('gulp-concat');
require('coffee-script/register');



gulp.task('test', function(){
  return gulp.src('./test/**/*.coffee')
             .pipe(mocha());
});

gulp.task('watch', function(done) {
  gulp.watch([ '**/*.coffee' ], [ 'test' ]);
});

// gulp.task('bundle', function(done) {
//   gulp.src('./src/**/*.coffee')
//     .pipe(coffee({bare: true}))
//     .pipe(concat('react-css.js'))
//     .pipe(gulp.dest('lib'));
//   done();
// });

gulp.task('default', function() { });
