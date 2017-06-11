<?php

/**
 * NS服务器列表的接口逻辑处理的Demo
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
 * NS服务器列表
 * 
 * @return string
 */
echo $api->ns->nsList();
