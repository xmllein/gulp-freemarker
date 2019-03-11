<#macro tpl type>
    <div class="tip">
        这是一段测试模板, <#if type==1>type为1</#if><#if type==2>type为2</#if><#if type==3>type为3</#if>
    </div>
</#macro>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="format-detection" content="telephone=no">
    <meta name="format-detection" content="address=no">
    <title>Rapid-Dev-Activity-Page</title>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0,viewport-fit=cover">
    <link rel="stylesheet" type="text/css" href="/css/index.css">
</head>
<#escape x as x?html>
<body>
    <div class="app" id="app">
    ${id}
    </div>

    <script src="/js/zepto.js"></script>
    <script src="/js/index.js"></script>
<!--<Deject>-->
<script src="js/config.js"></script>
<script src="/js/vconsole.min.js"></script>
<script>
  window.vConsole = new window.VConsole();

    console.info('欢迎使用 vConsole。vConsole 是一个由微信公众平台前端团队研发的 Web 前端开发者面板，可用于展示 console 日志，方便开发、调试。');
</script>
<!--</Deject>-->
</body>
</#escape>
</html>
