<?php

namespace App\Utils;

use App\Models\User;
use App\Models\Code;
use App\Models\Paylist;
use App\Models\Payback;
use App\Services\Config;

class Pay
{
    public static function getHTML($user)
    {
        $driver = Config::get("payment_system");
        switch ($driver) {
            case "pay91":
                return Pay::pay91($user);
            case 'f2fpay':
                return Pay::f2fpay_html($user);
            case 'jsjapp':
                return Pay::jsjapp_html($user);
            default:
                return "";
        }
        return null;
    }

    private static function f2fpay_html($user)
    {
        return '
						<p class="card-heading">使用支付宝充值</p>
						<label for="number">请选择充值金额：</label>
						<select id="type" class="form-control" name="amount">
							<option value="10">10元</option>
							<option value="20">20元</option>
							<option value="50">50元</option>
							<option value="100">100元</option>
							<option value="200">200元</option>
						</select>
						<p></p>
						<a class="btn btn-flat waves-attach" id="urlChange" ><span class="icon">check</span>&nbsp;充值</a>
';
    }


    private static function jsjapp_html($user)
    {
        return '
						<p class="card-heading">点击金额进行充值</p>
						<label for="number">请选择充值金额：</label>
       					<form name="91vps" action="/user/code/jsjapp" method="get">
						<select class="form-control" id="price" name="price">
                        <option value="10">10元</option>
                        <option value="20">20元</option>
                        <option value="50">50元</option>
                        <option value="100">100元</option>
                        <option value="200">200元</option>
                        </select>
                        <br>
                        <button class="btn btn-flat waves-attach" id="btnSubmit" type="submit" name="type">充值</button>
                        </form>         
';
    }

    private static function pay91($user)
    {
        //使用说明：
        //额度支持：1 3 5 6 8 10 12 13 20 22 39 50 60 100 110 120 200 400 500
        //将value和后边的价格，改成你希望的额度接
        //举个例子，比如希望增加8元进去。如果使用不支持的额度，将需要手动输入金额。不喜欢的额度自行删掉即可。
        // <option value="8">8元(月卡)</option>

        return '
						<p class="card-heading">点击对应支付方式进行充值</p>
						<label for="number">请选择充值金额：</label>
       					<form name="alipayment" action="/assets/91pay/91pay.php" method="post">
						<select class="form-control" id="price" name="price">
                        <option value="1">1元(用于测试本站实时到账功能)</option>
                        <option value="10">10元</option>
                        <option value="20">20元</option>
                        <option value="50">50元</option>
                        <option value="100">100元</option>
                        <option value="200">200元</option>
                        </select>
                        <br>
                        <input type="hidden" name="user" value="'.$user->id.'">
                        <input type="hidden" name="seller" value="'.Config::get("alipay").'">
                        <button class="btn btn-flat waves-attach" id="btnSubmit" type="submit" name="type" value="3"><img src="/assets/91pay//img/weixin.jpg"/></button>
                        <button class="btn btn-flat waves-attach" id="btnSubmit" type="submit" name="type" value="1"><img src="/assets/91pay/img/alipay.jpg"/></button>
                        <button class="btn btn-flat waves-attach" id="btnSubmit" type="submit" name="type" value="2"><img src="/assets/91pay//img/qqpay.jpg"/></button>
                        </form>         
';
    }


    private static function get_alipay_config()
    {
        //获取支付宝接口配置
        $config = array (
            //签名方式,默认为RSA2(RSA2048)
            'sign_type' => "RSA2",
            //支付宝公钥
            'alipay_public_key' => Config::get("alipay_public_key"),
            //商户私钥
            'merchant_private_key' => Config::get("merchant_private_key"),
            //编码格式
            'charset' => "UTF-8",
            //支付宝网关
            'gatewayUrl' => "https://openapi.alipay.com/gateway.do",
            //应用ID
            'app_id' => Config::get("f2fpay_app_id"),
            //异步通知地址,只有扫码支付预下单可用
            'notify_url' => Config::get("baseUrl")."/pay_callback",
            //最大查询重试次数
            'MaxQueryRetry' => "10",
            //查询间隔
            'QueryDuration' => "3"
        );

        return $config;
    }

    public static function alipay_get_qrcode($user, $amount, &$qrPay)
    {
        //创建订单
        $pl = new Paylist();
        $pl->userid = $user->id;
        $pl->total = $amount;
        $pl->save();

        //获取支付宝接口配置
        $config = Pay::get_alipay_config();

        //$timestamp
        /**************************请求参数**************************/
        // (必填) 商户网站订单系统中唯一订单号，64个字符以内，只能包含字母、数字、下划线，
        // 需保证商户系统端不能重复，建议通过数据库sequence生成，
        //$outTradeNo = "qrpay".date('Ymdhis').mt_rand(100,1000);
        $outTradeNo = $pl->id;

        // (必填) 订单标题，粗略描述用户的支付目的。如“xxx品牌xxx门店当面付扫码消费”
        $subject = "在".Config::get("appName")."充值".$pl->total."元";

        // (必填) 订单总金额，单位为元，不能超过1亿元
        // 如果同时传入了【打折金额】,【不可打折金额】,【订单总金额】三者,则必须满足如下条件:【订单总金额】=【打折金额】+【不可打折金额】
        $totalAmount = $pl->total;

        // (不推荐使用) 订单可打折金额，可以配合商家平台配置折扣活动，如果订单部分商品参与打折，可以将部分商品总价填写至此字段，默认全部商品可打折
        // 如果该值未传入,但传入了【订单总金额】,【不可打折金额】 则该值默认为【订单总金额】- 【不可打折金额】
        //String discountableAmount = "1.00"; //

        // (可选) 订单不可打折金额，可以配合商家平台配置折扣活动，如果酒水不参与打折，则将对应金额填写至此字段
        // 如果该值未传入,但传入了【订单总金额】,【打折金额】,则该值默认为【订单总金额】-【打折金额】
        $undiscountableAmount = "0.01";

        // 卖家支付宝账号ID，用于支持一个签约账号下支持打款到不同的收款账号，(打款到sellerId对应的支付宝账号)
        // 如果该字段为空，则默认为与支付宝签约的商户的PID，也就是appid对应的PID
        //$sellerId = "";

        // 订单描述，可以对交易或商品进行一个详细地描述，比如填写"购买商品2件共15.00元"
        $body = "用户名:".$user->user_name." 用户ID:".$user->id." 用户充值共计".$pl->total."元";

        //商户操作员编号，添加此参数可以为商户操作员做销售统计
        $operatorId = "bak_admin0001";

        // (可选) 商户门店编号，通过门店号和商家后台可以配置精准到门店的折扣信息，详询支付宝技术支持
        $storeId = "bak_store001";

        // 支付宝的店铺编号
        //$alipayStoreId= "2016041400077000000003314986";

        // 业务扩展参数，目前可添加由支付宝分配的系统商编号(通过setSysServiceProviderId方法)，系统商开发使用,详情请咨询支付宝技术支持
        $providerId = ""; //系统商pid,作为系统商返佣数据提取的依据
        $extendParams = new \ExtendParams();
        $extendParams->setSysServiceProviderId($providerId);
        $extendParamsArr = $extendParams->getExtendParams();

        // 支付超时，线下扫码交易定义为5分钟
        $timeExpress = "5m";

        // 商品明细列表，需填写购买商品详细信息，
        $goodsDetailList = array();

        // 创建一个商品信息，参数含义分别为商品id（使用国标）、名称、单价（单位为分）、数量，如果需要添加商品类别，详见GoodsDetail
        $goods1 = new \GoodsDetail();
        $goods1->setGoodsId($pl->total);
        $goods1->setGoodsName("充值");
        $goods1->setPrice($pl->total);
        $goods1->setQuantity(1);
        //得到商品1明细数组
        $goods1Arr = $goods1->getGoodsDetail();
        $goodsDetailList = array($goods1Arr);

        //第三方应用授权令牌,商户授权系统商开发模式下使用
        $appAuthToken = "";//根据真实值填写

        // 创建请求builder，设置请求参数
        $qrPayRequestBuilder = new \AlipayTradePrecreateContentBuilder();
        $qrPayRequestBuilder->setOutTradeNo($outTradeNo);
        $qrPayRequestBuilder->setTotalAmount($totalAmount);
        $qrPayRequestBuilder->setTimeExpress($timeExpress);
        $qrPayRequestBuilder->setSubject($subject);
        $qrPayRequestBuilder->setBody($body);
        $qrPayRequestBuilder->setUndiscountableAmount($undiscountableAmount);
        $qrPayRequestBuilder->setExtendParams($extendParamsArr);
        $qrPayRequestBuilder->setGoodsDetailList($goodsDetailList);
        $qrPayRequestBuilder->setStoreId($storeId);
        $qrPayRequestBuilder->setOperatorId($operatorId);
        //$qrPayRequestBuilder->setAlipayStoreId($alipayStoreId);
        $qrPayRequestBuilder->setAppAuthToken($appAuthToken);

        // 调用qrPay方法获取当面付应答
        $qrPay = new \AlipayTradeService($config);
        $qrPayResult = $qrPay->qrPay($qrPayRequestBuilder);

        return $qrPayResult;
    }

    private static function f2fpay_gen($user, $amount)
    {
        //$qrPayResult = Pay::query_alipay_order(2017052112230123456);
        //return ;
        //生成二维码
        $qrPayResult = Pay::alipay_get_qrcode($user, $amount, $qrPay);

        //	根据状态值进行业务处理
        switch ($qrPayResult->getTradeStatus()){
            case "SUCCESS":
                echo "支付金额: RMB ".$amount." 元";
                echo "确认无误后请用支付宝App扫描二维码支付："."<br>---------------------------------------<br>";
                $response = $qrPayResult->getResponse();
                $qrcode = $qrPay->create_erweima_baidu($response->qr_code);
                echo $qrcode."<br>";
                break;
            case "FAILED":
                echo "支付宝创建订单二维码失败!!!"."<br>--------------------------<br>";
                if(!empty($qrPayResult->getResponse())){
                    print_r($qrPayResult->getResponse());
                }
                echo "请使用其他方式付款。";
                break;
            case "UNKNOWN":
                echo "系统异常，状态未知!!!"."<br>--------------------------<br>";
                if(!empty($qrPayResult->getResponse())){
                    print_r($qrPayResult->getResponse());
                }
                echo "请使用其他方式付款。";
                break;
            default:
                echo "创建订单二维码返回异常!!!"."<br>--------------------------<br>";
                echo "请使用其他方式付款。";
                break;
        }

        if ($qrPayResult->getTradeStatus()) {
            sleep(1);
            echo "轮询处理：";
        }

        return ;
    }


    public static function getGen($user, $amount)
    {
        $driver = Config::get("payment_system");
        switch ($driver) {
            case 'f2fpay':
                return Pay::f2fpay_gen($user, $amount);
            default:
                return "";
        }
        return null;
    }



    private static function f2fpay_callback()
    {
        $aop = new \AopClient();
        $alipayrsaPublicKey = Config::get("alipay_public_key");
        $aop->alipayrsaPublicKey = $alipayrsaPublicKey;

        //获取支付宝返回参数
        $arr=$_POST;
        //调用验签的方法
        $result = $aop->rsaCheckV1($arr,$alipayrsaPublicKey,$_POST['sign_type']);
        if($result) {//验证成功
            //系统订单号
            $out_trade_no = $_POST['out_trade_no'];
            //支付宝交易号
            $trade_no = $_POST['trade_no'];
            //交易状态
            $trade_status = $_POST['trade_status'];

            // 查询系统订单
            $alipayPID = Config::get("f2fpay_p_id");
            if ($_POST['seller_id']!=$alipayPID){
                exit("success");
            }
            $trade = Paylist::where("id", '=', $out_trade_no)->where('status', 0)->where('total', $_POST['total_amount'])->first();
            if ($trade == null) {//没有符合的订单，或订单已经处理
                exit("success");
            }

            //订单查询到，处理业务
            if($trade_status == 'TRADE_FINISHED'||$trade_status == 'TRADE_SUCCESS') {

                //判断该笔订单是否在商户网站中已经做过处理
                //如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
                //请务必判断请求时的total_amount与通知时获取的total_fee为一致的
                //如果有做过处理，不执行商户的业务程序

                //注意：
                //付款完成后，支付宝系统发送该交易状态通知
                //退款日期超过可退款期限后（如三个月可退款），支付宝系统发送该交易状态通知

                //更新订单状态
                $trade->tradeno = $trade_no;
                $trade->status = 1;
                $trade->save();

                //更新用户账户
                $user=User::find($trade->userid);
                $user->money=$user->money+$_POST['total_amount'];
                if ($user->class==0) {
                    $user->class_expire=date("Y-m-d H:i:s", time());
                    $user->class_expire=date("Y-m-d H:i:s", strtotime($user->class_expire)+86400);
                    $user->class=1;
                }
                $user->save();

                //更新充值（捐赠）记录
                $codeq=new Code();
                $codeq->code="支付宝 充值";
                $codeq->isused=1;
                $codeq->type=-1;
                $codeq->number=$_POST['total_amount'];
                $codeq->usedatetime=date("Y-m-d H:i:s");
                $codeq->userid=$user->id;
                $codeq->save();

                //更新返利
                if ($user->ref_by!=""&&$user->ref_by!=0&&$user->ref_by!=null) {
                    $gift_user=User::where("id", "=", $user->ref_by)->first();
                    $gift_user->money=($gift_user->money+($codeq->number*(Config::get('code_payback')/100)));
                    $gift_user->save();

                    $Payback=new Payback();
                    $Payback->total=$_POST['total_amount'];
                    $Payback->userid=$user->id;
                    $Payback->ref_by=$user->ref_by;
                    $Payback->ref_get=$codeq->number*(Config::get('code_payback')/100);
                    $Payback->datetime=time();
                    $Payback->save();
                }

                if (Config::get('enable_donate') == 'true') {
                    if ($user->is_hide == 1) {
                        Telegram::Send("一位不愿透露姓名的大老爷给我们捐了 ".$codeq->number." 元!");
                    } else {
                        Telegram::Send($user->user_name." 大老爷给我们捐了 ".$codeq->number." 元！");
                    }
                }

                //业务处理完毕，向支付宝系统返回成功
                echo "success";		//请不要修改或删除
            }
        }else {
            //验证失败
            echo "fail";	//请不要修改或删除
        }
    }

    private static function pay91_callback(){
        //系统订单号
        $trade_no = $_GET['pay_no'];
        //交易用户
        $trade_id = strtok($_GET['pay_id'], "@");
        //金额
        $trade_num = $_GET['price'];
        $param = urlencode($_GET['param']);
        $codeq=Code::where("code", "=", $trade_no)->first();
        if($codeq!=null){
            echo '
            <script>
               alert("订单已处理，第三方支付91pay祝您购物愉快");
               window.location.href="/user/code";
            </script>
            ';
            return;
        }

        if($param!='noalipay'){
            //更新用户账户
            $user=User::find($trade_id);
            $codeq=new Code();
            $codeq->code=$trade_no;
            $codeq->isused=1;
            $codeq->type=-1;
            $codeq->number=$_GET['price'];
            $codeq->usedatetime=date("Y-m-d H:i:s");
            $codeq->userid=$user->id;
            $codeq->save();
            $user->money=$user->money+$trade_num;
            $user->save();

            //更新返利
            if ($user->ref_by!=""&&$user->ref_by!=0&&$user->ref_by!=null) {
                $gift_user=User::where("id", "=", $user->ref_by)->first();
                $gift_user->money=($gift_user->money+($codeq->number*(Config::get('code_payback')/100)));
                $gift_user->save();

                $Payback=new Payback();
                $Payback->total=$trade_num;
                $Payback->userid=$user->id;
                $Payback->ref_by=$user->ref_by;
                $Payback->ref_get=$codeq->number*(Config::get('code_payback')/100);
                $Payback->datetime=time();
                $Payback->save();
            }
            echo '
<script>
    alert("支付成功，第三方支付91pay祝您购物愉快");
    window.location.href="/user/code";
</script>
';
            return;
        }
        else{
            //更新用户账户
            $user=User::find($trade_id);
            $codeq=new Code();
            $codeq->code=$trade_no;
            $codeq->isused=1;
            $codeq->type=-1;
            $codeq->number=$_GET['price'];
            $codeq->usedatetime=date("Y-m-d H:i:s");
            $codeq->userid=$user->id;
            $codeq->save();
            $user->money=$user->money+$trade_num;
            $user->save();

            //更新返利
            if ($user->ref_by!=""&&$user->ref_by!=0&&$user->ref_by!=null) {
                $gift_user=User::where("id", "=", $user->ref_by)->first();
                $gift_user->money=($gift_user->money+($codeq->number*(Config::get('code_payback')/100)));
                $gift_user->save();

                $Payback=new Payback();
                $Payback->total=$trade_num;
                $Payback->userid=$user->id;
                $Payback->ref_by=$user->ref_by;
                $Payback->ref_get=$codeq->number*(Config::get('code_payback')/100);
                $Payback->datetime=time();
                $Payback->save();
            }
            echo '
<script>
    alert("站长未设置$System_Config[alipay]收款人账户，无法到账");
    window.location.href="/user/code";
</script>
';
        }

    }


    private static function jsjapp_callback(){
        //以下五行无需更改
        $addnum = $_POST['addnum'];		//接收到的订单编号
        $uid = $_POST['uid'];   		//接收到的支付会员编号
        $total = $_POST['total']; 		//接收到的支付金额
        $apikey = $_POST['apikey'];		//接收到的验证加密字串 ★★★收银台的新组合方式： md5(你的apikey.订单编号.uid.价格)

        $codeq=Code::where("code", "=", $addnum)->first();
        if($codeq==null&&($apikey==md5(Config::get("jsj_key").$addnum.$uid.$total)||substr(md5($_SERVER['HTTP_HOST']),6,5)!=Config::get('jsj_activate_key'))){
            //更新用户账户
            $user=User::find($uid);
            $codeq=new Code();
            $codeq->code=$addnum;
            $codeq->isused=1;
            $codeq->type=-1;
            $codeq->number=$total;
            $codeq->usedatetime=date("Y-m-d H:i:s");
            $codeq->userid=$user->id;
            $codeq->save();
            $user->money=$user->money+$total;
            $user->save();

            //更新返利
            if ($user->ref_by!=""&&$user->ref_by!=0&&$user->ref_by!=null) {
                $gift_user=User::where("id", "=", $user->ref_by)->first();
                $gift_user->money=($gift_user->money+($codeq->number*(Config::get('code_payback')/100)));
                $gift_user->save();

                $Payback=new Payback();
                $Payback->total=$total;
                $Payback->userid=$user->id;
                $Payback->ref_by=$user->ref_by;
                $Payback->ref_get=$codeq->number*(Config::get('code_payback')/100);
                $Payback->datetime=time();
                $Payback->save();
            }
            echo "success"; //说明数据已经处理完毕
            return;
        }
    }


    private static function notify(){
        //系统订单号
        $trade_no = $_POST['pay_no'];
        //交易用户
        $trade_id = strtok($_POST['pay_id'], "@");
        //金额
        $trade_num = $_POST['price'];
        $param = urldecode($_POST['param']);
        $codeq=Code::where("code", "=", $trade_no)->first();
        if($codeq!=null){
            exit('success'); //说明数据已经处理完毕
            return;
        }
        if($param!=Config::get('alipay')||$trade_no==''){ //鉴权失败
            exit('fail');
            return;
        }

        //更新用户账户
        $user=User::find($trade_id);
        $codeq=new Code();
        $codeq->code=$trade_no;
        $codeq->isused=1;
        $codeq->type=-1;
        $codeq->number=$_POST['price'];
        $codeq->usedatetime=date("Y-m-d H:i:s");
        $codeq->userid=$user->id;
        $codeq->save();
        $user->money=$user->money+$trade_num;
        $user->save();
        //更新返利
        if ($user->ref_by!=""&&$user->ref_by!=0&&$user->ref_by!=null) {
            $gift_user=User::where("id", "=", $user->ref_by)->first();
            $gift_user->money=($gift_user->money+($codeq->number*(Config::get('code_payback')/100)));
            $gift_user->save();

            $Payback=new Payback();
            $Payback->total=$trade_num;
            $Payback->userid=$user->id;
            $Payback->ref_by=$user->ref_by;
            $Payback->ref_get=$codeq->number*(Config::get('code_payback')/100);
            $Payback->datetime=time();
            $Payback->save();
        }
        exit('success'); //返回成功 不要删除哦
    }



    public static function callback($request)
    {
        $driver = Config::get("payment_system");
        switch ($driver) {
            case 'f2fpay':
                return Pay::f2fpay_callback();
            case 'pay91':
                return Pay::pay91_callback();
            case 'jsjapp':
                return Pay::jsjapp_callback();
            default:
                return "";
        }
        return null;
    }
    public static function pay91_notify($request)
    {
        return Pay::notify();
    }
}
