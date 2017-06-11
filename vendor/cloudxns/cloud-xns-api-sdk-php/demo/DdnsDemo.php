<?php
/**
 * 解析记录的接口逻辑处理的Demo
 *
 * @author CloudXNS <support@cloudxns.net>
 * @link https://www.cloudxns.net/
 * @copyright Copyright (c) 2015 Cloudxns.
 */
require_once '../vendor/autoload.php';
$api = new \CloudXNS\Api();
$api->setApiKey('xxxxxxxxxx');
$api->setSecretKey('xxxxxxxxxx');
$api->setProtocol(true);
/**
 * DDNS快速修改解析记录
 * @param string $domain 包含主机记录的域名
 * @param string $ip IP值 多个以|分割如1.1.1.1|2.2.2.2 可为空
 * @param integer $line_id 线路id 默认为1，可为空
 */
echo $api->ddns->ddns('aaa.test.net.cn.','',1);