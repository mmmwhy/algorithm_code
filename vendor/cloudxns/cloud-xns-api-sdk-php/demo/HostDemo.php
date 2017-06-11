<?php

/**
 * 主机记录的接口逻辑处理的Demo
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
 * 主机列表的获取
 * 
 * @param integer $domainId  域名ID
 * @param integer $offset 记录开始的偏移,第一条记录为 0
 * @param integer $rowNum 要获取的记录的数量,最大可取 2000条
 * @return string
 */
echo $api->host->hostList(57219, 0, 30);

/**
 * 主机记录的删除
 * 
 * @param integer $hostId 主机记录 id
 * @return string
 */
echo $api->host->hostDelete(601879);
