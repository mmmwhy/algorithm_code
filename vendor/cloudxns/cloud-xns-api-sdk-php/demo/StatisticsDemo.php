<?php

/**
 * 解析统计的接口逻辑处理的Demo
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
 * 解析统计列表
 * 
 * @param inetger $domainId 域名ID
 * @param string $host 主机名,查询全部传 all
 * @param string $code 统计区域 Id 或统 ISP Id,查询全部传 all
 * @param string $startDate 开始时间
 * @param string $endDate 结束时间
 * @return string
 */
echo $api->statistics->statisticsList(57210, 'all', 'all', '2015-10-1', '2015-10-19');
