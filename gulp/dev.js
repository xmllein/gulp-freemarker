import gulp from 'gulp'

gulp.task('dev',
  gulp.series(
    'clean:dev',
    gulp.parallel('ftl:dev', 'scss:dev', 'js:dev'),
    'img:dev',
    'server'
  ))