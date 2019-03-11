import gulp from 'gulp';
import minifyHtml from 'gulp-minify-html';
import changed from 'gulp-changed';
import cachebust from 'gulp-cache-hyper-bust';
import cdnify from 'gulp-cdnify';
import gulpRemoveHtml from 'gulp-remove-html';
import freemarker from 'gulp-freemarker';
import path from 'path';
import config from '../config';

let viewPath = path.join(process.cwd(), './src', 'templates');

function ftl() {
  return gulp
    .src('./pagedata/**/*.json')
    // .pipe(changed('./dev/template'))
    .pipe(freemarker({
      viewRoot: viewPath,
      options: {}
    }))
    .pipe(gulp.dest('./dev/templates'))
}

gulp.task('ftl', ftl);

gulp.task('ftl:dev', () => {

  gulp.watch(['./src/templates/**/*.ftl', './pagedata/**/*.json'], (event) => {
    return ftl(event.path)
      .pipe(global.browserSync.reload({
        stream: true
      }))
  });

  return ftl();
});

gulp.task('ftl:prod', () => {
  return gulp
    .src(['./src/templates/**/*.ftl'])
    .pipe(cachebust({
      images: true,
      showLog: true,
      type: 'timestamp'
    }))
    .pipe(gulpRemoveHtml())
    .pipe(minifyHtml(config.tasks.html.htmlmin))
    .pipe(cdnify({
      base: config.tasks.html.cdnUrl
    }))
    .pipe(gulp.dest('./dist/templates'))
})

gulp.task('html:prod', gulp.series('ftl:prod'));