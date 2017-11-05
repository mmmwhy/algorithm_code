<?php
/* *
 * 功能：码支付客服端同步通知页面(该页面不处理任何业务)
 * 版本：1.0
 * 日期：2016-12-23
 * 说明：
 * 以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 * 该代码仅供学习和研究码支付接口使用，只是提供一个参考。


 *************************页面功能说明*************************
 * 支付成功后客户默认会跳转到该页面 该页面可做业务 也可不做处理 此页面我们不做任何业务处理。
 * 处理业务您需要考虑如下问题：
 * 1：必须要区分是否已经执行成功。不要与异步重复处理
 * 2：需要考虑并发导致数据脏读的可能。
   (如无法解决以上问题不建议您在此页面做业务处理)

 * 什么时候会跳转？
 * 答：只要检测到付款成功就会跳转,同步跟异步是并发进行。
 *
 * 此页面不处理业务有什么影响？
 * 答：充值 购买之类的没影响。 对于付款后必须要立即展示用户的一些卡券之类的有影响。

 */

//在JS中 3秒后跳转到用户金额测试页面看是否到账。 最好方式是先使用我们软件端手动补单来核对业务处理逻辑有没问题
$gotoUser=(defined('DEBUG') && !DEBUG) ||(!defined('DB_PREFIX') || !defined('DB_USERTABLE'))?"":"window.location = 'user.php?t=' + Date.parse(new Date());";
?><!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="Content-Language" content="zh-cn">
    <meta name="apple-mobile-web-app-capable" content="no"/>
    <meta name="apple-touch-fullscreen" content="yes"/>
    <meta name="format-detection" content="telephone=no,email=no"/>
    <meta name="apple-mobile-web-app-status-bar-style" content="white">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>支付详情</title>
    <link href="css/wechat_pay.css" rel="stylesheet" media="screen">
    <link rel="stylesheet" type="text/css" media="screen" href="css/font-awesome.min.css">
    <style>
        .text-success {
            color: #468847;
            font-size: 2.33333333em;
        }

        .text-center {
            text-align: center;
        }
    </style>
</head>

<body>
<div class="body">
    <h1 class="mod-title">
        <span class="ico_log ico-<?php echo (int)$_GET['type']?>"></span>
    </h1>

    <div class="mod-ct">
        <div class="order">
        </div>
        <div class="amount" id="money">￥<?php echo (float)$_GET["money"] ?></div>
        <h1 class="text-center text-success"><strong><i class="fa fa-check fa-lg"></i> 支付成功</strong></h1>

        <div class="detail detail-open" id="orderDetail" style="display: block;">
            <dl class="detail-ct" id="desc">
                <dt>金额</dt>
                <dd><?php echo (float)$_GET["money"] ?></dd>
                <dt>商户订单：</dt>
                <dd><?php echo htmlentities($_GET["pay_id"]) ?></dd>
                <dt>流水号：</dt>
                <dd><?php echo htmlentities($_GET["pay_no"]) ?></dd>
                <dt>付款时间：</dt>
                <dd><?php echo date("Y-m-d H:i:s", (int)$_GET["pay_time"]) ?></dd>
                <dt>状态</dt>
                <dd>支付成功</dd>
            </dl>


        </div>

        <div class="tip-text">
        </div>


    </div>
    <div class="foot">
        <div class="inner">
            <p>如未到账请联系我们</p>
        </div>
    </div>

</div>
<div class="copyRight">
    <p>支付合作：<a href="http://codepay.fateqq.com/" target="_blank">码支付</a></p>
</div>
<script>
    alert('支付成功 如未到账请联系我们')
    setTimeout(function () {
        //这里可以写一些后续的业务
        <?php echo $gotoUser;?>
    }, 3000)
</script>
</body>
</html>



