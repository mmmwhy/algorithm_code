<?php
function md5Sign($prestr, $key) {
    $prestr = $prestr . $key;
    return md5($prestr);
}


function md5Verify($prestr, $sign, $key) {
    $prestr = $prestr . $key;

    $mysgin = md5($prestr);

    if($mysgin == $sign) {
        return true;
    }
    else {
        return false;
    }
}

function createLinkstring($para)
{
    $arg = "";
    while (list ($key, $val) = each($para)) {
        $arg .= $key . "=" . $val . "&";
    }
    $arg = substr($arg, 0, count($arg) - 2);
    if (get_magic_quotes_gpc()) {
        $arg = stripslashes($arg);
    }

    return $arg;
}

function createLinkstringUrlencode($para)
{
    $arg = "";
    while (list ($key, $val) = each($para)) {
        $arg .= $key . "=" . urlencode($val) . "&";
    }
    $arg = substr($arg, 0, count($arg) - 2);
    if (get_magic_quotes_gpc()) {
        $arg = stripslashes($arg);
    }

    return $arg;
}
function paraFilter($para)
{
    $para_filter = array();
    while (list ($key, $val) = each($para)) {
        if ($key == "sign" || $key == "creatTime" || $val == "") continue;
        else    $para_filter[$key] = $para[$key];
    }
    return $para_filter;
}
function argSort($para)
{
    ksort($para);
    reset($para);
    return $para;
}

function logResult($word = '')
{
    try {
        $fp = fopen(LOG_PATH, "a"); //建议写到其他非web路径 因为该路径一般情况是可以通过web访问
        flock($fp, LOCK_EX);
        fwrite($fp, "执行日期：" . strftime("%Y%m%d%H%M%S", time()) . "\n" . $word . "\n");
        flock($fp, LOCK_UN);
        fclose($fp);
    } catch (Exception $e) {
        if ($fp) fclose($fp);
    }
}

function getHttpResponsePOST($url, $cacert_url, $para, $input_charset = '')
{

    if (trim($input_charset) != '') {
        $url = $url . "_input_charset=" . $input_charset;
    }
    $curl = curl_init($url);
    curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, true);//SSL证书认证
    curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, 2);//严格认证
    curl_setopt($curl, CURLOPT_CAINFO, $cacert_url);//证书地址
    curl_setopt($curl, CURLOPT_HEADER, 0); // 过滤HTTP头
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);// 显示输出结果
    curl_setopt($curl, CURLOPT_POST, true); // post传输数据
    curl_setopt($curl, CURLOPT_POSTFIELDS, $para);// post传输数据
    $responseText = curl_exec($curl);
    curl_close($curl);

    return $responseText;
}

function getHttpResponseGET($url, $cacert_url = '')
{
    $curl = curl_init($url);
    curl_setopt($curl, CURLOPT_HEADER, 0); // 过滤HTTP头
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);// 显示输出结果
    curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);//SSL证书认证
    $responseText = curl_exec($curl);
    //var_dump( curl_error($curl) );//如果执行curl过程中出现异常，可打开此开关，以便查看异常内容
    curl_close($curl);

    return $responseText;
}

function charsetEncode($input, $_output_charset, $_input_charset)
{
    $output = "";
    if (!isset($_output_charset)) $_output_charset = $_input_charset;
    if ($_input_charset == $_output_charset || $input == null) {
        $output = $input;
    } elseif (function_exists("mb_convert_encoding")) {
        $output = mb_convert_encoding($input, $_output_charset, $_input_charset);
    } elseif (function_exists("iconv")) {
        $output = iconv($_input_charset, $_output_charset, $input);
    } else die("sorry, you have no libs support for charset change.");
    return $output;
}

function charsetDecode($input, $_input_charset, $_output_charset)
{
    $output = "";
    if (!isset($_input_charset)) $_input_charset = $_input_charset;
    if ($_input_charset == $_output_charset || $input == null) {
        $output = $input;
    } elseif (function_exists("mb_convert_encoding")) {
        $output = mb_convert_encoding($input, $_output_charset, $_input_charset);
    } elseif (function_exists("iconv")) {
        $output = iconv($_input_charset, $_output_charset, $input);
    } else die("sorry, you have no libs support for charset changes.");
    return $output;
}

function guid()
{
    if (function_exists('com_create_guid')) {
        return com_create_guid();
    } else {
        mt_srand((double)microtime() * 10000);//optional for php 4.2.0 and up.
        $charid = strtoupper(md5(uniqid(rand(), true)));
        $hyphen = chr(45);// "-"
        $uuid = chr(123)// "{"
            . substr($charid, 0, 8) . $hyphen
            . substr($charid, 8, 4) . $hyphen
            . substr($charid, 12, 4) . $hyphen
            . substr($charid, 16, 4) . $hyphen
            . substr($charid, 20, 12)
            . chr(125);// "}"
        return $uuid;
    }
}

function getTypeName($type)
{
    $typeName = '支付宝';
    switch ((int)$type) {
        case 1:
            break;
        case 2:
            $typeName = 'QQ';
            break;
        case 3:
            $typeName = '微信';
    }
    return $typeName;
}

//判断是否HTTPS
function is_HTTPS()
{
    if (defined('HTTPS') && HTTPS) return true;
    if (!isset($_SERVER)) return FALSE;
    if (!isset($_SERVER['HTTPS'])) return FALSE;
    if ($_SERVER['HTTPS'] === 1) {  //Apache
        return TRUE;
    } elseif ($_SERVER['HTTPS'] === 'on') { //IIS
        return TRUE;
    } elseif ($_SERVER['SERVER_PORT'] == 443) { //其他
        return TRUE;
    }
    return FALSE;
}

function getApiHost()
{
    $mainApi = 1;
    $codePay_api_url = "";
    $codePay_api_url .= is_HTTPS() ? "https://" : 'http://';
    $codePay_api_url .= $mainApi ? "codepay.fateqq.com:" : 'api.fateqq.com:'; //应急预案
    $codePay_api_url .= is_HTTPS() ? "51888" : '52888';
    $codePay_api_url .= '/';
    return $codePay_api_url;
}

class CodepaySubmit
{

    var $codepay_config;
    var $codepay_gateway_new;

    function __construct($codepay_config)
    {
        $this->codepay_config = $codepay_config;
        $this->codepay_gateway_new = getApiHost() . 'creat_order/?';
    }

    function CodepaySubmit($codepay_config)
    {
        $this->__construct($codepay_config);
    }

    function buildRequestMysign($para_sort)
    {
        $prestr = createLinkstring($para_sort);
        $mysign = md5Sign($prestr, $this->codepay_config['key']);
        return $mysign;
    }

    function buildRequestPara($para_temp)
    {
        $para_filter = paraFilter($para_temp);
        $para_sort = argSort($para_filter);
        $mysign = $this->buildRequestMysign($para_sort);
        $para_sort['sign'] = $mysign;
        return $para_sort;
    }
    function buildRequestParaToString($para_temp)
    {
        $para = $this->buildRequestPara($para_temp);
        $request_data = createLinkstringUrlencode($para);
        return $request_data;
    }

    function buildRequestForm($para_temp, $method, $button_name)
    {
        //待请求参数数组
        $para = $this->buildRequestPara($para_temp);
        $sHtml = "<form id='codepaysubmit' name='codepaysubmit' action='" . $this->codepay_gateway_new . "creatTime=" . time() . "' method='" . $method . "'>";
        while (list ($key, $val) = each($para)) {
            $sHtml .= "<input type='hidden' name='" . $key . "' value='" . $val . "'/>";
        }
        //submit按钮控件请不要含有name属性 否则签名不会通过
        $sHtml = $sHtml . "<input type='submit'  value='" . $button_name . "' style='display:none;'></form>";
        $sHtml = $sHtml . "<script>document.forms['codepaysubmit'].submit();</script>";
        return $sHtml;
    }
}


error_reporting(E_ALL & ~E_NOTICE); //过滤脚本提醒
header('Content-type: text/html; charset=' . $codepay_config['chart']);
date_default_timezone_set('PRC'); //时区设置 解决某些机器报错
$codepay_config['id'] = '10700';
$codepay_config['key'] = '#!?7v;$E6Xcb~JRti8?cW5Yu~^MIy^^';
$codepay_config['chart'] = strtolower('utf-8');
$codepay_config['act'] = '0'; //认证版则开启 一般情况都为0
$codepay_config['page'] = 4; //支付页面展示方式
$codepay_config['style'] = 1; //暂时保留的功能 后期会生效 留意官网发布的风格编号
$codepay_config['outTime'] = 300;//360秒=6分钟 最小值60  不建议太长 否则会影响其他人支付
$codepay_config['min'] = 0.01;
$codepay_config['pay_type'] = 0;
$codepay_config['user'] = ''; //这是默认的充值用户 因为我们演示的数据库充值 只有该用户名 如正式使用请为空
$codepay_config['userOff'] = false; //这里设置是否显示出来用户输入用户名 除非你知道了如何获取到用户 否则不要更改
define('HTTPS', false);
function isHTTPS()
{
    if (defined('HTTPS') && HTTPS) return true;
    if (!isset($_SERVER)) return FALSE;
    if (!isset($_SERVER['HTTPS'])) return FALSE;
    if ($_SERVER['HTTPS'] === 1) {  //Apache
        return TRUE;
    } elseif ($_SERVER['HTTPS'] === 'on') { //IIS
        return TRUE;
    } elseif ($_SERVER['SERVER_PORT'] == 443) { //其他
        return TRUE;
    }
    return FALSE;
}
$codepay_config['host'] = (isHTTPS() ? 'https://' : 'http://') . $_SERVER['HTTP_HOST'];
$codepay_config['path'] = $codepay_config['host'] . dirname($_SERVER['REQUEST_URI']); //API安装路径 最终为http://域名/codepay
$codepay_config['return_url'] = $codepay_config['host'].'/pay91'; //自动生成跳转地址
$codepay_config['qrcode_url'] = '/assets/91pay/qrcode.php';
//如果使用CDN，请在此处设置为真实服务器地址（可以解析一个非常复杂的二级域名到服务器上），以免回调失败。
//举个例子：$codepay_config['notify_url'] = 'https://91vps.win/notify';
$codepay_config['notify_url'] = $codepay_config['host'].'/notify';
if (empty($_POST)) $_POST = $_GET; //如果为GET方式访问
$user = $_POST['user'];//提交的用户名
$pay_id = $user; //网站唯一标识 需要充值的用户名，用户ID或者自行创建订单 建议传递用户的ID
$price = (float)$_POST["price"]; //提交的价格
$type = (int)$_POST["type"]; //支付方式
$param = $_POST["seller"]; //支付方式
if($param==""){
    $param = 'noalipay'; //支付方式
}
if ($type < 1) $type = 1;
if ($price <= 0) $price = (float)$_POST["money"]; //如果没提供自定义输入金额则使用money参数
if ($price < $codepay_config['min']) exit($codepay_config['key'].$codepay_config['id']); //检查最低限制
$price = number_format($price, 2, '.', '');// 四舍五入只保留2位小数。
if (empty($pay_id)) exit('需要充值的用户不能为空'); //唯一用户标识 不能为空 如果是登录状态可以直接取session中的ID或用户名
if ($codepay_config['pay_type'] == 1 && $type == 1) $codepay_config["qrcode_url"] = ''; //支付宝默认不走本地化二维码
$parameter = array(
    "id" => (int)$codepay_config['id'],//平台ID号
    "type" => $type,//支付方式
    "price" => (float)$price,//原价
    "pay_id" => $pay_id.'@'.$_SERVER['HTTP_HOST'].'@'.base64_decode($_POST["seller"]), //可以是用户ID,站内商户订单号,用户名
    "param" => $param,//自定义参数
    "act" => (int)$codepay_config['act'],//是否开启认证版的免挂机功能
    "outTime" => (int)$codepay_config['outTime'],//二维码超时设置
    "page" => (int)$codepay_config['page'],//付款页面展示方式
    "return_url" => $codepay_config["return_url"],//付款后附带加密参数跳转到该页面
    "notify_url" => $codepay_config["notify_url"],//付款后通知该页面处理业务
    "style" => (int)$codepay_config['style'],//付款页面风格
    "pay_type" => $codepay_config['pay_type'],//支付宝使用官方接口
    "qrcode_url" => $codepay_config['qrcode_url'],//本地化二维码
    "chart" => trim(strtolower($codepay_config['chart']))//字符编码方式
);
$codepaySubmit = new CodepaySubmit($codepay_config);
$codepay_json_url = getApiHost() . "creat_order/?";
$codepay_json_url .= $codepaySubmit->buildRequestParaToString($parameter);
if (empty($type)) $type = (int)$_GET["type"];
if (empty($type)) $type = 1;
$typeName = getTypeName($type);

if ((int)$codepay_config["outTime"] < 60) $codepay_config["outTime"] = 360;

$user_data = array("subject" => $subject, "return_url" => $codepay_config["return_url"],
    "type" => $type, "outTime" => $codepay_config["outTime"], "codePay_id" => $codepay_config["id"]);
$user_data["qrcode_url"] = !empty($codepay_config["qrcode_url"]) && (int)$codepay_config["act"] <= 0 ? $codepay_config["qrcode_url"] : '';
$user_data["logShowTime"]=1;
$codepay_json = file_get_contents($codepay_json_url);
?>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=<?php echo $codepay_config['chart'] ?>">
    <meta http-equiv="Content-Language" content="zh-cn">
    <meta name="apple-mobile-web-app-capable" content="no"/>
    <meta name="apple-touch-fullscreen" content="yes"/>
    <meta name="format-detection" content="telephone=no,email=no"/>
    <meta name="apple-mobile-web-app-status-bar-style" content="white">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>91pay为您服务</title>
    <link href="./css/wechat_pay.css" rel="stylesheet" media="screen">

</head>

<body>
<div class="body">
    <h1 class="mod-title">
        <span class="ico_log ico-<?php echo $type ?>"></span>
    </h1>

    <div class="mod-ct">
        <div class="order">
        </div>
        <div class="amount" id="money" style="color:#F00">￥<?php echo $price ?></div>
        <div class="qrcode-img-wrapper" data-role="qrPayImgWrapper">
            <div data-role="qrPayImg" class="qrcode-img-area">
                <div class="ui-loading qrcode-loading" data-role="qrPayImgLoading" style="display: none;">加载中</div>
                <div style="position: relative;display: inline-block;">
                    <img id='show_qrcode' alt="加载中..." src="" width="210" height="210" style="display: block;">
                    <img onclick="$('#use').hide()" id="use" src="./img/use_<?php echo $type ?>.png"
                         style="position: absolute;top: 50%;left: 50%;width:32px;height:32px;margin-left: -21px;margin-top: -21px">
                </div>
            </div>


        </div>
        <div class="time-item" id="msg">
            <h1>二维码过期时间</h1>
            <strong id="hour_show">0时</strong>
            <strong id="minute_show">0分</strong>
            <strong id="second_show">0秒</strong>
        </div>

        <div class="tip">
            <div class="ico-scan"></div>
            <div class="tip-text">
                <p>请使用<?php echo $typeName ?>扫描二维码完成支付</p>
                <p>第三方支付91pay祝您购物愉快</p>
            </div>
        </div>
    </div>

    <!--注意下面加载顺序 顺序错乱会影响业务-->
    <script src="./js/jquery-1.10.2.min.js"></script>
    <!--[if lt IE 8]>
    <script src="./js/json3.min.js"></script><![endif]-->
    <script>
        var user_data =<?php echo json_encode($user_data);?>
    </script>
    <script src="./js/notify.js"></script>
    <script src="./js/codepay_util.js"></script>
    <script>callback(<?php echo $codepay_json;?>)</script>
    <script>
        setTimeout(function () {
            $('#use').hide()
        },user_data.logShowTime||10000)
    </script>
</body>
</html>
