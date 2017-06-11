<?php

/**
 * 主机记录的接口逻辑处理
 * 
 * @author CloudXNS <support@cloudxns.net>
 * @link https://www.cloudxns.net/
 * @copyright Copyright (c) 2015 Cloudxns.
 */

namespace CloudXNS;

use CloudXNS\Api;

final class Host extends Api {

    public function __construct() {
        $this->setApiType("Host");
    }

    /**
     * 主机列表的获取
     * 
     * @param integer $domainId  域名ID
     * @param integer $offset 记录开始的偏移,第一条记录为 0
     * @param integer $rowNum 要获取的记录的数量,最大可取 2000条
     * @return string
     */
    public function hostList($domainId = 0, $offset = 0, $rowNum = 30) {
        //设置URL扩展
        $this->setUrlExtend("$domainId?offset=$offset&row_num=$rowNum");
        //设置请求的方法
        $this->setMethod('GET');
        //初始化参数
        $this->initParam();
        //获取返回值
        return $this->response();
    }

    /**
     * 主机记录的删除
     * 
     * @param integer $hostId 主机记录 id
     * @return string
     */
    public function hostDelete($hostId = 0) {
        //设置URL扩展
        $this->setUrlExtend("$hostId");
        //设置请求的方法
        $this->setMethod('DELETE');
        //初始化参数
        $this->initParam();
        //获取返回值
        return $this->response();
    }

}
