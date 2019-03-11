import gulp from 'gulp';
import path from 'path';
import tinypngFree from 'gulp-tinypng-unlimited';
import md5 from 'gulp-md5-plus';


function img() {
  return gulp
    .src('./src/static/images/**/*.{png,gif,jpg,jpeg}')
    .pipe(gulp.dest('./dev/static/images'))
}

gulp.task('img', img);

gulp.task('img:dev', () => {

  gulp.watch('./src/static/images/*.{png,gif,jpg,jpeg}',  (event) => {
    return img(event.path)
      .pipe(global.browserSync.reload({
        stream: true
      }))
  });

  return img();
})

const projectRoot = path.resolve(__dirname, '../../');

gulp.task('img:dev2dist', () => {
  return gulp
    .src('./dev/static/images/**/*.{png,gif,jpg,jpeg}')
    .pipe(md5(6, ['./dist/**/*.html', './dist/css/**/*.css', './dist/js/**/*.js']))
    .pipe(tinypngFree({
      cache: true,
      cachePath: path.join(projectRoot, './cacheImage'), // 缓存存放的目录
      outputErrorLog: true, // 打印错误日志
      outputErrorFiles: false, // 仍然将错误文件输出
    }))
    .pipe(gulp.dest('./dist/static/images'))

})

gulp.task('img:prod', gulp.series('img', 'img:dev2dist'));