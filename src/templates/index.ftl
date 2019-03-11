<#macro tpl type>
  <div class="tip">
    这是一段测试模板, <#if type==1>type为1</#if>
    <#if type==2>type为2</#if>
    <#if type==3>type为3</#if>
  </div>
</#macro>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta charset="UTF-8">
  <meta name="format-detection" content="telephone=no">
  <meta name="format-detection" content="address=no">
  <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0,viewport-fit=cover">
  <title>Gulp Mock Server</title>

  <link rel="stylesheet" type="text/css" href="/static/css/index.css">


</head>
<#escape x as x?html>

  <body>
    <h1>gulp freemarker</h1>


    <div class="app" id="app">
      <h2>字符串输出:</h2>
      <p>${"Hello ${name} !"} / ${"Hello " + name + " !"}</p>
      <#assign cname=r"特殊字符完成输出(http:\www.baidu.com)">
        <p>${cname}</p>
        <h2>字符串截取 ：</h2>
        <p>通过下标直接获取下标对应的字母： ${name[2]}</p>
        <p>起点下标..结尾下标截取字符串：${name[0..5]}</p>
        <h2>算数运算：</h2>
        <#-- 支持"+"、"－"、"*"、"/"、"%"运算符 -->
          <#assign number1=10>
            <#assign number2=5>
              <p>"+" : ${number1 + number2}</p>
              <p>"－" : ${number1 - number2}</p>
              <p>"*" : ${number1 * number2}</p>
              <p>"/" : ${number1 / number2}</p>
              <p>"%" : ${number1 % number2}</p>

              <h2>比较运算符：</h2>
              <p>
                <#if number1 + number2 gte 12 || number1 - number2 lt 6>
                  "*" : ${number1 * number2}
                  <#else>
                    "/" : ${number1 / number2}
                </#if>
              </p>
              <h2>内建函数：</h2>
              <#assign data="abcd1234">
                <p>第一个字母大写：${data?cap_first}</p>
                <p>所有字母小写：${data?lower_case}</p>
                <p>所有字母大写：${data?upper_case}</p>
                <#assign floatData=12.34>
                  <p>数值取整数：${floatData?int}</p>
                  <p>获取集合的长度：${users?size}</p>
                  <p>时间格式化：${(.now?string("yyyy-MM-dd hh:mm:ss"))!}</p>
                  <h2>空判断和对象集合</h2>

                  <#if users??>

                    <ul>
                      <#list users as user>
                        <li>
                          ${user.id} - ${user.name} </li>

                      </#list>
                    </ul>

                    <#else>
                      ${user!"变量为空则给一个默认值"}


                  </#if>

                  <h2>Map集合：</h2>

                  <ul class="list">
                    <li>姓名: ${user.name}</li>
                    <li>性别: ${user.gender}</li>
                    <li>年龄: ${user.age}</li>
                    <li>地址: ${user.address}</li>
                  </ul>

                  <h2>通过Key遍历Map：</h2>

                  <ul>

                    <#list user?keys as key>

                      <li> Key: ${key} - Value: ${user[key]}</li>
                    </#list>
                  </ul>
                  <h2>通过Value遍历Map：：</h2>

                  <ul>

                    <#list user?values as value>
                      <li> Value: ${value}</li>
                    </#list>

                  </ul>

                  <h2>List集合</h2>
                  <#assign listData=["ITDragon", "blog" , "is" , "cool" ]>
                    <ul>
                      <#list listData as value>
                        <li>${value} </li>
                      </#list>
                    </ul>
                    <h2>macro宏指令：</h2>
                    <@tpl type=user.type />
                    <h2>include指令：</h2>
                    <#include "common/macro.ftl">

                      <h2>命名空间：</h2>
                      <ul>
                        <li><a href="https://segmentfault.com/a/1190000011768799#articleHeader2">FreeMarker 快速入门</a></li>
                      </ul>

                      <div>
                        <button type="button" class="btn">点我点我点我</button>
                      </div>
                      <div class="icons">
                        <span class="myiconfont myiconfont-add"></span>
                        <span class="myiconfont myiconfont-arrow"></span>
                        <span class="myiconfont myiconfont-comment"></span>
                        <span class="myiconfont myiconfont-refresh"></span>
                      </div>
    </div>
  </body>
</#escape>

</html>