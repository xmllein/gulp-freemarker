require(['jquery', 'module1', 'math', 'underscore', 'modernizr'], function ($, m1, math, _,mo) {
  m1.init();
  math.add(5, 8);
  console.log($);
  console.log(100000999999);

  console.log(mo);
  

  console.info(_.map([1, 2, 3], function (num) {
    return num * 3;
  }));

  $('#testBtn').click(function () {
    $.ajax({
      url: '/rest/hh/121',
      type: 'get',
      dataType: 'json',
      success: function (result) {
        console.log(result);
      }
    });
  })

  $('#testBtn1').click(function () {
    $.ajax({
      url: '/rest/other',
      type: 'get',
      data: {
        id: 232322
      },
      dataType: 'json',
      success: function (result) {
        console.log(result);
      }
    });
  })

  $('#testBtn2').click(function () {
    $.ajax({
      url: '/rest/login',
      type: 'post',
      data: {
        account: 'zjzhome1',
        password: '123456'
      },
      dataType: 'json',
      success: function (result) {
        console.log(result);
      }
    });
  })

  $('#testBtn3').click(function () {
    $.ajax({
      url: '/rest/com',
      type: 'get',
      dataType: 'json',
      success: function (result) {
        console.log(result);
      }
    });
  })

  $('#testBtn4').click(function () {
    $.ajax({
      url: '/api/v1/topics',
      type: 'get',
      success: function (result) {
        console.log(result);
      }
    });
  })


});