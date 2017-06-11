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
 * 解析记录列表
 * 
 * @param integer $domainId 域名ID
 * @param integer $hostId 主机记录 id(传 0 查全部)
 * @param integer $offset 记录开始的偏移,第一条记录为 0
 * @param integer $rowNum 要获取的记录的数量,最大可取 2000，默认取30条。
 * @return string
 */
//echo $api->record->recordList(57219, 0, 0, 30);

/**
 * 新增解析记录
 * 
 * @param integer $domainId 域名 id
 * @param string $host 主机记录名称 如 www, 默认@
 * @param string $value 记录值, 如IP:8.8.8.8,CNAME:cname.cloudxns.net., MX: mail.cloudxns.net.
 * @param string $type 记录类型,通过 API 获得记录类型,大写英文,比如:A
 * @param integer $mx 优先级,范围 1-100。当记录类型是 MX/AX/CNAMEX 时有效并且必选
 * @param integer $ttl TTL,范围 60-3600,不同等级域名最小值不同
 * @param integer $lineId 线路 id,(通过 API 获得记录线路 id)
 * @return string
 */
//echo $api->record->recordAdd(57219, 'w0', '3.3.3.3', 'A', 55, 600, 1);

/**
 * 新增备记录
 *  
 * @param integer $domainId 域名 id
 * @param integer $hostId 主机记录 id
 * @param integer $recordId 解析记录 id
 * @param string $value 备记录值
 * @return string
 */
//echo $api->record->spareAdd(57219, 601877, 854023, '192.168.100.222');

/**
 * 更新解析记录
 * 
 * @param integer $domainId 域名 id
 * @param string $host 主机记录名,传空值,则主机记录名作”@”处理.
 * @param string $value 记录值, 如IP:8.8.8.8,CNAME:cname.cloudxns.net., MX: mail.cloudxns.net.
 * @param string $type 记录类型 如 A AX CNAME
 * @param integer $mx 优先级,当记录类型是 MX/AX/CNAMEX 时有效并且必选
 * @param integer $ttl TTL,范围 60-3600,不同等级域名最小值不同
 * @param integer $lineId 线路 id(通过 API 获取)
 * @param string $bakIp  存在备 ip 时可选填
 * @param integer $recordId 解析记录 id
 * @return string
 */
//echo $api->record->recordUpdate(57219, 'w0', '192.168.100.210', 'AX', 55, 600, 1, '', 854069);


/**
 * 删除解析记录
 * 
 * @param integer $recordId 解析记录ID
 * @param integer $domainId 域名ID
 */
//echo $api->record->recordDelete(854067, 57219);

/**
 * 暂停、启用解析记录
 * @param integer $recordId 解析记录ID
 * @param integer $domainId 域名id
 * @param integer $status 操作状态： 0 暂停，1 启用
 */
echo $api->record->recordPause(854069,57219,1);

/**
 * 暂停、启用X优化
 * @param integer $recordId 解析记录ID
 * @param integer $domainId 域名id
 * @param integer $status 操作状态： 0 暂停，1 启用
 */
echo $api->record->recordAi(854817,57219,0);

