var gulp = require('gulp');
var mocha = require('gulp-mocha');
var coffee = require('gulp-coffee');
var concat = require('gulp-concat');
var uglify = require('gulp-uglify');
require('coffee-script/register');



gulp.task('test', function(){
  return gulp.src('./test/**/*.coffee')
             .pipe(mocha());
});

gulp.task('watch', function(done) {
  gulp.watch([ '**/*.coffee' ], [ 'bundle', 'test' ]);
});

gulp.task('bundle', function(done) {
  gulp.src('./src/**/*.coffee')
    .pipe(coffee({bare: true}))
    .pipe(concat('react-css.js'))
    .pipe(uglify())
    .pipe(gulp.dest('lib'));
  done();
});

gulp.task('default', function() { });
