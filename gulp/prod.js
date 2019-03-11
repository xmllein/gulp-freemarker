import gulp from 'gulp';

gulp.task('prod',
  gulp.series(
    'clean',
    'ftl:prod',
    gulp.parallel('scss:prod', 'js:prod', 'favicon:dist'),
    'img:prod'
  ))