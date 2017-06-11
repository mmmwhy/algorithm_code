<?php

/**
 * 解析记录的接口逻辑处理
 * 
 * @author CloudXNS <support@cloudxns.net>
 * @link https://www.cloudxns.net/
 * @copyright Copyright (c) 2015 Cloudxns.
 */

namespace CloudXNS;

use CloudXNS\Api;

final class Record extends Api {

    public function __construct() {
        $this->setApiType("Record");
    }

    /**
     * 解析记录列表
     * 
     * @param integer $domainId 域名ID
     * @param integer $hostId 主机记录 id(传 0 查全部)
     * @param integer $offset 记录开始的偏移,第一条记录为 0
     * @param integer $rowNum 要获取的记录的数量,最大可取 2000，默认取30条。
     * @return string
     */
    public function recordList($domainId = 0, $hostId = 0, $offset = 0, $rowNum = 30) {
        //设置URL扩展
        $this->setUrlExtend("$domainId?host_id=$hostId&offset=$offset&row_num=$rowNum");
        //设置请求的方法
        $this->setMethod('GET');
        //初始化参数
        $this->initParam();
        //获取返回值
        return $this->response();
    }

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
    public function recordAdd($domainId = 0, $host = '', $value = '', $type = '', $mx = 0, $ttl = 0, $lineId = 0) {
        $arr = array(
            'domain_id' => $domainId,
            'host' => $host,
            'value' => $value,
            'type' => $type,
            'mx' => $mx,
            'ttl' => $ttl,
            'line_id' => $lineId
        );
        //设置参数体
        $this->setData(json_encode($arr));
        //设置请求的方法
        $this->setMethod('POST');
        //初始化参数
        $this->initParam();
        //获取返回值
        return $this->response();
    }

    /**
     * 新增备记录
     *  
     * @param integer $domainId 域名 id
     * @param integer $hostId 主机记录 id
     * @param integer $recordId 解析记录 id
     * @param string $value 备记录值
     * @return string
     */
    public function spareAdd($domainId = 0, $hostId = 0, $recordId = 0, $value = '') {
        $arr = array(
            'domain_id' => $domainId,
            'host_id' => $hostId,
            'record_id' => $recordId,
            'value' => $value
        );
        //设置参数体
        $this->setData(json_encode($arr));
        //设置URL扩展
        $this->setUrlExtend('spare');
        //设置请求的方法
        $this->setMethod('POST');
        //初始化参数
        $this->initParam();
        //获取返回值
        return $this->response();
    }

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
    public function recordUpdate($domainId = 0, $host = '', $value = '', $type = '', $mx = 0, $ttl = 0, $lineId = 0, $bakIp = '', $recordId = 0) {
        $arr = array(
            'domain_id' => $domainId,
            'host' => $host,
            'value' => $value,
            'type' => $type,
            'mx' => $mx,
            'ttl' => $ttl,
            'line_id' => $lineId,
            'bak_ip' => $bakIp
        );
        //设置参数体
        $this->setData(json_encode($arr));
        //设置URL扩展
        $this->setUrlExtend("$recordId");
        //设置请求的方法
        $this->setMethod('PUT');
        //初始化参数
        $this->initParam();
        //获取返回值
        return $this->response();
    }

    /**
     * 删除解析记录
     * 
     * @param integer $recordId 解析记录ID
     * @param integer $domainId 域名ID
     */
    public function recordDelete($recordId = 0, $domainId = 0) {
        //设置URL扩展
        $this->setUrlExtend("$recordId/$domainId");
        //设置请求的方法
        $this->setMethod('DELETE');
        //初始化参数
        $this->initParam();
        //获取返回值
        return $this->response();
    }
    /**
     * 暂停、启用解析记录
     * @param integer $recordId 解析记录ID
     * @param integer $domainId 域名id
     * @param integer $status 操作状态： 0 暂停，1 启用
    */
    public function recordPause($recordId,$domainId,$status)
    {
        $arr = array(
            'id' => $recordId,
            'domain_id' => $domainId,
            'status' => $status
        );
        //设置参数体
        $this->setData(json_encode($arr));
        //设置URL扩展
        $this->setUrlExtend("pause");
        //设置请求的方法
        $this->setMethod('POST');
        //初始化参数
        $this->initParam();
        //获取返回值
        return $this->response();
    }
    /**
     * 暂停、启用X优化
     * @param integer $recordId 解析记录ID
     * @param integer $domainId 域名id
     * @param integer $status 操作状态： 0 暂停，1 启用
     */
    public function recordAi($recordId,$domainId,$status)
    {
        $arr = array(
            'id' => $recordId,
            'domain_id' => $domainId,
            'status' => $status
        );
        //设置参数体
        $this->setData(json_encode($arr));
        //设置URL扩展
        $this->setUrlExtend("ai");
        //设置请求的方法
        $this->setMethod('POST');
        //初始化参数
        $this->initParam();
        //获取返回值
        return $this->response();
    }
}
