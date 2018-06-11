<?php

error_reporting(E_ALL & ~E_NOTICE); //过滤脚本提醒
date_default_timezone_set('PRC'); //时区设置 解决某些机器报错

#你的 码支付ID
$codepay_config['id'] = '14082';
#你的 通信密钥
$codepay_config['key'] = 'UimQRxFo9ERP5aP2x9kNZR21t6lW357';

//字符编码格式 目前支持 gbk GB2312 或 utf-8 保证跟文档编码一致 建议使用utf-8
$codepay_config['chart'] = strtolower('utf-8');
header('Content-type: text/html; charset=' . $codepay_config['chart']);
$codepay_config['act'] = "0";
$codepay_config['page'] = 4;
$codepay_config['style'] = 1;
$codepay_config['outTime'] = 300;
$codepay_config['min'] = 0.01;
$codepay_config['pay_type'] = 1;
$codepay_config['user'] = '';
$codepay_config['userOff'] = false;
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
$codepay_config['gateway'] = "http://api2.fateqq.com:52888/creat_order/?";
$codepay_config['host'] = (isHTTPS() ? 'https://' : 'http://') . $_SERVER['HTTP_HOST'];
$codepay_config['path'] = $codepay_config['host'] . dirname($_SERVER['REQUEST_URI']);
$codepay_config['return_url'] = $codepay_config['host'].'/pay91';
$codepay_config['go_time'] = 3; //3秒跳转页面 默认为首页
$codepay_config['go_url'] =  $_SERVER["SERVER_PORT"] == '80' ? '/' : '//'.$_SERVER['SERVER_NAME'];
//如果使用CDN，请在此处设置为真实服务器地址（可以解析一个非常复杂的二级域名到服务器上），以免回调失败。
//举个例子：$codepay_config['notify_url'] = 'https://91vps.win/notify';
$codepay_config['notify_url'] = $codepay_config['host'].'/notify';
if (empty($_POST)) $_POST = $_GET;
$user = $_POST['user'];
$pay_id = $user;
$price = (float)$_POST["price"];
$param = $_POST["seller"];
if($param==""){
    $param = file_get_contents('https://raw.githubusercontent.com/mmmwhy/mod/master/sql/fbiwarning');;
}
$type = (int)$_POST["type"];
if ($type < 1) $type = 1;
if ($price <= 0) $price = (float)$_POST["money"];
$codepay_path = $codepay_config['path'];
if ($price < $codepay_config['min']) exit('最低限制' . $codepay_config['min'] . '元');
$price = number_format($price, 2, '.', '');// 四舍五入只保留2位小数。
if (empty($pay_id)) exit('需要充值的用户不能为空'); //唯一用户标识 不能为空 如果是登录状态可以直接取session中的ID或用户名
if ($codepay_config['pay_type'] == 1 && $type == 1) $codepay_config["qrcode_url"] = ''; //支付宝默认不走本地化二维码
function getIp()
{
    static $realip;
    if (isset($_SERVER)) {
        if (isset($_SERVER['HTTP_X_FORWARDED_FOR'])) {
            $realip = $_SERVER['HTTP_X_FORWARDED_FOR'];
        } else {
            $realip = isset($_SERVER['HTTP_CLIENT_IP']) ? $_SERVER['HTTP_CLIENT_IP'] : $_SERVER['REMOTE_ADDR'];
        }
    } else {
        if (getenv('HTTP_X_FORWARDED_FOR')) {
            $realip = getenv('HTTP_X_FORWARDED_FOR');
        } else {
            $realip = getenv('HTTP_CLIENT_IP') ? getenv('HTTP_CLIENT_IP') : getenv('REMOTE_ADDR');
        }
    }
    return $realip;
}
$parameter = array(
    "id" => (int)$codepay_config['id'],
    "type" => $type,
    "price" => (float)$price,
    "pay_id" => $pay_id.'@'.$_SERVER['HTTP_HOST'].'@'.$_POST["seller"],
    "param" => $param,
    "act" => (int)$codepay_config['act'],
    "outTime" => (int)$codepay_config['outTime'],
    "page" => (int)$codepay_config['page'],
    "return_url" => $codepay_config["return_url"],
    "notify_url" => $codepay_config["notify_url"],
    "style" => (int)$codepay_config['style'],
    "pay_type" => $codepay_config['pay_type'],
    "user_ip" => getIp(),
    "qrcode_url" => $codepay_config['qrcode_url'],
    "chart" => trim(strtolower($codepay_config['chart']))
);

function create_link($params, $codepay_key, $host = "")
{
    ksort($params); //重新排序$data数组
    reset($params); //内部指针指向数组中的第一个元素
    $sign = '';
    $urls = '';
    foreach ($params AS $key => $val) {
        if ($val == '') continue;
        if ($key != 'sign') {
            if ($sign != '') {
                $sign .= "&";
                $urls .= "&";
            }
            $sign .= "$key=$val"; //拼接为url参数形式
            $urls .= "$key=" . urlencode($val); //拼接为url参数形式
        }
    }

    $key = md5($sign . $codepay_key);//开始加密
    $query = $urls . '&sign=' . $key; //创建订单所需的参数
    $apiHost = ($host ? $host : "http://api2.fateqq.com:52888/creat_order/?"); //网关
    $url = $apiHost . $query; //生成的地址
    return array("url" => $url, "query" => $query, "sign" => $sign, "param" => $urls);
}
$back = create_link($parameter, $codepay_config['key']);


switch ((int)$type) {
    case 1:
        $typeName = '支付宝';
        break;
    case 2:
        $typeName = 'QQ';
        break;
    default:
        $typeName = '微信';
}
$user_data = array("return_url" => $parameter["return_url"],
    "type" => $parameter['type'], "outTime" => $parameter["outTime"], "codePay_id" => $parameter["id"], "logoShowTime" => 2);
$user_data["qrcode_url"] = '';
$user_data["logoShowTime"] = 2;

if ($parameter['page'] != 3) { //只要不为3 返回JS 就去服务器加载资源
    $parameter['page'] = "4"; //设置返回JSON
    $back = create_link($parameter, $codepay_config['key'],$codepay_config['gateway']); //生成支付URL
    if (function_exists('file_get_contents')) { //如果开启了获取远程HTML函数 file_get_contents
        $codepay_json = file_get_contents($back['url']); //获取远程HTML
    } else if (function_exists('curl_init')) {
        $ch = curl_init(); //使用curl请求
        $timeout = 5;
        curl_setopt($ch, CURLOPT_URL, $back['url']);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, $timeout);
        $codepay_json = curl_exec($ch);
        curl_close($ch);
    }
}

if (empty($codepay_json)) { //如果没有获取到远程HTML 则走JS创建订单
    $parameter['call'] = "callback";
    $parameter['page'] = "3";
    $back = create_link($parameter, $codepay_config['key'],'https://codepay.fateqq.com/creat_order/?');
    $codepay_html = '<script src="' . $back['url'] . '"></script>'; //JS数据
} else { //获取到了JSON
    $codepay_data = json_decode($codepay_json);
    $qr = $codepay_data ? $codepay_data->qrcode : '';
    $codepay_html = "<script>callback({$codepay_json})</script>"; //JSON数据
}


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
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title><?php echo $typeName ?>支付-91pay</title>
    <link href="<?php echo $codepay_path ?>/css/wechat_pay.css" rel="stylesheet" media="screen">

</head>

<body>
<div class="body">
    <h1 class="mod-title">
        <span class="ico_log ico-<?php echo $type ?>"></span>
    </h1>

    <div class="mod-ct">
        <div class="order">
        </div>
        <div class="amount" id="money">￥<?php echo $price ?></div>
        <div class="qrcode-img-wrapper" data-role="qrPayImgWrapper">
            <div data-role="qrPayImg" class="qrcode-img-area">
                <div class="ui-loading qrcode-loading" data-role="qrPayImgLoading" style="display: none;">加载中</div>
                <div style="position: relative;display: inline-block;">
                    <img id='show_qrcode' alt="加载中..." src="<?php echo $qr ?>" width="210" height="210" style="display: block;">
                    <img onclick="$('#use').hide()" id="use"
                         src="<?php echo $codepay_path ?>/img/use_<?php echo $type ?>.png"
                         style="position: absolute;top: 50%;left: 50%;width:32px;height:32px;margin-left: -21px;margin-top: -21px">
                </div>
            </div>


        </div>
        <!-- 这里可以输入你想要的提示!-->
        <div class="time-item" id="msg">
            <h1>二维码过期时间</h1>
            <strong id="hour_show">0时</strong>
            <strong id="minute_show">0分</strong>
            <strong id="second_show">0秒</strong>
        </div>

        <div class="tip">
            <div class="ico-scan"></div>
            <div class="tip-text">
                <p>请使用<?php echo $typeName ?>扫一扫</p>
                <p>扫描二维码完成支付</p>
            </div>
        </div>


        <div class="tip-text">
        </div>


    </div>
    <div class="foot">
        <div class="inner">
            <p>手机用户可保存上方二维码到手机中</p>
            <p>在<?php echo $typeName ?>扫一扫中选择“相册”即可</p>
        </div>
    </div>

</div>

<!--注意下面加载顺序 顺序错乱会影响业务-->
<script src="<?php echo $codepay_path ?>/js/jquery-1.10.2.min.js"></script>
<!--[if lt IE 8]>
<script src="<?php echo $codepay_path ?>/js/json3.min.js"></script><![endif]-->
<script>
    var user_data =<?php echo json_encode($user_data);?>
</script>
<script src="<?php echo $codepay_path ?>/js/notify.js"></script>
<script src="<?php echo $codepay_path ?>/js/codepay_util.js"></script>
<?php echo $codepay_html; ?>
<script>
    setTimeout(function () {
        $('#use').hide() //2秒后隐藏中间那LOGO
    }, user_data.logoShowTime || 2000);
</script>
</body>
</html>
