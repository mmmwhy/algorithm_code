<?php

/**
 * 线路&区域&ISP列表的接口逻辑处理的Demo
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
 * 线路的列表
 * 
 * @return string
 */
echo $api->line->lineList();


/**
 * 区域列表
 * 
 * @return string
 */
echo $api->line->regionList();


/**
 * ISP的列表
 * 
 * @return string
 */
echo $api->line->ispList();
