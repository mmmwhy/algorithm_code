<?php
$money = number_format((float)$_GET['money'], 2, '.', ''); //金额统一保留2位小时
$tag = (int)$_GET['tag'];
$type = (int)$_GET['type'];
if ($type <= 0) $type = 1;
if ($money <= 0) {//这是什么状况 金额都没有。展示no.png
    header('Location: img/no.png');
    exit(0);
}
function moneyToFileName($money, $type = 1, $tag = 0, $act = 0)
{
    if ($act == 1) { //act参数为1则使用的是将金额分成多个文件夹形式
        $money_arr = explode(".", $money); //将金额小数点后面部分分开
        $name1 = $money_arr[0];
        $name2 = count($money_arr) <= 1 ? '00' : $money_arr[1];
        $fileName = $type == 1 ? "qr/{$type}/{$name1}/{$name2}_{$tag}.png" : "qr/{$type}/{$name1}/{$name2}.png";
    } else { //默认方式 qr/3/100.00.png  支付宝则为qr/1/100.00_0.png
        $fileName = $type == 1 ? "qr/{$type}/{$money}_{$tag}.png" : "qr/{$type}/{$money}.png";
    }
    return $fileName;
}
$qrcode_filename = moneyToFileName($money, $type, $tag, 0); //根据参数生成默认金额二维码地址
if (!file_exists($qrcode_filename)) { //该金额二维码不存在 亲。
    $index_fileName = "qr/{$type}/index.png";
    $qrcode_filename = file_exists($index_fileName) ? $index_fileName : 'img/no.png';
}
header('Location: ' . $qrcode_filename); //跳转到二维码真实地址